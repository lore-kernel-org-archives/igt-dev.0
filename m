Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43428C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 16:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75BE10F97D;
	Fri, 19 Apr 2024 16:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y75m1jDr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0780E10F926
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713544554; x=1745080554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rp2G5qrfCO7qEvofQG2u0bGokphimWNSKMy3J15FjBk=;
 b=Y75m1jDrqiihnkGFU7XX4zKba4DaqoNIZE5JJRGbrhOKK1x5ajoiG3gl
 CHMt9wvR4zxC3fV9OmqcJ3xdoWTPJC+cKkltHRMOZcfvTrY27RG8P9lU9
 lbnGTDBfIb3/MR7nN8KqjqRLbYX1GKVowA1gT/FtQ/pNu8aXBu1vIUF0W
 1bqeALN3flXF9qQgBARAJ+hWU54cVI8WYLTxcURySu6Y3PBub6VCIxys/
 yo+gsCXZKPlab3y0aCaJL+izSjOCH3WZAuU7jqJ8kx/4yosUQLXmktzzE
 i77o5tyOzC+ziVEMwRwxJszmuPPTn/h5eHoS6O06Xd7CUSGE07c8qXeLs Q==;
X-CSE-ConnectionGUID: vz0p7ARuQmKTDXEaaKAiQA==
X-CSE-MsgGUID: MxifHE6oRDO/Yj9rLF1aUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9014175"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9014175"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 09:35:53 -0700
X-CSE-ConnectionGUID: 9K1ZkTW4SLWIozzoEsuNTQ==
X-CSE-MsgGUID: 9CKTD9uuSEqPVEtYZVEm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23449364"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 09:35:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:35:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:35:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 09:35:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 09:35:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B37I80DHiRpECJF99Qb88QGUe448wOfbsZcImWUw8PCRRyNKB+2y2gSWJaWtpL3kInKkIaZU30aPAL3oQ+W/xzipwGUAtfBGeXq8xNv1ATNCCh8bFNlFk4owqv4bLSdt20yE8Q22q0pZzsF7sbGRLc3i4IKu43f6vx9aPki6TK7xp6UWKWEEJ/5XCaYEY4lL4CTkARyMtJqnEfLS7012LDFRcgxcBPHWUZ3A5HBvxHhxjskzbkyPhTVYCyajfISnCg+VcGKWQehwlrhI6g9wd2E4UKLW6M7083rBNzsT6BEz5h4ss7CogrusOrkKzSMYyU9udsWfxjjidJtD0GIqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGMNoyeBsOu7tYSpy8Zn9C/3DXc5/HiNSPbCtAe98Ac=;
 b=NTEMZmfSc22njOCHRU1M5W7XRj4tbROBvdHcoByHssgi4KCcfVBHJTtoI5QwuDN+r2f+Pc/iZh2czvW2gB+SMcd9m9y7MfEwhoameDFIlHtvLSBcQtpPfIq65tPUbMYD9MFHxeA8wplWV64sUvKU757uV0+3c0OZveOO/9iMmEvpHTltQHIaf8OlHSnKS2uaF4wCu3a1h2DaveCf61Oa5vZWPT7+Wx6h/ynF+4J6Y+ZDjVaQ8V2PVaR7YB9N6EwxWiK96N7v7xfcalH3eY8gryw2mrkXHDynRQSzQJn4DAQu2ZGhnNsDxbeRvsLSjVNbBqodbxd1bhKPacXcl/OMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.14; Fri, 19 Apr 2024 16:35:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 16:35:48 +0000
Date: Fri, 19 Apr 2024 11:35:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 01/12] lib/igt_drm_fdinfo: Stop passing key twice
Message-ID: <u7r2vd45ex7k5yyji3bfxysck5vtlsp233nofahzxwpcx4cqar@nffa7y555i6x>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-2-lucas.demarchi@intel.com>
 <434d02cf-c683-40e6-b2f6-3462516a104e@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <434d02cf-c683-40e6-b2f6-3462516a104e@ursulin.net>
