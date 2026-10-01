Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F114CA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E466310E029;
	Thu,  1 Oct 2026 11:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIv+RCkr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4855A10E21A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853253; x=1822389253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0bLzDjAEnypXEp9YSym97HleWqLjNOZk9r1i/97Oj50=;
 b=hIv+RCkruUROWLV0vwCu0Rs6ohOhVuB1hJev3PYFI7UQaUOJtA+mEgEC
 DjC+DB5zpksU0m+W4oxd9Sl3uE+jI3ARm3EsRo8oXb4jp+fxlBLzdrupS
 nwKaoHewsr3cE+T/d1/kXFIO6vi3ijFtYzOOB01ZxIbOrt7d3/ND7I6Ei
 R67RM8KpolsAd8A2V8F2ba7K+Q+cXoNRUGigHQUsZ3of5n8u+FbhjqVEh
 A9yBqjCtXmi7NCJva/Vn5of5TVgAeJqr8Jw/Y+1If4YRJo9+nqUg9ZbDJ
 Bdsi8lX3GKYryqhBgWbLGeizwN9kYfGKEOpbrlFvJxuitcRQ3x4Qk00bT g==;
X-CSE-ConnectionGUID: rPpTsmbVSvKL8i+2LdxCog==
X-CSE-MsgGUID: bp8UjUqeSOiM7vD5oswhGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117136249"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="117136249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:13 -0700
X-CSE-ConnectionGUID: ip5sfTMER2GzLTKxi8pWLA==
X-CSE-MsgGUID: OH8u9e4tRDe7u/VK04iGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275508878"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:14:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:14:12 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:14:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMnjuGYkN4mRFimxspyTJtj4F7N2BCQAI4AVtA+Bsd5l2sClTL/sD5YQrgWzONeHhmtHJInsndCqU3+4Y1AT5y5yyCDCOzXH/UBu8CllZFw83pIzH5kAzT87C/+trTC4Y2MuLx+eXk/PbYLORB4bZiRWiiUl89t0qYKyfThdE0UWhoAhkj0vL7AQ1HaK9fBO8NNdWur6/xMkLkX8uQhtXJGh0vuI+P3JcqigsT6T3E+Zgw/7gVfmSFubS9HKPMPm+aO9HFoBsBbZNeB33/vOlmtJfDwsP5XBfmnLSI4krmI0+OrQxSHYkimcoqo/MGAVVYfQjbLJ7P8DYK8pqggYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51miW7fcoPHTQynl8jbw4MWxAbypqm71qJHra/lV6+0=;
 b=C8TLU1cPOsu3l/lxM88Noz5dnZneFy2QWH5wAlXab35DP7h6s9E/hjrHQixczfo1HC00y5tUSiK+DezpVJNmN2WSz1KpGb5ndj+cF7hCk72L5ENN9lCOxXRHMYySbps6Qq6MMXG3PwMlOxe9OKS0X8JnmL7mzqJgi8f8UsMcCLOrkjZBbF3saEUjUbr/IfUa8bB+qemJqcuTzlWBK1a+88eQAtZKjA5raUx7hwH5UER/+ykYfluKzzSXNQROZaH00xUAuhgsPbVXb4grUHLFJD77vOmUxMa1jOVkkRuT5z8BDQFK8WTWsnxbgOg89Kb4eHmzEcRq4zwKxQzwv6QUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:14:07 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 11:14:07 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 3/8] tools/gputop/xe_gputop: fix return logic,
 cleanup and div by zero bugs
