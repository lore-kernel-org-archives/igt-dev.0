Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACADCD5BD0
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 11:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A7E89DC0;
	Tue, 26 May 2026 11:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lP+l8YtF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AA189DC0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779795628; x=1811331628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ihfCXOPv96D5VUBsAsC3bAQ6ptj+fw9ubalcYqlUugQ=;
 b=lP+l8YtF59t4RSgtBoeuGFLRbahgSpbxHb5Otxo+LndkHle3Me/+hqfZ
 eifLUOQ8NIidHteFV1zwo9who/0041XSRdb/ElsAgbo8LtQ2G4Se/kEab
 hKM4B7C50dnWUbCWo2HDRG997B/BBIRxnUygKwmwrozA7tjJGtOLPy66B
 L+G2ZwKrXCNXz9w/4svWej92IOqkfOIx3fTaS2WlTZXHWFbwevlB13umT
 mKlTWUSRx6OCNbdKSXZQnoSJM/oWDSPv9iTpsTBIZHz30rkJ9LKmp4msH
 ZwzeFqGfibYEiXrhBeLQiEoxznJZA1zRd4PESnnFcLJ5fj1FszjVWrNhM g==;
X-CSE-ConnectionGUID: fhefNQsSSX2zXtHHFzVXdg==
X-CSE-MsgGUID: 7z9S/VfaSPOCwGlzc7fccw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91175074"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91175074"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:40:27 -0700
X-CSE-ConnectionGUID: MgmLaZUrQCu7pqtirq+3vQ==
X-CSE-MsgGUID: B6yuTL0ORQqRsQkP7nzg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246981232"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:40:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:40:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 04:40:26 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IP05w+JJi/dtdhh6p0urw9JA2S10DOF5eNoGAaquOWdUI+WoT43WfO2BImLwjCagX/jwJpCZ5yLBr49+xO2201/m7Ug3TvjTxd/GH9tutKQJVc/jBo5kyCCclBE2U8QxIb2DtCSvy3Q0HVPIbaWf9DaZOpAUgHkigd3T2LpM2nYU5n5KIYbjcwVcc1UvnapaoTjFDF6epDyQ1en49MjZ5TBtwOq+zRHdXbpdPHAf+UQ6k2jfwXC1GUaJW9iRLw4HCvldFe5ykmxu+5Ij5KwYhG9OEv3bF6l/6sg74MKhkl1V6qM7KYVP9bcpxCaRBS5CWViSoJ/0DwEB4I8FonOvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzEBKBPxwYnJQ7iTFWD4TenJlexnKTcZOHLIQ+9pslQ=;
 b=eCVEp7dAM686pJkmV1ZgG6j3GjniXCPWLBfXT6ajxTtlWpp8O8nBF/86KZ/1SnT1ttii/MSYyUDqWMunvGwNolq6hjdPLVVvAKlA6lDwmQW2cJVA7xzDUN5+1dewix28XDxoAAaqzhpsyGBbLgWZqo4BWRawYfSIWa+KACbVxf+QQMa4D/70QGwLnJuHEPOcuD1f1xlwbabSmZHWdgARz+NrNBN5VKQbqFfLR/+0NRN574Yrap0AuLEQFMVHr9W3mJneVC+GY2sL4W4wHbOiAteXyUAzITN2DHuKi5qS3lAZLrXfHaq966w+43BnbbRC9JHlvUn9rbnLw7CxxP4Ghw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 11:40:24 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 11:40:24 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH v4 2/2] tools/igt_power: fix crash on Xe devices by
 initializing xe_device cache