X-ClientProxiedBy: SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 7febd076-5c93-4ef1-7036-08dc608ec4d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: ullIZUMlPTvo9Dgau2CHDpcttWgB2iOaxpplNUJ04CjHoxcjCQFngcahzxFW6Ghe5sYuQaovvTLnxQykosM/sZHZyZgZwZWZ7JD3VXEiKA9LqK4eD2BtYRW0KRAYXRVN1DmkstiIvENywxGj8R5heAEM+uc1aU2RxwjJGSIPQyaXXyxIik/iuWxhxwXpDTOZ+DCNdh/JGrmrfWq2m52//Ej+kCTxklHTa6mONyFmKLXnWrxj/gUB7yxQk3JOZtXi8hU1ROP9nlwXzGG2g810jxOVsu+tvV+x4boKknlvXHedX7U4u0zOCYuc1UuYqBWRpZGU0znysgwIbxs9laCm+qTMVIgX9vwGw+HYjQ0H4k1Y92rHEKOdF3e7LGamQwKIovVv5foFxmeD1xrD9FR+zhlY+2KkbVpqnomBlvb7v57cABd0K9Ol629GbpgSaG6iQ/eSd8Nhmy3wBq4SCEf5xuh1djut60abacnwI+XHfOWYEQOsRCjD1LId3M2Bu8gLsIr5QdNuUVq2OU7pd+AbpLN7ngIenCRvMYm+bCFhxSRf/igyX84Nv/4nbfjAm/Zmwr+k2f7nI4VL5JmCP0IyO+wKvQiGby1rhXtOm538wgacFO1G4UG9KHr1F7B46j9EWVe6jFzlkyE6RMSM7SW+Ex5cMc1+wJrEtxbVMD371AI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYxv0r/HnWsLHzNDcGZ1He8xnWknyMTSltU+R11Bg0wPHji95JWeHqyFrEkY?=
 =?us-ascii?Q?UqwKktvPy1CMJ4qG9pxiDkjdjN+3AFV7cyl8StDJRSYd9P9OLNNN6QuU6ZnW?=
 =?us-ascii?Q?D662Em1dCuxt3oY1RiRCU+TWgIi60Y7ICc82Vcn5smJhB5UxWWCvsogy75eA?=
 =?us-ascii?Q?CMUOPJ2kfUn5J3w7TEpBx/Jo/zdthTVebzvruQSTnq5CPLvHTDWr7M4k85Uo?=
 =?us-ascii?Q?RD2/AKo9Af4FIGhc/5qd+7FqzMIpgGfS/w+4yG9gIA+VidYZUY+jO057ifuZ?=
 =?us-ascii?Q?M0h/PvORv2kTvEjZ4/3vGqe7xcBeaBKoTyK8KDUpBPvNsnFbRGQDzFOJY4Fv?=
 =?us-ascii?Q?ILJrMwMzI7ZVrHdVdz+SY1Mirt+XV6kETY1UXZ0UxxUVn3aR1qPwHfKQOSKp?=
 =?us-ascii?Q?VTl9JDNKRJs1FdNAolXtyXbyfYzf6WqZjer0hI62cFB4jVL6+es/zymYineI?=
 =?us-ascii?Q?XK7mSTi8luKI6ae7toDkm75QPJQtV4GGgbyBc7btWeuAJfzRgz0raiuvRTPv?=
 =?us-ascii?Q?peQhskbvE417amcU77dXYGR2p6aO8ErSm0UbCOeSj57A5rGAA541UGuS5ZxL?=
 =?us-ascii?Q?Zt+OWSZ1+8hWyHezsVifoQx5DRZMogPS/w7nZ5oWjnzdZQJEGLYx0KLYAMDt?=
 =?us-ascii?Q?SAgsR8mMKy4hcaEdJEwzyL53SNtU3aGobpj0zScAZ8Ncr3OUlIIvyiPC5jP6?=
 =?us-ascii?Q?f8Pip5xNVjMbys0aJXNN81kmTmzfFPXxrMhWg/Sz3cpClxNINGVy3N4lp5Ds?=
 =?us-ascii?Q?cWAR0csirQx1BnWe+8HMc7yBmv/SkBLgwHcV0njSxbz7e8edDlB+CmKpceK7?=
 =?us-ascii?Q?bW/E9EUdiPgLtcCeKlm2qlEMZRpK5kTe4+DTFKpiIMF8RGDkgZKIgyJJ9Pp6?=
 =?us-ascii?Q?Glk5F19eGu7PG4lOe5fkG7zmsndROQBpOw1ryvQ/mXAn7B04pYmEu91A70wE?=
 =?us-ascii?Q?cphIpROjnd2zEVQnrZsRP3og3SCCiS6KWOV/gotgNJ0flUAv0SvThaYZuB/S?=
 =?us-ascii?Q?ktdBXZnosSQ4ABugq0XBRKR0Clfiir7frj5Qz8wNYglsVZaD5c12FD8lLxXz?=
 =?us-ascii?Q?rmA33507aAa7GecbJSmZjmQq3Ko6+J0IlKbm1NaZ+um6xZJJ7bbXEEhlk/6d?=
 =?us-ascii?Q?TKMtFZy5cPxf8duSd4dF7q/fy2LFyEHYdJC30Ql1lMBaZZK+AOghLNa5b0sN?=
 =?us-ascii?Q?Ybtw4mGcix155m15PL5Mc6DHTw2sWDuddG4isf76wzLUHQ/w+wDaxlcUGMlb?=
 =?us-ascii?Q?AsXbX7a3TEsdFCoUnLogKAbpFPzZUZv4ksF/PeUjuDCElh1bARCVqnL1kaul?=
 =?us-ascii?Q?1pIk5271Oa2ipO3CqFDY9pS8SpZMXjZeA3avITnzv9E0YDzKMgNqIwVVLK8o?=
 =?us-ascii?Q?dH8MhfbquhbQZyrhifMtdp+13cC/fmJEb7CyhDddiLDSCjoSvwzSNrROc+cf?=
 =?us-ascii?Q?yEPPdxfsjQGHwy9E8C7Rp72ZlcxuCL6Nsmm6owSPdxW9iFEQQOxHYRonW76Q?=
 =?us-ascii?Q?aurDT/bYsw1Z8omyANtPWCUsy5JKBkaJcPil8InRqWrq1FH9ROHGn8c9RYLN?=
 =?us-ascii?Q?FLTRcTttSaKYcXdYj/+uVoyTmYHS39kGCFcrduj4lnJNY4ZRMyasTNMa2rgr?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7febd076-5c93-4ef1-7036-08dc608ec4d3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 16:35:48.7717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5IrTXiR+3aRd5SS0JRiKgm1ZhPz6XTRxoyTZIB6vkftdfFg/xjfmachUUKQZkbJ0hECac6OpcN3ZDH01vHfWCekXJdHWHbbCDogWPlpAzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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