Date: Thu, 1 Oct 2026 13:13:56 +0200
Message-ID: <35ee4e6e9ec52ebecf76ce3c859f2b75d3f5ed96.1790853076.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790853076.git.sebastian.brzezinka@intel.com>
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b448f79-2009-4e05-7a0a-08df1fad1bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SomiKc7/DaWMdfepvglU9SOIqNBT7ZxtVihw6BkuT5fmCpeCZSj6gqpzLCfzJrYCmhg+8h7C0E4JMy0M1X/9bomEC+4gPV7KV1Nq24sBTjXFwsUkMPphAxFAkS4Bylf1u2+hUN5Lo1qTfIevyM8C0t9SQ4GPoJxJduzNyk+BZxkqsd1c24ZRgInRthXepkSCfiulRX1MUEn0bOKSfGFnxY27Bqcfcwuy7+eyIQSanlXBPP+FZe/EOa2Fg2DTDj1TPtv4mB/1NeSr3QOTPU9iCcQfzL/+0zyc32xeGc2rU0oJfb7fXCgvkkeSscraNuOZglp9IaK72OcBJQd901pKGbNTRoGjQmxH4kJq11gbQGh7j33ADlZwKeokHEic+/t2MoAkNO5mQg5ZoZtNTiXIxamwsPkDBpdpV7anWJoIhtlKqc8Sevu/NaCST09NV8x6Ii9GjP3QvbxF+e+wXaN6dOyURqnl050uXDpGbo7WoKHT+m+v0n3QACHMtDPzWfnzssy5fmDzyshIIkt8rjA/fBGuB+XzZea0PGwofheUlv7HQSU8UklM3w0w65jYCojysyCNC3D3GqiT9CfRc4EIkNX1NPZ9DDIWcGgxR6EpHCUtqOiIa8L25HkkDctvsx3X2OEuqjx+zNZo4Fj2DC8v1MMr+71NKRFDuIcxoke1yXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFq1YgzkIcWtjEbbyGZ25ZWt9SB+xg2sHHd0cWV46WgV3hF1if/LHfuZVvZR?=
 =?us-ascii?Q?0exmxQpdBOW14JEcqgCZRrso6FlyrgUiUcnIkDSplo2zSrJJKsix6O3wN43o?=
 =?us-ascii?Q?kvL2Byc0cD6IxZ5Jz0+OA0rhMDr8vBXlkUds8Wn/hrnOLC/7whdY+jjpkIrp?=
 =?us-ascii?Q?Z59a+b7IMpmj6wICCx2dy3+4IesKtCcoH5Rpb87IEJqRsonhyop801FccM8M?=
 =?us-ascii?Q?UA/jbmNTEcFDiEboGwWm4lprhTbK2CnJT/VljC+uVc3z2pcZqObVnxr873bT?=
 =?us-ascii?Q?K8oqspkoki8VIn6iWt2uxbqwYEKSJS5bzyRIqR6h3jvcVjobpg2GxlQz3s5P?=
 =?us-ascii?Q?uK21x4fOgDlllnZPZcS6dGVqRFvqBVPB8aFLxFRvymsxKzm33PFXd7CqcYT+?=
 =?us-ascii?Q?YuwlrV0y/75sQQJGSgr3be2INXHuLpPni7NQMtKmeRzHbI+FNl/egrZ2aXAp?=
 =?us-ascii?Q?3+sqPFjl0A5VAHYYFfW8lhOWLrvMnSVelX33w09z7BeZgSE/9Ib6aIe72vNb?=
 =?us-ascii?Q?93k6mhdGzIgIEvDyMf8eq3QIKVka5jri2pIzwfKDhVIPOpxwSZrIYPlnl9Yd?=
 =?us-ascii?Q?G7uLbvXSXlRcjKvznYzJxsGkVk5h0ZtSWxKUyq0wCyPc1DiTjYt8kTTdIqxw?=
 =?us-ascii?Q?9lfx4CKfuqI2Jmd8DF2Lls9tF3qYulUAXMjfQ+XMzxVZcnNDe8opqvChhawo?=
 =?us-ascii?Q?HCSfvgrRhycxJeQbdfSy1OWfhkaeQ9u9OTnGTZcEko0Z1Dami64ncpP4dMU9?=
 =?us-ascii?Q?SXav9eC/lPGnXefHrp+lnuqOJTxQ3IuOmW+u0KfJuozrdXflk1N7XqKcBmeb?=
 =?us-ascii?Q?h6EkFs/2AuaCmtnqHN2YSdAW/2clzfk0ralP0VAjdHttvLsLlP0ajiQsFLsh?=
 =?us-ascii?Q?/zHEdVJdMqoOYd052W0Ax6BS0eiRPr3TlF8Po1BIiyakNP3c0/n4zvdp32ir?=
 =?us-ascii?Q?iLOV8/HM1jl7FUwAw1/0BVunc4SwgcG2CgdYaG98Vab13p2kXD5vCy+kAK+k?=
 =?us-ascii?Q?xT/hfVQxqxwyBEJsHbXQ8qrcRK+slnr3T5dJ8j6oCN84D5j7fFvOT4pt5Jq9?=
 =?us-ascii?Q?52sCrYPLpgJTq/j0TXvmDOHhNWRV1hmbkGInvInvGVtC6MOVIxGj/Mf0yB+q?=
 =?us-ascii?Q?3GYN+11D0Q3PEvn1po+ApVc2hfvA7eXC7BC0rvh4jNFqUA882hAb1UvftnBd?=
 =?us-ascii?Q?Vh2wqc5NpXfCPyfawq4o6o53XLuzKeh+6/AehmMWzN8FOgxvOAK7M0b+zejI?=
 =?us-ascii?Q?WvW92Iw6T43Ctk+e48xJJ2g0UvJvLv9mEWrRojK4fiE/iBx/gAAEGvkTOCOy?=
 =?us-ascii?Q?ZNf+wFDz8Anhlg+FYvtaZ2WoHcIrfk2Ukf/bV7EyH+aAweGC1Zzk4YS8bYIp?=
 =?us-ascii?Q?8g+heooXv8Y4lHIkEqydOLQpmEZzXFA5wk7hDqH1t3oHY6mMUcvxD3RwTFOR?=
 =?us-ascii?Q?7JEHoiBRUY1vLc3IAhhpp5iOUOQQwNAHVnM1GOEufmSXg19vSzOXwJYHUuJQ?=
 =?us-ascii?Q?C0usRiT2lARXFtUguIWd/jYcFSjSlBZxdOkr9Ad1DiJTqypXQBj2GSQlov/6?=
 =?us-ascii?Q?enbqVWebFFzXNPXRqVRWvemlq9fq6G3a9K59G5LuKV/V6jU6VlR27R40qpOD?=
 =?us-ascii?Q?t2JC11KcvnRZJpRkpgW/1LwJfDlgzVapTYdm2hD3Mu3ja+GKLBeVPs5qvoi0?=
 =?us-ascii?Q?lzveHuObWJWFDgdkqiUx6O/WIQctT/yKUKI6QFH+GdPyQ7q0jZddGiqfERUh?=
 =?us-ascii?Q?fuWV0b5OdNmDiBn54t9+QvoozoL+qms=3D?=
