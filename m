Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7513C9830D
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 11:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327FB10F9F8;
	Fri, 25 Sep 2026 11:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRMlG5ht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A86710F9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333884; x=1821869884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FH1apMRodpHhBSCtcwcx0Sq5NAc1oWa+GF3AkdGpdDk=;
 b=cRMlG5htA/8hS/SuJhaJ+dxl+3BsR6kyutb/N5HRWx1qpWfV4tvhn+ej
 IIp+m8DAqFaWHwoSRIK8wFpSGXElVJDfaGlnibEKoIFHkexEPdVsvZWwe
 ZVtHrT/NJKyYVAY3Vg6ygiDq+XVKUmMyGKDVsJG4S7SKEoiiGqwKjZfiH
 PMSL2N5cXx1Hdya/2qvO8XaueKvXHxjGgjyptJ/2DBG0efr6bT/HVJj7c
 XvQ7Y6Lf0BhjGFLu3LCB/1vVaa4zbo4DsztoO8kaQkAV3wEfnJWF3wFML
 QtqxHjn4kcHA3uJcaOOR9+8+f1/ZNh1rIOU4OKuUQxru71psiqMbEj/fK w==;
X-CSE-ConnectionGUID: xfI8QHLUQk6DBPXJLR+vaw==
X-CSE-MsgGUID: 49PG0PS2R5GM7i1hfrFRNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94935937"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="94935937"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:04 -0700
X-CSE-ConnectionGUID: 0O+0TPnxQa65xcXF6Y6Mow==
X-CSE-MsgGUID: ijRzACZVSH+kbh29pCybnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="312230381"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:58:03 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pU4zVKBnfA5RIJW877XZB7aXqOlihldhucQCreKSRkemtixtZHUmPcGApKSD4Y/f4+MgQ6YO8722ReSq1mYDCgb5ylY0LUfpfF3pORB5kuc+A8Ag9pzyScgsLpYc32xaipMyPbJohXNGAYBn9L0lwUNs+CJXDOpp9HPoMYEF+GjLoZ+a08y/VH4eGDisrdMrtSFmDee21KJGReF7nCo6LXp6KOY7Dy+ZLsR9iYIGcb/H04eYkhRMlO9joFnLQuhlcaVLCc4AvHbmI/DvsdgNGMkeUUxw9+AjYP95qenIx8yflYpT+5Dn3Dim0YibCkWUNbKoMWhEpU9By2ZHBBZo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBpO+K89cfPTwfhacmQWOzdX+bSqn7g0mwt41uj/Eag=;
 b=fdtVkUA/B+kXXdORIFDyAEnUeZQ3GUK3NaHpKByAX51l9a6O6MwGyurq7KeDAtEJk/F4JDSAjrgQrvQPNhx1bOUNlg7BDqOxzH6R9MUtdqTEDOuAJXnItqLbMFyk23teAROcFrdSApUsnTSPPTYDESVr4LklU2KGQvFOCpEEeeGRghVAnwkHMm+sLq25nZiDCleD4Wv6oFLajnUB4TXsMO77wQL3kOfmQYmnasjzCmE6UwEjq3HOTQWRZi9YEOmxiZb3eqE2lnswlWZ8Z8KW47l7K9+f4frKckbNGjZrtSH0ZAt1zxVoV4ngN0Uq4nUkbIJcigJUwMKiYHyrl1YDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 10:58:01 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:58:01 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 3/8] tools/gputop/xe_gputop: fix return logic,
 cleanup and div by zero bugs
