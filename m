Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA1EC43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3822610F833;
	Fri,  3 Jul 2026 14:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbZOHj2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938B910F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088985; x=1814624985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ixHk+I2azGOG2xskbm6zX7LFC4he8WBXO7t++gSAGKo=;
 b=NbZOHj2syZO0E9PrDhOadjkE/7jMlvhbnRH1g92t/W0cYp2j9FJVSizF
 qNH56bqI+0Hyo6tFNhJLB7LZeDrInW9IgXYJFqpXqHSBX9Hirn5YyGk6Y
 fjgopFuGPDPF0Cql4cM+hTKdcv79SMUyvxtJQNFW0y0pPYBfosNuwAGW9
 7bYDQ9EJL2jsYTFfvW8zZwczmVMlpp/XH9o9R8oS65yddeRHsraSpAP4t
 Vwi38/8WQ1eJLW1xJ5zgQMbbFos+Fp3XKDmZ26+XOb17VeXYFKL3hybVj
 5wf+Z1r5M0rcno+lAUj2c48+3Rgv+o/slKNyDPw3OBkp0hzTc/Z7ta4a9 A==;
X-CSE-ConnectionGUID: n0b5J+cvSQmomYvx6KLkjw==
X-CSE-MsgGUID: G9RuaE8wSpaZlN+JpRRpsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87523847"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87523847"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:45 -0700
X-CSE-ConnectionGUID: T7ea394CQEiZ1ZfhhpFrhg==
X-CSE-MsgGUID: /m+fmBqQRPuuS2nBQDheEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="250476325"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWFzy1jqfplXixuqkIVCjz+tUUKHf140AKrovwOdw9p03P42m7FyCiTcjLqirKLZuvPRQkebI0FqCoVdHBJavRDT65rSHnxsZI4PlrJvJtIHJgmPqrX5gk7aROTJpw8WWTbIXgw6xNjQb2QkCEXANIb8DT5g61W1AnCYrgr24im96j2vcQHrWOEVhBXO03lew73Ve4nuvgrHBOCfdsw75ZTHijtOfanjKgL2vB1lmSNxHbEUcwDIGoLQ1gUYUzODs8MFjbBMaMXUa3IlBl4IwDXBPDUvHkY5goVyVcJK5FTbgJznRo2sGz6pGfbwdamaXA1o0b+hUJUm3gVFXkcqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTnQmOXEgwbUHCkQUdBPXz2cw7JP78iboR1zbMvf79s=;
 b=Gu2aPed/HZUehoPMCT2iflSqvLse82c0ibZAMqN+Uwe6Y74zUy0JT7wZttJ8OKSqf9qqo2bFWKMxvtJvwjnX8emAdR47qhELUmyswNopmHOWCYeGgBMqKgRiFqOL+TZ1xhJUm678e9et8HiD3UpKp7L7QlYvo39hlE3HKB88fjwTMNEMrQLYAOCxkL9bJJGDKjCCUruXrtW6xToMzDqC8aW9iVp+cz4L7zUGyzAxe6U5OtJ7GghMGQ//868cEirRvK6zMlgx36ArJIuJ2QDxwJiskrVHBPSevrCY+0Lut6YTyCLDk2Ox7CR7vYRwd4k/5NesQjWR3Drp5a/zxz+I6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:29:39 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:38 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 30/31] lib/igt_core: move igt_load_igtrc to
 igt_device_scan