X-Exchange-RoutingPolicyChecked: pJzhHP/8QLjdEvB0kDz5s+crYon/7DE21N3YSXgoFQncALyfoAzVfhZLWPTCzzI+XCF+pHm54vkSmIOZq4ZRSdHWPo+G/288uxXzpwXbU0pvZcdgyy1G9sJj0LfijMWIfdgN5KLxbc3JFuYoXR6MZzZpugupPAFBGMHS9/a6qyoeBUQ+0uGGhjtu1pt5YCgYjhiU3xac78Zy+3ItvsC1mPhQFqNgNLb6VKS5w46fkKjTpr9/4f8+vmjLfAZG6crGReefwobFOY8dF+soQFbsdRjGNW39agZ6LK4c24D6a5rfKCnflIz6atJ7Mt2Q0embMFE122+6z//M7ood+CdEMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b448f79-2009-4e05-7a0a-08df1fad1bc0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:14:07.2733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tu0rY7pD0rUnGajYHEvHNrpONQ3h5bjlauf1R+Nrm9wwv+FRzikoS2UwFivWV7ikGYiE3kGkNshYqGxtOVqFgsd67zFRTIes5u/lC5fcivY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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
than one xe device is present. Free the full range of the array of
devices instead.

pmu_active_percentage() divided by pmu_total_ticks without checking
for zero. Exit early if that would be the case.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/gputop/xe_gputop.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index 46d29419c..cfc8e6a62 100644
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
 
@@ -296,6 +299,9 @@ static double pmu_active_percentage(struct xe_engine *engine)
 				 engine->engine_total_ticks.val.prev;
 	double percentage;
 
+	if (!pmu_total_ticks)
+		return 0.0;
+
 	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
 
 	return clamp(percentage, 0., 100.);
-- 
2.55.0