Date: Fri, 25 Sep 2026 12:57:43 +0200
Message-ID: <ed0f4ad6da7e29e003e6264fa2737cf088c5b2e8.1790331690.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790331690.git.sebastian.brzezinka@intel.com>
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 761add17-510c-4a0d-0671-08df1af3ddc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: S8vYI6bE/9Q/w1EKfVc6+lZNuiz0fy/ACc+hDRz6hbKcTtEYCVkGf6bkcokf1xVxVMhSrjyO50Y55gu9Vv/gqRUYL9bqggv+gXvA8CZQvrfqp7nGZ9eFyx5XH/dwTBXOyjbFzjtvcbUqQJwzKeS6b4CesQ6Ba09bAsN+JQqF8BWB30ZNUlQwgVWzWRYNzI1VFoMyhfdpKIjanIGSjgmUGiSuteCUzmhH2DYti2KLa6Z3/+2sQx2n1PwGbbwjUGfyzXbw/7+usq0RMDDtv70sSCBBqERQVmbSFn5hkDcd3dyklvzYsukbjp7QaKkaIYFjPDntRZe+Thi/fawja1EvLR+QFSB/uv+rGjGyyq5PEuIXpObZGvRnGllB3o9Ch2MuBXZ2a9kvZqOkatEE6ANhcyHfuHs4THYIvFcIeEkCtbm4Qd8ie86v1HCc+UnlWynTownjgSekPoIkzGzLJkUfuHdb17ssHdFpcGW4JmHkwuK1Qf1Q7mcjMa5V6Y5r9V4oKYA3AMrbIiJsyDjGPgPE12N0ANLtlgaMEv13KUmlYdcYCzD/ugi8UN6VQcC2BIFayMcOmVpqNANGyaQ0cVV7VMEzwlu0xxVZhPqIpezTNOXVqJIqVFLJUVxjMTYqKyPEwyCcemb29Ho5pELAVQjD0F/CpndkTy2c24LZqzFt95s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a8nZeglQwqcdHa2muiS3qGwlBsjn+JU32C2Q05mSs2bciWh5SoRLvNHaLrb6?=
 =?us-ascii?Q?jHEJQgeDS2TyMNWhRCUsebKuhnn5F35csX9QfWQcaf6pb9xZsKmsms0fEeH8?=
 =?us-ascii?Q?1XG7WHMJ3Zzm3DlpMeA4Lciz5SkaIdEz0OfjLRxnYoCGMMMIjj3mIVunCgW6?=
 =?us-ascii?Q?tHjWQDCclnSPrxu6ucYwUoG54bwoOHE9eUr6SUe/ncaC/ZyWavpIdq80Lju0?=
 =?us-ascii?Q?LILhtWzWAEwjW5HpT0Et9AavzEL7Qm4Zn4EB1xOKX71YsCpRsq3yL1CT637r?=
 =?us-ascii?Q?KDA9/YzS9jB5DrKP3vdRdgwnTrkopPXKRu5KAYY+wQw6K1mDKj5Jfqt9A0LG?=
 =?us-ascii?Q?CLK6Qvl+7LQhBrSPpDmr9wKVu65XYSLeaoR60Al5VGPSAWW14/MssNndN7+9?=
 =?us-ascii?Q?c74qf/hHrKEvX6OsQB7y1Qf+vu0/1BlcK3TGWMAklfz0oFfhcYiInRYnkCE7?=
 =?us-ascii?Q?n9tIjv6fUWdnU7HUWvH0qU5EFebmqGTmLJVktutYarUFC/csHkBjISkkhSjZ?=
 =?us-ascii?Q?0EmuPFQJ1NUKi1O4UZSHHFMa77+ZqlcfMX2PMUFtuu2xgcQsjJpeli/W6IvX?=
 =?us-ascii?Q?WbMx1M+hn5LT0BWfcGEOe2Q5Ziov22sfotCdHpvnSCOcSQz5QgBJReKLPGab?=
 =?us-ascii?Q?u10zJYy1vEpzgskD8gOhj4RI8WoaHo9Z7KT3W5VNexB4noxFCaWLIQSZpAxz?=
 =?us-ascii?Q?U0H63uZCd7U8/XgASUgNsK+iammG6He7MqJmMNB5lOKob3hxaFLU/yXL4qdz?=
 =?us-ascii?Q?0FIsEG4Q0YnsPymLukDihN50KrVjDhXcNW63LVjzZqZ+BlnGxI5gF8iKtcik?=
 =?us-ascii?Q?yk8LO8MbcterYQOGEaSy243XspQ9o4RL/DCiFeeKIlUut92h5adl+K1ULBUu?=
 =?us-ascii?Q?1TPUnJCqJT07MkXUnaR+iUUYxjX7aUjdSdVyiwCR3iEswvTkfZQiWtNghGy8?=
 =?us-ascii?Q?6929gV73Lmozigzvdq54iiKTMV8YfVnM1C63odJOVcwK+ynK1dW1kuXaPngG?=
 =?us-ascii?Q?x2skFatiFvji80ThvWZqI5bdW7x5jYQEZGzmsUIFWpDiT6/EefXjeJm47SNv?=
 =?us-ascii?Q?+Xi2aE3Id6nd6RhveFzyMJqU5EWnZHHu0QcDPMfL7o225bqFIx6v7t9Gh70V?=
 =?us-ascii?Q?x9BXL7FtRpV/De5C5LebMzgeKtdC/VFsNbytQBkGNcOvdk/7DcjsvcdDRDzn?=
 =?us-ascii?Q?yUrtkzRQfoRNGKpRF+yGlV/R66vd7CEIWtAXtSQiVUUvaIk8og0oZeGVNMa+?=
 =?us-ascii?Q?5FwMU8HrNVeyw0fbplLRaF3W0n1rsgqo5YpfhWDi3ELide3cAyx+WbivaD1g?=
 =?us-ascii?Q?aOsJOpoFMGBFRSr+HPjiv+cDfMDpxxSOSO2kouPt0CENC8mM+jk4bKzkH5pC?=
 =?us-ascii?Q?z2czcA7Cr1wz40KWX6K2kUYq8D49wa/44ufpfnlh/a1WXGFwU95mdIkvgnwk?=
 =?us-ascii?Q?pygHjOLQ4Kv75Z4UT0CjW69uBNKwoGUUKAXLHfgk2yvT3v/BFHpk3IRTS4Wp?=
 =?us-ascii?Q?PgjERJepxri8SpEuhzjKgn7UuxXnSMojLRYU8gZEFxtuLl0wxZhMsudY6qfc?=
 =?us-ascii?Q?C76/ShnLodPZZjAcKdnjBu6tCEG8C1ZcgO9WiFsYnb7hP/fGd1wYitMktbh5?=
 =?us-ascii?Q?pzLc+2ZtLccQqhHP/qJrmeSWiFMAqAdV6mGazWemCBFN9BVBBmPFf00Za5PI?=
 =?us-ascii?Q?FRfGD/uw4IXGYaWQat5N6F4ep8+IGTq1oCkDYOErKSmJzLll3GRaojgsZec+?=
 =?us-ascii?Q?V7Gj/znJmU1oh9Wedr5Yh/msyF4E3Sw=3D?=