Date: Fri, 3 Jul 2026 16:29:04 +0200
Message-ID: <fb33bf2816d029fd36fe54bbd0cd11be85696513.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a36bcc7-acbe-4c44-c3a4-08ded90f8386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|3023799007|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: D7ztqg/XgSR2ruDkqSQF/Hzio58qGt/3qx5RrNrJnziVauQttMXJTjTjGTsa5dP+Makf/1GwYDAHA0EcCy3TlZm7705QqAJZYiR/9Z2/O1QlnXT8Ha5InNyyrGpQyXo4kH13O/JwvrRw1mTH/IY80K0uX0HAFYq/wru6IRlvl3orwm2mGHD1yQDYQPcRlcjmxP7vrVvq8jXDiXNAY7epf7FGlvPVlJnZ+kp3rin6sSt5QGqb1QPwT9Bb01udtgC9jEKGwSaGtGIlFHCnwqJC0Xp2UiGlu9iolgpooi1kWayQ10FIwye9M/5muvG2UUfqrijj0e0xxFbUzbya8F5m14MhfsgMIPlvZcEYMF+8wiVGLe8O+w5z6ZRaPKHJkkxUDBsFe9GwGczLsHGTvIlccyJoJ4SgQrR8Dp5iH7oCyVnmXJOkDbkth2rZlbcYBCtJLaUI+sImUDabni/rA5UBON/FKmzYcxi/1ma3T6K6fGQ+pd7r0EZc25YjVnRE5+8A4h6pfMXXnvZYHw1dkRBlj+H0CvJlaQ9SrVUDgN9TPql9npRcwiyfKmZHSugT+UIxpDS7+SLRnpwAO1I3qC1HzrCXCDi9Omr2OykhnXiiXTEvjLVO0aLxzxpWvGLOCDnrN9O7skPsbcq/ZJOYg2IgQ6FK0Gg9mPnM9GeMkHs3j/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fDogvh3LEijjQEHzCGGqKBuaWLOnA6EW4BqbcFu2LPezeV8o0ZKzirJCaEo4?=
 =?us-ascii?Q?4zSnszb+dI6YF94m9fZ1n+bc2HRnbG2xyAd+B3iCtSUJ9yeCzbrOpLJYMhWd?=
 =?us-ascii?Q?3wdcPsB/v2Or/FreD26ooEZyaG8B7j2lzNxaBB8qxTpjzGDVx84J6/fmZCRW?=
 =?us-ascii?Q?LwilaT4vE0by8Q13yTKXGZKbJ5ERu4peRRsfaR7ihMAPePiQQTL5OoyFWABL?=
 =?us-ascii?Q?/U3MV+3ccp2SLgG5DeFUDdNJxfwREAZy6B6FTiqHBIqnWENO7g3+XmcrM2wE?=
 =?us-ascii?Q?EOsg+gtI2ZpNzMUeGM7AQXwuG5cN1AhE70Of+HgmzIP3TGp0IE1gTL4bHP27?=
 =?us-ascii?Q?mA1PUswrIG5jHXFNNTAuYBp89hd4cz1jA1cXCBmPDdI7kfvCGrk+gWoUvYk7?=
 =?us-ascii?Q?H6TIEB1I7Qqu5iUVtqfMpF/c2Mhgcd63HMaW8VUjvbSG4UmP8UIoWcAzPfAL?=
 =?us-ascii?Q?jePqzZfmvSlNrkHhLpPM95g+CHNxgTcql2csSJTo6aQP569tR4jZGU/xRm35?=
 =?us-ascii?Q?mJwdhrVr7P6yXXcLgL3G/UqfMYonObccxbqwdNs8eynAQWpz06zs+vmCLcB4?=
 =?us-ascii?Q?S5AAVkp6PC3xH+lG+Zz+DxH0/xNCBOteF1Qdyz+XbN8zIpSlfInTolVVvxZv?=
 =?us-ascii?Q?mUlMA44EuVov79MyM/VbKuGmE/fIFKT9L4UYyaDbly+AZqtUD2UlQThw1qTl?=
 =?us-ascii?Q?uk/od99jFiM3kDEfppmzTqgkEROKOOMEvCykt8E2fcfjow4toNDRjg8UfzGe?=
 =?us-ascii?Q?7ty95OGfgBsVPqhVmTTo4d2cTY/bFLYybM3Ecxz/RT6FEc47pnr+mffKlBph?=
 =?us-ascii?Q?xil3fMKaVPjQIRtCz8kredKEElm+C+CA6d+w8fxU5eRe76myPRL18VCyAKRA?=
 =?us-ascii?Q?BwoXfkZ0UxE6lvSAgKjlc8NGs18ZpzF5kh37mlwxtqDKWa1cSCIcKJkUeV85?=
 =?us-ascii?Q?QmTQULGDhso2dmJJ8EghOYDUX2CPK91NUGX7QgebfNsspZ5agHPzCgMrRqXP?=
 =?us-ascii?Q?4OLnFPOTDl1B5G3kiyz60N4LRX5p9uITkuHpVeMTbHHmjH+crFS6jTg2H1XR?=
 =?us-ascii?Q?xfrZFfmFbaOVQiQKjPFu0JMq9+2J6l4TucplK2CXeQTEgadQHss8hfiphZI7?=
 =?us-ascii?Q?ZXRoF1n6w4ddzTlgSrie6lr6DPbmipFKHW9XZA/XpCLYL6y9Bh/4W2PP235x?=
 =?us-ascii?Q?Kj/nLI3PU649W4rHJnoNeY4hVk+xg07F77gU17z+Q5Bz9MDqNa0l08/OB2i3?=
 =?us-ascii?Q?Syz2HWi+CkCSsRKw8kth/cKep4pat8ov1QSM9AiPimFZRoT7dT+0Rqrfhg/p?=
 =?us-ascii?Q?R8O9gLrKAVUNNJiizfEDElG0GKsuzVW4dshsFSFnj2CDlKRHhfh5S0bhBrtZ?=
 =?us-ascii?Q?dAP93pKhPRMIEdQ6P1oOtFHKMCKEoPZGegpqeBNCfOBp342+u4TWTDchnH+o?=
 =?us-ascii?Q?zDBPmEtVaOwG3kRP6TDhQMAGt07GUIfvHL+YfMj3Fbpo7bbI4q2byjOyMQsm?=
 =?us-ascii?Q?R2kTrEkANDbLVnPSdirztksjtS1ZQ651wGj+tDwk9LX3Re9lygrLN0wiHIF2?=
 =?us-ascii?Q?buYJqYjKV3Oap209lZ+dAYE965jCvqeOeKy/QJ9nyw69DbL7eoiUaVrBUgNs?=
 =?us-ascii?Q?NHS4RolPIm96BX+qDBcUrv88Q5BVL5CEBBBkyEAKDaiivFgRQLqM3FFT34cm?=
 =?us-ascii?Q?0KkeQmY7U/O3qpb6V+nT/T176kiJSVOUqq2bvjNd8RZMtzK7N9TWBEAVaeVe?=
 =?us-ascii?Q?x4PB+fTJdO46N3fvKOb0gjXAzYcPJfg=3D?=
