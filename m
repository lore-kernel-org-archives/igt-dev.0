Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB827C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 16:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BF51121BC;
	Mon, 11 Mar 2024 16:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZbXAhw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAC810E16A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710175097; x=1741711097;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hjaV9xW+W/41UOG7noTUKb7R/RQpOFC2bMH9Vpyo1+0=;
 b=bZbXAhw9KsBg54imfSDx3BtwOpmMLct5oldobfiGk824E/67cV+IssmK
 VF4tNQXbZb7nyaKH3I8YbT2v7xAYZQS/85v4gIsh1zdQMFAoLAAt2oeqF
 L+iDPTWGLCCUgpSi7IBSp7QvjSVpe0dP9bdD9DOuX3mmJbuWCmC0k0pin
 TNrMyOFNnYbumpDRpN9enZDn5T5Ep4XQMcOpP6FlrtCslvIZ4+k2k/9ZT
 8D0zuoKqVtqHBhKf5Aq14ooAelSsuYYdRi3E0NOm6icrb/OFGreVSMaxo
 t525XAzk840otPoHkmp89D0yLVDREiUYsTkYlPsQBbZPfQUXXs4ETP3/T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4707680"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4707680"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11114279"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 09:38:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:38:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:38:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 09:38:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 09:38:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WshkgMXUJ+O9nN1A6iLs0Jwag0RyHbFj3cuSiPRKqdkeOpETG+zGSEtTvYE+Cq3b7+L/yN4hYTsr4QWA0OpNdxCCyFf3WzXTqcdNykDFgWS1LWf9MRvR8FHDouTPW7K7s9j4CQNxZS/Sv58Pdy9n0jZG2g/yqAt4y0Zkj8HnjHrSDOwmvF4xUdSbyUq8SJtR9zcURuwPGAGkuAqz42ejh4B0i/T704b1hDcOXZCnNJRbDRmFCPcggFTrUyb7A59ueWYu5MI0yQlFLkWToQcljheL/+48nerdBFjXLCBZA2UdPCSGLAclKhBs5V8VMF5u2buQ0Z+3KgpSzSVHWATy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpi483NSPzrxdXYBMZfubeZomPxJQGrbw6JIVCgjLlU=;
 b=U9YXl0IXmwS8kTT5Uu+FFLe+L3/r+6EL0VYeqJPe8lCbzBOvbsB2JizeXX8DpEtMnPbMJ6Nf3d/+I0/nFcYfcmKeH5v7tiNYIpldwu8JvKqfBcHLJHJfc0zdGDAglOa3EBrPW8r+PK3Vd2sFok/+MwsCpGCeBybr0RvYRmF0ZX+WVLXOSUd4AJRjR2RDVhc/QLvV344fHtPvpuU5qHCVZX+l2gHzmMOhfRcjxlL6N/VFCKn4l7AeFsIzxCPpysAUWnDtelt5K4ShhhCXWtHrAQ3cwsqicwcTmoZRTXbp2JW9+0q08Xwzv4gIlv4B3NTUHROVCZmPw9zgJqLAisGAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Mon, 11 Mar
 2024 16:38:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 16:38:12 +0000
Date: Mon, 11 Mar 2024 11:38:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, =?utf-8?B?Sm9zw6k=?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: drop devcoredump before a PCI module
 unload