On Fri, Apr 19, 2024 at 08:42:50AM GMT, Tvrtko Ursulin wrote:
>
>On 05/04/2024 07:00, Lucas De Marchi wrote:
>>Change strstartswith() so it also returns the length, which then can be
>>used inside the branch when it matches. A good compiler shall optimize
>>out the strlen call since the argument is a constant literal.
>>
>>With this, the find_kv() is not needed anymore and the difference with
>>regard the other branches can be summarized with a new ignore_space()
>>helper and the fact it matches the entire key by appending the ':'. The
>>helper is added on top of the file so it can be reused later.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  lib/igt_drm_fdinfo.c | 87 +++++++++++++++++++++++---------------------
>>  1 file changed, 45 insertions(+), 42 deletions(-)
>>
>>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>index 18dbb5d0b..bfc946f24 100644
>>--- a/lib/igt_drm_fdinfo.c
>>+++ b/lib/igt_drm_fdinfo.c
>>@@ -53,6 +53,14 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
>>  	return count > 0 ? count : 0;
>>  }
>>+static const char *ignore_space(const char *s)
>>+{
>>+	for (; *s && isspace(*s); s++)
>>+		;
>>+
>>+	return s;
>>+}
>>+
>>  static int parse_engine(char *line, struct drm_client_fdinfo *info,
>>  			size_t prefix_len,
>>  			const char **name_map, unsigned int map_entries,
>>@@ -104,23 +112,6 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
>>  	return found;
>>  }
>>-static const char *find_kv(const char *buf, const char *key, size_t keylen)
>>-{
>>-	const char *p;
>>-
>>-	if (strncmp(buf, key, keylen))
>>-		return NULL;
>>-
>>-	p = buf + keylen;
>>-	if (*p != ':')
>>-		return NULL;
>>-
>>-	for (p++; *p && isspace(*p); p++)
>>-		;
>>-
>>-	return *p ? p : NULL;
>>-}
>>-
>>  static int parse_region(char *line, struct drm_client_fdinfo *info,
>>  			size_t prefix_len,
>>  			const char **region_map, unsigned int region_entries,
>>@@ -205,6 +196,11 @@ out:
>>  		}							\
>>  	} while (0)
>>+#define strstartswith(a, b, plen__) ({					\
>>+		*plen__ = strlen(b);					\
>>+		strncmp(a, b, *plen__) == 0;				\
>>+})
>
>Did it have to be a macro for optimization to work?

if it's a function, it won't be handled as a string literal anymore and
may be a real strlen() call.  The compiler may or may not detect that.