X-Exchange-RoutingPolicyChecked: qqupZcIOdrt3knRTc4YVTbs6RpFydMih43Hr8P1gl4rAr1vwSomTgMkXAKScbaVMQGbgX0YTBsVVgy+y/ANPBsHw6pKgPX/Q7lDW5ak6VHDc5TEFkpJOSsShU7CiL1RZ1AkIuNgKzxhraUGDKCWwP978EeKrOE+eZMLFdISliongXQ3VgFyyluCma6M+RSoc0bBCO5/iAefQKWsWNL8g5YY3XUkNu5voQ+WfPyQvKQ+PlaP55HcpqX9Gr9IVXHR2EZZaUq+lyfR2h3n9tz/v9D+75hXI5ZfOYPEYRnJwxNuen2/NtIXuDGmkBmU6d7DjCO/MNj+zD5JaOnOGckgkhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a36bcc7-acbe-4c44-c3a4-08ded90f8386
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:38.9025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVf240Z/f/nNNf3HOvtGRrpplYSWYSbFcgE1H3t0pBdlLuULMdge4HwbTtgMnkYLdXGHfeXU05vA3yh4ghEP7/1GECVQe3Oswk2DJBcyE2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
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

igt_load_igtrc() is used exclusively by igt_device_scan internals to read
per-device configuration from the igtrc file.  Moving it from igt_core.c
to igt_device_scan.c co-locates the function with its primary user and
makes it possible for lsgpu to link against lib_igt_device_scan without
needing the rest of libigt.