Message-ID: <z5nzsie3wt6p4ywln3ady63u5x6y3u6vocs7yue4m7cspqfkei@f326ho5esijo>
References: <20240308221800.48860-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240308221800.48860-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aefb33c-5a84-40a5-3508-08dc41e9a437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KNLaWKr+VWUuJuSxIVxDI/NtD1sSpAlkNDPwoVzYrxhi7leQX3K6tG/j1NvVNkE2eSQCsOa9a0qazTkccsRQ+i2BV+WaJmX6xF3iBsMLJrNoQWEIIE+mr/DJg2/Xq7dvjsUgg4aCgoY/r2M0U/xoLELqezcQBg6LyoAO1CVAJNvWJ/L+Vv8/+ZQHcmx6ECyWmlFziD8WzHUgk3I22UlU4xSf4vwpDL4g0RXO0Nx6QQ23OYDifV+3kDBqeg2Td55+h8i3PysYRqiCEddhdRQMb5I3THDsqGhTgEKXkzlcBZv4q0GY8krfQo6c9QTL6JyVUCpjgEmwToce+hhR39KAV79u+xBgFjQV3j24D4ljB/o5FDRtK9QUbj2SwC42tGmyJxzmW2F2K5nK4n4z9rwGzmZ5L4ni/rsZ6ldBqrt+q2qMRbsRhktaPg2VwTHtJOQmv5dtw5/RolBxzokq/zIVSBHALDfHTXA9dkTo0S/yEF9N/VNQKsZMYFovfeFEobUUS9hPwJ0XXrT091+A6oL8hjOFSQ8vfYQj5If+9up/zrE+4oIns7vpzLGgHhjKIgr1uHlkzlhUOWTeeuP/R0lUtfkLHta7w6GTlRaK0sVaRV5xsDe/RYBj7TrmemVQ3Hngk9MGcclZOeaikndKYDunPP3HpWCmufzVp3mimwsDC6M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Tpj6/i88cAcgLfR2XEgYdIGEyaMr3sXtFFTOzMQQ0Hx9QD6Eb+WsEAPfIn?=
 =?iso-8859-1?Q?AuDN9CLKFFj45KvCZgOGg9ntqWAy89qSIy+vlB04oH3v9elJjdYVUWR2n+?=
 =?iso-8859-1?Q?nYajHdqYCPPVvjB6P6bJI94OnDvnD8ETnZfY2awvYLEYaNKd0RyfHRPZLt?=
 =?iso-8859-1?Q?9YqXyguLpTQFP41fkYi8BKwgLHgJEDY8BLHe0VyfB6U3m1tPYEGYK0v5pU?=
 =?iso-8859-1?Q?TEPgMYev2XfkGgBH3t5XvgWC6O5V58xJ7QoG6aqwpizoxKzPirPEiS2kXZ?=
 =?iso-8859-1?Q?DkI2j7WZ9o+YO/Vp2mHzq23m0mh6CN0Vl/bRwETdhe0CqqKKM3EG24f5v6?=
 =?iso-8859-1?Q?HYpEpyv2LeVOe293XaxtorJmEKGzWdLKfKEMP+BEndNCbvgWJvZga6CfXr?=
 =?iso-8859-1?Q?lIZOEOTGaizgNcNSWzvQkMdF5881updgmIBXg2EFa680kO6pFLyLSrYLa7?=
 =?iso-8859-1?Q?bYH5nyTpt8uSYvW9UZk1/2zSs4I1d4pj87s1Da0yovDSGQOImmY2koHZv8?=
 =?iso-8859-1?Q?OtOunQne7BgEmLOUARIXJj8uiQxEzNGZYxUOBarysrOOPqGRh+QzrMX9vd?=
 =?iso-8859-1?Q?krtj4/OlryiRJRXUcv0Gk+jC4mnqxKkb8rV6tOdsikl39lthqf3yN4Lp/J?=
 =?iso-8859-1?Q?hYFu7iSN393zobo6kYypDUTdssTHmsU/naSh6reij4Wjx9su3fDYpa4T8N?=
 =?iso-8859-1?Q?dCF+HDFKUu5/z62w3SIXtByXYcscEXGpePvaXj1Crv6abcdK7deu32MEM0?=
 =?iso-8859-1?Q?1AUHVorTGegGw43lAFdvV7ckS8TnISER6TKB0tVFMrltRNZ6ievbdwp/pJ?=
 =?iso-8859-1?Q?K7JbEa/T5cC+JZG3+BOe6wFE/F6hwRuPDra1FmCFOwEji3yXjMvVhi+TyY?=
 =?iso-8859-1?Q?8nx3hL1f5LqzTn2r0kVyRgQuI2pDZJ83gVRIVWZnjK9R8ipbOGq7cQDynt?=
 =?iso-8859-1?Q?DWLXpricCioxrkSdPJVsZAsMjGVuE7kG9f/SDriNQ7/mas7W16VkINn0u0?=
 =?iso-8859-1?Q?UiAfSwiIGpwV1X9Gu6KXIo9KEGXhL0LDzeQiS2hUon0f55PQFUCE1ymRuR?=
 =?iso-8859-1?Q?pxhqIV8uZFFvt39bRBp+wI88BGSwaShUh7tUAOTjoBGXxfJo2H2M6CxVpA?=
 =?iso-8859-1?Q?0n+EZOOgBQryGm8CeR/fZqFnYfYPA0KMFhJfvr9aphP+rH0nVkWh6rsyCS?=
 =?iso-8859-1?Q?XCCuSqKycpY6b4nCDJDb4d1kywZu+Mk3RaHtzYe3VdzoDFdUowFmitX7Lm?=
 =?iso-8859-1?Q?LW4JjJ6r1C4FYHBwuuGk09lqvbMZ5HawF7nyCaVEyI+hh1mqz1+POPug0x?=
 =?iso-8859-1?Q?9dS5rH4T2Bwvwkv8v2f8E7W1pn5UVIarXvLkgq2+dvyhxxEkZs+iol9T54?=
 =?iso-8859-1?Q?+KBV4YyYfThS2DJFaVNLVB9sHP67j2qeunqg4LmdUpgybY848CywE7HU9j?=
 =?iso-8859-1?Q?6fhVBQc2TZHnik4i3xLGSCltyZgg4RKYt0ouCtIXcAzZDej9KGsfd3mZ9D?=
 =?iso-8859-1?Q?nnQQFW+g+T4nS0ii3RK3ibLwaC65a4yLFuwOHLnrSaKcZXcZ7xXXoTvcIT?=
 =?iso-8859-1?Q?zx/7+7dDxv3B2jMbPkDbTBirE5NI6x1bA1MIq+CcPPtF8WdsV4ybHldu4y?=
 =?iso-8859-1?Q?8gF/eeeEhB+DQhuo18+4+KaAfdi8ZJSlux8JQdj++6o47R9dXIHpYTSg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aefb33c-5a84-40a5-3508-08dc41e9a437
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 16:38:12.0376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vckxisQW+9wLOggw/BpFKbN0beeMiq9WYrzbuAkwW/IqsoudYx2VMkc6833J4/JpLwoA7kuxN+1FemyLYcszFkZ69b0lMox7keaT59Ben2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Fri, Mar 08, 2024 at 05:18:00PM -0500, Rodrigo Vivi wrote:
>devcoredump holds a module reference, blocking the module removal.
>
>It is intentional from the devcoredump perspective to keep the
>log available even after the unbind/unprobe. However it blocks
>our module removal here.
>
>v2: Accepting many suggestions from Lucas.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> lib/igt_kmod.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 55 insertions(+)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index cc242838f..14d51f4f6 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -323,6 +323,59 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
> 	return err;
> }
>
>+static void igt_drop_devcoredump(const char *driver)
>+{
>+	char sysfspath[PATH_MAX];
>+	DIR *dir;
>+	char *devcoredump;
>+	FILE *data;
>+	struct dirent *entry;
>+	int len, ret;
>+
>+	len = snprintf(sysfspath, sizeof(sysfspath),
>+		       "/sys/bus/pci/drivers/%s", driver);
>+
>+	igt_assert(len < sizeof(sysfspath));
>+
>+	 /* Not a PCI module */
>+	if (access(sysfspath, F_OK))
>+		return;
>+
>+	devcoredump = sysfspath + len;
>+
>+	dir = opendir(sysfspath);
>+	igt_assert(dir);
>+
>+	while ((entry = readdir(dir)) != NULL) {
>+		if (entry->d_type != DT_LNK ||
>+		    strcmp(entry->d_name, ".") == 0 ||
>+		    strcmp(entry->d_name, "..") == 0)
>+			continue;
>+
>+		ret = snprintf(devcoredump, sizeof(sysfspath) - len,
>+			       "/%s/devcoredump", entry->d_name);
>+
>+		igt_assert(ret < sizeof(sysfspath) - len);
>+
>+		if (access(sysfspath, F_OK) != -1) {
>+			igt_info("Removing devcoredump before module unload: %s\n",
>+				 sysfspath);
>+
>+			strcat(sysfspath, "/data");
>+			data = fopen(sysfspath, "w");
>+			igt_assert(data);
>+
>+			/*
>+			 * Write anything to devcoredump/data to
>+			 * force its deletion
>+			 */
>+			fprintf(data, "1\n");
>+			fclose(data);
>+		}
>+	}
>+	closedir(dir);
>+}
>+
> /**
>  * igt_kmod_unload:
>  * @mod_name: Module name.
>@@ -341,6 +394,8 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
> 	struct kmod_module *kmod;
> 	int err;
>
>+	igt_drop_devcoredump(mod_name);
>+
> 	err = kmod_module_new_from_name(ctx, mod_name, &kmod);
> 	if (err < 0) {
> 		igt_debug("Could not use module %s (%s)\n", mod_name,
>-- 
>2.44.0
>