>
>>+
>>  unsigned int
>>  __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>>  		       const char **name_map, unsigned int map_entries,
>>@@ -222,31 +218,39 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>>  	while ((l = strtok_r(_buf, "\n", &ctx))) {
>>  		uint64_t val = 0;
>>+		size_t keylen;
>>  		const char *v;
>>  		int idx;
>>  		_buf = NULL;
>>-		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
>>-			strncpy(info->driver, v, sizeof(info->driver) - 1);
>>-			good++;
>>-		}  else if ((v = find_kv(l, "drm-client-id",
>>-					 strlen("drm-client-id")))) {
>>-			info->id = atol(v);
>>-			good++;
>>-		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
>>-			/* optional */
>>+		if (strstartswith(l, "drm-driver:", &keylen)) {
>>+			v = l + keylen;
>>+			v = ignore_space(v);
>>+			if (*v) {
>>+				strncpy(info->driver, v, sizeof(info->driver) - 1);
>>+				good++;
>>+			}
>>+		}  else if (strstartswith(l, "drm-client-id:", &keylen)) {
>>+			v = l + keylen;
>>+			v = ignore_space(v);
>>+			if (*v) {
>>+				info->id = atol(v);
>>+				good++;
>>+			}
>>+		} else if (strstartswith(l, "drm-pdev:", &keylen)) {
>>+			v = l + keylen;
>>+			v = ignore_space(v);
>
>Removing find_kv looks like a slight negative, given how now all 
>branches have to repeat v =  + keylen; v = ignore_space(v).

the ignore_space() is later removed (my bad on the patch split here
since I only noticed later when converting to strtoull())

>
>I wonder if it would work by extending find_kv to allow prefix 
>matching mode, something like this (only two branches show to 
>illustrate the modes):
>
>...
>		} else if ((v = find_kv(l, "drm-pdev", MATCH_FULL, &keylen))) {

with the downside that then there will be a real strlen() on the key.

I can try playing with the patches to bring find_kv() back.

Lucas De Marchi

>			/* optional */
>			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>		} else if (find_kv(l, "drm-engine-capacity-", MATCH_PREFIX)) {
>			idx = parse_engine(l, info, keylen,
>					   name_map, map_entries, &val);
>			if (idx >= 0) {
>				info->capacity[idx] = val;
>				num_capacity++;
>			}
>...
>
>?
>
>Regards,
>
>Tvrtko
>
>>  			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>>-		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>>-			idx = parse_engine(l, info,
>>-					   strlen("drm-engine-capacity-"),
>>+		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
>>+			idx = parse_engine(l, info, keylen,
>>  					   name_map, map_entries, &val);
>>  			if (idx >= 0) {
>>  				info->capacity[idx] = val;
>>  				num_capacity++;
>>  			}
>>-		} else if (!strncmp(l, "drm-engine-", 11)) {
>>-			idx = parse_engine(l, info, strlen("drm-engine-"),
>>+		} else if (strstartswith(l, "drm-engine-", &keylen)) {
>>+			idx = parse_engine(l, info, keylen,
>>  					   name_map, map_entries, &val);
>>  			if (idx >= 0) {
>>  				if (!info->capacity[idx])
>>@@ -256,25 +260,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>>  				if (idx > info->last_engine_index)
>>  					info->last_engine_index = idx;
>>  			}
>>-		} else if (!strncmp(l, "drm-total-", 10)) {
>>-			idx = parse_region(l, info, strlen("drm-total-"),
>>+		} else if (strstartswith(l, "drm-total-", &keylen)) {
>>+			idx = parse_region(l, info, keylen,
>>  					   region_map, region_entries, &val);
>>  			UPDATE_REGION(idx, total, val);
>>-		} else if (!strncmp(l, "drm-shared-", 11)) {
>>-			idx = parse_region(l, info, strlen("drm-shared-"),
>>+		} else if (strstartswith(l, "drm-shared-", &keylen)) {
>>+			idx = parse_region(l, info, keylen,
>>  					   region_map, region_entries, &val);
>>  			UPDATE_REGION(idx, shared, val);
>>-
>>-		} else if (!strncmp(l, "drm-resident-", 13)) {
>>-			idx = parse_region(l, info, strlen("drm-resident-"),
>>+		} else if (strstartswith(l, "drm-resident-", &keylen)) {
>>+			idx = parse_region(l, info, keylen,
>>  					   region_map, region_entries, &val);
>>  			UPDATE_REGION(idx, resident, val);
>>-		} else if (!strncmp(l, "drm-purgeable-", 14)) {
>>-			idx = parse_region(l, info, strlen("drm-purgeable-"),
>>+		} else if (strstartswith(l, "drm-purgeable-", &keylen)) {
>>+			idx = parse_region(l, info, keylen,
>>  					   region_map, region_entries, &val);
>>  			UPDATE_REGION(idx, purgeable, val);
>>-		} else if (!strncmp(l, "drm-active-", 11)) {
>>-			idx = parse_region(l, info, strlen("drm-active-"),
>>+		} else if (strstartswith(l, "drm-active-", &keylen)) {
>>+			idx = parse_region(l, info, keylen,
>>  					   region_map, region_entries, &val);
>>  			UPDATE_REGION(idx, active, val);
>>  		}