Update the declaration accordingly: remove from igt_core.h and add to
igt_device_scan.h where the implementation now lives.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_core.c        | 47 ------------------------------------------
 lib/igt_core.h        |  2 --
 lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  2 ++
 4 files changed, 50 insertions(+), 49 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a7c097d9e..2f737b01a 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -972,53 +972,6 @@ static void oom_adjust_for_doom(void)
 
 }
 
-/**
- * load_igtrc:
- *
- * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
- * home directory if that is not set. The returned keyfile needs to be
- * deallocated using g_key_file_free().
- *
- * Returns: Pointer to the keyfile, NULL on error.
- */
-GKeyFile *igt_load_igtrc(void)
-{
-	char *key_file_env = NULL;
-	char *key_file_loc = NULL;
-	GError *error = NULL;
-	GKeyFile *file;
-	int ret;
-
-	/* Determine igt config path */
-	key_file_env = getenv("IGT_CONFIG_PATH");
-	if (key_file_env) {
-		key_file_loc = key_file_env;
-	} else {
-		key_file_loc = malloc(100);
-		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
-	}
-
-	/* Load igt config file */
-	file = g_key_file_new();
-	ret = g_key_file_load_from_file(file, key_file_loc,
-					G_KEY_FILE_NONE, &error);
-	if (!ret) {
-		g_error_free(error);
-		g_key_file_free(file);
-		file = NULL;
-
-		goto out;
-	}
-
-	g_clear_error(&error);
-
- out:
-	if (!key_file_env && key_file_loc)
-		free(key_file_loc);
-
-	return file;
-}
-
 static void common_init_config(void)
 {
 	GError *error = NULL;
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 3337293bc..afaf35aa8 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -95,8 +95,6 @@ extern const char* __igt_test_description __attribute__((weak));
 extern bool __igt_plain_output;
 extern char *igt_frame_dump_path;
 
-struct _GKeyFile *igt_load_igtrc(void);
-
 /**
  * IGT_TEST_DESCRIPTION:
  * @str: description string
diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 7c7995224..a15a4624e 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -33,6 +33,7 @@
 #include <ctype.h>
 #include <dirent.h>
 #include <fcntl.h>
+#include <glib.h>
 #include <libudev.h>
 #ifdef __linux__
 #include <linux/limits.h>
@@ -2477,3 +2478,50 @@ int igt_device_prepare_filtered_view(const char *vendor)
 
 	return gpu_count;
 }
+
+/**
+ * igt_load_igtrc:
+ *
+ * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
+ * home directory if that is not set. The returned keyfile needs to be
+ * deallocated using g_key_file_free().
+ *
+ * Returns: Pointer to the keyfile, NULL on error.
+ */
+GKeyFile *igt_load_igtrc(void)
+{
+	char *key_file_env = NULL;
+	char *key_file_loc = NULL;
+	GError *error = NULL;
+	GKeyFile *file;
+	int ret;
+
+	/* Determine igt config path */
+	key_file_env = getenv("IGT_CONFIG_PATH");
+	if (key_file_env) {
+		key_file_loc = key_file_env;
+	} else {
+		key_file_loc = malloc(100);
+		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
+	}
+
+	/* Load igt config file */
+	file = g_key_file_new();
+	ret = g_key_file_load_from_file(file, key_file_loc,
+					G_KEY_FILE_NONE, &error);
+	if (!ret) {
+		g_error_free(error);
+		g_key_file_free(file);
+		file = NULL;
+
+		goto out;
+	}
+
+	g_clear_error(&error);
+
+ out:
+	if (!key_file_env && key_file_loc)
+		free(key_file_loc);
+
+	return file;
+}
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index f24a193cd..5b04033e3 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -103,4 +103,6 @@ int igt_open_render(struct igt_device_card *card);
 /* Add or use filters to match multiGPU devices */
 int igt_device_prepare_filtered_view(const char *vendor);
 
+struct _GKeyFile *igt_load_igtrc(void);
+
 #endif /* __IGT_DEVICE_SCAN_H__ */
-- 
2.53.0