Date: Tue, 26 May 2026 13:39:54 +0200
Message-ID: <2ac3eda9b4092f9ea06a245b25f0d6cfa2ec0dfd.1779793676.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
References: <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 2015768e-58bc-48cf-af81-08debb1b9322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|6133799003|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: /mwqQIa3MEAGo/s0RGmeWm5ywwgSko8kiCvalnb5UmyoUC3Sp5zVbPHudDWr015HjJqut00gTxcJMUDRnZ952goFCLMGCR7k/HILmdH6V8OWvUpnQsiTxKanMD8C+j+xAOgdegBigdDsT8mFFkOpRXRJbKwfL6PZZrEHqAQXvXea/35JsA2iuxcXE62CARs2tU2dtI0AC+Zs8pVV5PxF87LOvciH26dqORExF7gx81hNBCWsoOpzojm/bb3Oh5RS4LCpHV2GtUiYcinnn9vydLrbE73nRO82qdzXYRVZ99Lu+PJeTUlD4+e++BtKRUV1hGnE/7mfgAVzyz4BFLW72D+QOmfm2OZsAHMq6BdM8HDATIQYF+W6WZHdJlXhiswhNuse6FOKda9AkDb/YnnJMTOY/Y9yzBVYCxBBcY56R9SX56uEqsXoCCV4jOeTnP5CQCLlWyJoYp2HRlOTh6MCqeLYZKRMzCn4eC2Xmw7LTTHY137ijihOsT8gi1GjYY+/rppsH2suXNsDHQtOfO0y01URZk8xBkgD6uYE3Msq/dGU0ua44DjECouTwuyf1w3sSwuA1nWSMFXDBWkaFJB3wTVPo9WKJrUMMl5avfoG/iWYCkTrEv121keXU6jEeLxTwHJTKcwLDybaBiv59PNJUFi4B3gTQ4mhFq+N0kS6z8/DlIPU1LfIhb9qgztJCID2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(6133799003)(56012099003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d9B7Rrlye2EjlUZcQEZdm0gXjKpzCu938WiWhjLuuKFalSmXB6ZmckZKBOUP?=
 =?us-ascii?Q?9ylTNz2E1YZj0QVY2/p64yb3mFJ38oxC4wnGe2TQEORh9pwwFj8B3iZL/ge4?=
 =?us-ascii?Q?WTIMcq/1iVNFVUb26JvjlBNtTZQ4JDYk0eDy/MQa4jMAfcvQis7XOC1ACVJi?=
 =?us-ascii?Q?lk+WbT8dEeU3/63uCL0ej4+T/uXlUj8RAjZroI8+HXpY/4F5yjfKxW4yDWDt?=
 =?us-ascii?Q?WWXrbPTiEEfO/gmLwwHRg+u9qSuKMFl+qjJX8E78jrJF4RvZ8aeOVydGC1Cn?=
 =?us-ascii?Q?CWOFRbmslSBHPouTJhomfUrMkX4ofEj7hja8eVc6mara9RS5HNt8a1KWD9c2?=
 =?us-ascii?Q?gDLnTx0SB9KGBfHY1CaPaRvZAOM1PA40dx3HEAcDT+Vad0dkwtibAdom8DYj?=
 =?us-ascii?Q?YqSSNvn2+8lCuswELyH47mupL3TDsPYfGhvJ+JXmTcJf5xYTscRqtRaqEY+w?=
 =?us-ascii?Q?TfmPCiduxKpUwRXbu0B/Krp3rehfg84RCsAg7i+CTpqx2TbL3/PhskuJYkfV?=
 =?us-ascii?Q?2n2oAM6yuHXTsBh+oJqSNcNXZDrFJ/o6IpMAXZVRvMvEq0jGLg0rG7LjSUIS?=
 =?us-ascii?Q?X3A7dF87BzHSRmnNm881dvo8qKnNGt1vwpt/+PBih8tcVwN5HqM77jBcSvRt?=
 =?us-ascii?Q?RwL66h93/t337Zumhnpiz7vpvDKPx4LmLv+gpJEPsyaDlmkpa4dFZFJXNAYI?=
 =?us-ascii?Q?tukNdmW+NlY3npWMSCVF4H/KEm0KIubHOS7ZAM34QtROJ+vaAXf8c2OLr5VJ?=
 =?us-ascii?Q?+NhaTRrOzoA8u0Kqma2PE4WoTq6Myx2iSmpqSWtqEwzPPhH1XGcZ2w2gCJGp?=
 =?us-ascii?Q?iySBkkhuTYSh+K/A2qD43yg3Gq2L3T+hPP+bnbi9EPNZNc/ltiezlsEaeYO8?=
 =?us-ascii?Q?YD52YChtrsoH4cL7vtOVr1uxN2Vd2kwWQDJaUqtTbn7XELO2/rFZBlzeb6/X?=
 =?us-ascii?Q?cxXANqIGn3f/mlHLS5Q48e3byIAk6jTzSMf6a/gVSO4SjlFt9ohDhNxWqFCG?=
 =?us-ascii?Q?5f2LlyMvn19LBBx5jKfXRbZ1/TiSyT4Wej2EcA7Sx6R6PlyDRwQmXxXgkJab?=
 =?us-ascii?Q?Krgtel0iOeyqCtt+aTWqswb0qwsEA+8pIcoWkAvWav1SjmMadlHk+IKRbeJh?=
 =?us-ascii?Q?Gy8z5pH6YhVHOWHbAMWwth8Ad8j9OzGdtUJV9lDngPb8i06unEH+FR29CPKt?=
 =?us-ascii?Q?1K/hIVZZe2TiuQ79DEeGrpOe+d7G43v45+8QPVxsPT87PCiS3rwPdVagJ1Rk?=
 =?us-ascii?Q?i0khVuN2+fB0eHBrtzy261nmkHy/pkYvtxdkJKe+DadoSKlQPtaGT8UmmeIQ?=
 =?us-ascii?Q?S9hWBsKP2wd32to106k0Z74qeHyMN0dsGgycmGRXTGpjJPBWY4/VC7WjIaNO?=
 =?us-ascii?Q?xkOe4spV4Cot+VgeGWXhaQsw9CI41vaZXFqIVWdyADB9DKbUXF6+goT/pcQJ?=
 =?us-ascii?Q?lI8udt6HSEJ3NDDKk97gHt2F6SE1A6UjRKT0yhlom919alTtMdZfHT085wjs?=
 =?us-ascii?Q?xyCDoKw52gM6GpSz4fp1V/s9hIYjot7wLf935eoYUseFk6Yu0+Anob2mNW21?=
 =?us-ascii?Q?GeZFb+0OyhD9EmCvhE75pE1PLNTWkSY10vJ9w1AaGVHFKrFItN3o5+jdg0kk?=
 =?us-ascii?Q?ZPL90P4esv6T+rF43Afswle68Jf6M3HfdWpZWq9jnPGY/49W8S0MKQr+jEFl?=
 =?us-ascii?Q?CGDqp23iQ7QuntRKj2fONgUlFnPXejM2yHF+XFPtmEQWhnOyEZuw3Z+EKt24?=
 =?us-ascii?Q?pDaIZ9HqWw50+RMRbBkW+Gn/07QWi7w=3D?=
X-Exchange-RoutingPolicyChecked: gSRmQexuqYp20yofmSORwYFDiYP0TPsIzMBrkd3s75OgLWscV77mPmKwiqTDHvbkQM3oBFQ+RVnc5ndJkciy+uiTJHgIL2vht6V9ElDszT4EFwILPFYhVyHFSHddZ1uIIurBRz5XuWXKTHtgBztJmnBPwbMpMdydFCu8Mp3Xgg5fGYAS3rrj5mr9chqpbAIS9bCsVIDob2bTYA9wDno90JLCxiDYguJzXVH2znNYn6LoH08rekT/jAxddPleOm7Ql4VxwJGrac9Lf3j0qnF1VsmhbGjyJnkY6aq8SUbB0uYDY6oGA9vW8KAnPmnYEHnWD2hoWYQQCU8ViehQarNvhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2015768e-58bc-48cf-af81-08debb1b9322
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 11:40:24.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPpjKpcUFs6AwypsKdLZaIYnVhK5DiiACTnIFfgwV5Xrsz2ihxuy3Di9uVCjumhkbW0JULZJ5YA1WjtSwrk2XM6vLwjMsBHt0t+NlOHk9+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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

Opening a DRM device with plain open() does not initialize the Xe device
cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
it reaches find_in_cache() which asserts the cache entry exists, causing
a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev

Switch both open/close call sites to __drm_open_driver_path() and
__drm_close_driver() so that Xe cache setup and teardown are paired with
the fd lifecycle, keeping igt_power free of Xe-specific handling.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/igt_power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/igt_power.c b/tools/igt_power.c
index 6dd180d34..97d95e7b4 100644
--- a/tools/igt_power.c
+++ b/tools/igt_power.c
@@ -38,7 +38,7 @@ static bool prepare(struct measurement *m)
 		int ret, fd = -1;
 
 		if (m->drm_device) {
-			fd = open(m->drm_device, O_RDONLY);
+			fd = __drm_open_driver_path(m->drm_device);
 			if (fd < 0) {
 				fprintf(stderr, "Unable to open drm device %s (%d)\n",
 					m->drm_device, -errno);
@@ -54,12 +54,12 @@ static bool prepare(struct measurement *m)
 			else
 				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
 					m->rapl_domain, ret);
-			close(fd);
 
+			__drm_close_driver(fd);
 			return false;
 		}
 
-		close(fd);
+		__drm_close_driver(fd);
 	}
 
 	return true;
-- 
2.53.0