X-Exchange-RoutingPolicyChecked: Y5GKcTPqS1OSSIWKN3g04OVArDz4+4x4+8Pcprtv988hRmJiUJ07IyJNbQmFwVKJ1uDNYs5ALWPdGKezQFX3VoV+q7qYCRU2E3HLLNXHUM4ChEiv+iE7fI7ezlhDNeG6BjilPV8Rn7nipoMPz0bukGeZ+ktxjuswIYum3/8LLCx+6HmjsBu5oEU24hFqYlBcS1P01+Q6Mjc/+hX539pcNhbOrYqcOgp3tTmO3aUJqj9HwlVLeDqdZMqHua9xsMvJK+4AfSZo/5l/KNK4Ul9v34N+8Jh+BwvrEns5O9TgkY5v3T81/3741c4CkGqILKEbh2rGD6yQwgD5xwGbuqMTcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 761add17-510c-4a0d-0671-08df1af3ddc2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:58:01.0816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/gQ7A6Gh1sX/LVZ+QiXsU81eo+G1syINUty95Sxpj1jET/TfehiERtEDUFitC9tLIgCxxgkRFGAeXJAH4mSmU3Vz8netd96fwVBR4SHmoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

xe_populate_engines() used the leftover asprintf() length in 'ret'
to detect failure, but that value is also positive on success, so real
errors (bad PMU config, asprintf failure) were silently ignored. Track
failure with an explicit flag instead.

xe_clean_up() freed gputop_dev->pmu_device_obj (always device 0) instead
of gputop_dev[i].pmu_device_obj, corrupting or leaking memory when more
than one xe device is present.

pmu_active_percentage() divided by pmu_total_ticks without checking
for zero.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/gputop/xe_gputop.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index f643fe33e..193c9caa2 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -66,7 +66,7 @@ void xe_clean_up(void *obj, int len)
 			}
 			if (gputop_dev[i].pmu_device_obj->device)
 				free(gputop_dev[i].pmu_device_obj->device);
-			free(gputop_dev->pmu_device_obj);
+			free(gputop_dev[i].pmu_device_obj);
 		}
 	}
 }
@@ -133,6 +133,7 @@ void *xe_populate_engines(const void *obj, int index)
 	char device[30];
 	int ret = 0;
 	int card_fd;
+	bool failed = false;
 
 	if (!card || !strlen(card->card) || !strlen(card->render))
 		return NULL;
@@ -182,6 +183,7 @@ void *xe_populate_engines(const void *obj, int index)
 		if (engine->engine_active_ticks.config == -1 ||
 		    engine->engine_total_ticks.config == -1) {
 			ret = ENOENT;
+			failed = true;
 			break;
 		}
 
@@ -192,14 +194,15 @@ void *xe_populate_engines(const void *obj, int index)
 
 		if (ret <= 0) {
 			ret = errno;
+			failed = true;
 			break;
 		}
 
 		engines->num_engines++;
 	}
 
-	if (!ret) {
-		errno = ret;
+	if (failed || !engines->num_engines) {
+		errno = failed ? ret : ENODEV;
 		return NULL;
 	}
 
@@ -299,6 +302,9 @@ static double pmu_active_percentage(struct xe_engine *engine)
 				 engine->engine_total_ticks.val.prev;
 	double percentage;
 
+	if (!pmu_total_ticks)
+		return 0.0;
+
 	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
 
 	return CLAMP(percentage, 0., 100.);
-- 
2.55.0

