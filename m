Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ABCC25B7B
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC63910E8A8;
	Mon, 20 May 2024 19:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIWUFtc2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3534A10E87A
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716231855; x=1747767855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AiW1frgleao3VSNPBys9+nF2G9Oe9fUkeYcQZajGO/A=;
 b=MIWUFtc2ItyvRROiGrn4FKEkJHWe7vXAgTA27QA3kTITbn/QpBUXo5Bo
 i2Dztn5gWevUXgpBkosvrqnBemGJvl8yn27Vo1fUSv+VmbiV+WoFvk+XP
 a8rF2ShuPhRnSPdyh+l93R/76lpdHkSKwXUh1W6s/VnqF7Y2Fcw/Dj+ca
 Hn86k9RORtHRH70jOeiB4Do5I/rMnFVfa+VVMfBpktRSF6iCmPTdCYF0b
 KJVR2wPzP4jvr1eJXX1uK2U5qlts6c559syvdW+AFNGBIP/1HVZR6MpG8
 TsRG29hIqE8je4PTNI+yVRaEurmFIwvXSpe60/I87vz3HfEfjFnqYDBe4 Q==;
X-CSE-ConnectionGUID: WIhmSNbkRFW6aTSQ39Un7A==
X-CSE-MsgGUID: dNLT5pK5RdOGFCzkWMAXFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15330826"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="15330826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:04:07 -0700
X-CSE-ConnectionGUID: dr8VEKVFSuiqigmAU9xN8w==
X-CSE-MsgGUID: ryH7cEY8TyCqhEEoaPuTeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="37479325"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:04:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:04:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:04:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:04:06 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:04:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGXjUBYlNU7qoTxZYvySchSOGBT0H3GBMEa1wy7W6+aqSz9F9Wpuu84vvU1lD1xfrqU5dYjjl6ShUiM8/7RL174yg2qLuPi9t0Ic1lQo3yWu5EO58UsfCdzDBGpbb22xLAqV/V60oTGrfON0TooOYnD2H6zu894Km0aazxXd/Ge9P6hP5za6OF2+YegxqqPvrbiUAEobZyY+e3zLHbrsblgDxXcQdk3t2lRvU/Ro2SodqBPylbFHU76oz7WWBeOhymyQUd7CpjitjhLIsphHrhLHnma/P9Mzv+IqfqPg0bvbRXt4NtGj/4Q7KtRHfotY9h72e08c4PqiBhJ4vQU7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJevZPA0AXmYUlEx2652XZU6M6ZXky4AtcMz8javj6s=;
 b=itWHu5txFPw8vPoWENz7SOrDEjbmj1PTu3Wp8ZVDLmBIYkT4zBo6SQtvwiYtxxqLYpHIIeKVqyJyDlswWMqbg8G1CekoLbi5Jpb7LGzdNs9nxD4jcaoFjNISF+nz++EqdK3lM802k+EreFTjzgUc3NwohwVWmOGX8hFC+UjvukMy3+zWJgjzLAty1m1rTxQZP36VIVVXnOwlKabhLVQC3nQ5+tq7b+0RJlA7mkbGpsuZrUZ91vDb/GVIA3bZ9trtV6nczNsFyW3iHJBjlKrkBODCcxvHripHtvYo5jJNt/mcB8Xc0pgmG8ecrMwkQCn945z1p8C6/EBkQn8eMvyOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 19:04:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:04:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
Date: Mon, 20 May 2024 15:03:46 -0400
Message-ID: <20240520190347.242249-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520190347.242249-1-rodrigo.vivi@intel.com>
References: <20240520190347.242249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b3415d-4d2d-431e-e2de-08dc78ff9d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nnq6LYQB+2Dplkc6D99FkNst6y+Cf6vRpSWauezO8yr94k/6DFpPiGi196qH?=
 =?us-ascii?Q?Pz/LKWRquv/W2udAXQNSZOO8uI3SVqJisCu6nM7Go0nvM7F7Qn2yUGcRIwHJ?=
 =?us-ascii?Q?tGboyqaMP8ihgU6H43sVdDWXodcaY/HqEUvTCWwnI7lxUY2WQZ3Z3MHK4o2N?=
 =?us-ascii?Q?EKcqQ26oX9EhM/8H136qy4Q+10bbWHFUnwYufl9PsNQ/bXp2MNS1EyW34J3Z?=
 =?us-ascii?Q?tcqCjVCCpSJX5SVwJKiZlGE2sH05jWLmPyZYg/R8scvdtiI9x4Kw0ZmGw4UC?=
 =?us-ascii?Q?03j8oYVmhBVBb2aEdmQnfqlGIbiCxGsWgJf4+vYwn/GqgLSJG9nfS5NnP9oH?=
 =?us-ascii?Q?rV1jn0SISyKXAdCmHUByachuvjM5Dc7bDd84HzFz+y8WXk1G8xksNAwhLpL1?=
 =?us-ascii?Q?xL6J9Kda0yMwgg91GGwOFutgVXEBRowSI5skEptKgJcaHJ0VSHbKM5/H8QGr?=
 =?us-ascii?Q?+Mk7zxzaOQc+Vm4Uo5TMTZWfLNW9MQkEeOuKjiLA+mljzWKcLRdnDY7XHblJ?=
 =?us-ascii?Q?fcBnaClIxvWJ/kx2xwyGnt9A+7BEndHi7GZ9GenO9QdwIvvqZWknvfulgMFk?=
 =?us-ascii?Q?Bz7r3flkNuMtdBqP10nsw8ETwaBJeuGbtHhjc2Da9j4E8AGJ/GeQVMXhHMLt?=
 =?us-ascii?Q?NLqU/wdBryMyvVPnzH3R9P41vzWB99hZXbpELB82r1/AAMqTkc9gIXfRX8rn?=
 =?us-ascii?Q?l3KDImlhhVq85WeaBYzVBUMc0eP2462rTx1k6hVUtKmI3kchW1ArCjyFO/1G?=
 =?us-ascii?Q?gC3+k21noocXxHCMMZ61D4dpTssSC86bFJdiD5A1/vBctUaNDNtcZTYlbQvl?=
 =?us-ascii?Q?jdcPHVRBGJZ9/rZpoR05PzmXKXRSCajxMZfOPhG+9yN8pTK26c1MVkYJ0PUq?=
 =?us-ascii?Q?DvvEWhN0NkOeRqy6baONcHtLg58VkotrtmJXTCwwEeiZnr1ju4YFX02iNY14?=
 =?us-ascii?Q?tza9r8ud+1Pa/Z+4xCaQE0T7jODYFzHAmq0TiHiMH+HCNtCkVnm1N8iYvD4w?=
 =?us-ascii?Q?C/GL3eOFeIGcDF7aHjuHLnPF2h7Us02CvKUzOTp/jOqclDAk3niKSkTrrPjm?=
 =?us-ascii?Q?v1WFLtRrrHw9KP9IEnY5u9/7Hh/RPleESmD58rI0YpQomf02KlLDa96You/w?=
 =?us-ascii?Q?bw7k6M4UpdJtsed4hUl8oOcu11WcS7YBMCbhioaE3jTZg/mEKNCOrtovSCK8?=
 =?us-ascii?Q?ePIXw4x8j7W4lniUZyYyZ6or7E6JwADPGGe9leUKpw07GcPS9Mb5ty24O2fE?=
 =?us-ascii?Q?Qh2yqzxmaIO3dACUB4/Pv0tCO7YUcxMYIZzr0xCGlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BOF7f28Q+TeEkLwOEjEmTxDrM8eOaOU6FOMFwDWdjM17psyXeCvdbLYkZ4vo?=
 =?us-ascii?Q?wdMTpHX1ITGDOScEaHrJUU7L9IG4GF5jZ1M+0KV1YANmtNBxBg9G+VDaYKH1?=
 =?us-ascii?Q?lj9Ud4IUKQPYc6kMnWFFh35QwQgxM6rBVnzmwm2KfrJqciJYGnBCkASQ+ZbA?=
 =?us-ascii?Q?ilSHeXU0ADo7N3Zlv9aliLcLJUFuu5H5tcbc6CMA1FgYBzfdR7d6gplS6/Ro?=
 =?us-ascii?Q?O4EqZq04LGJwSdvv7fD85+RE8EQB0I1t0yh7Fvz3wkmlNtC8kWDWpULqXmoU?=
 =?us-ascii?Q?08g591WOsaEyU+PBV6/4cEPC5n36/WMlw4oktqizde2nOY3eupfXoCfJeDlx?=
 =?us-ascii?Q?qqy72ujSbcTU8QY7sM1ROZAyWTgdeBgp7OQwIjcjuErtmHTGc/Ng5scFMsap?=
 =?us-ascii?Q?2tSlz+ZhhRBBW+21KOcTsdQSQvpqB2kakPBWrH/sIGyJIAZWR023TsZNp/E2?=
 =?us-ascii?Q?SmEyAYZkPSjJxxtG8MCHiu2VLnG2qaPb13PXohqtctMguZwplGcnMijOciwh?=
 =?us-ascii?Q?0resDjhiZfWYjpClv1nWmboOJXN0Qyxr7u9TzG8x7fUSf3EoLGbR7Gnu/Dd3?=
 =?us-ascii?Q?obOYWZU4uvqQnZ9vvCwG2HhV7Na950X3I7U3VlMFlrSwpecm0PwBSK0je9Ny?=
 =?us-ascii?Q?RyGW1S92bALm0yFN05UFk/wK5748dgYLdYT6gf7nQNdW4rRO/eQxqyaxIrYX?=
 =?us-ascii?Q?bqIGv8To/2M6pmZuBRFrkS97V/BskjudKxxFctjwbcwCNE7m0dAO5XGe03+4?=
 =?us-ascii?Q?bfU5PrzEDJhpXX5XEeNFilqvbJ6uvjP+/xhXLSbKrM4gTTrrJxp99DlsuCrW?=
 =?us-ascii?Q?145dkvQ7UuDWjx1e7JrpDzXLE/bY/rV8+OTXqKWgM2IgfS10W9V8HCJNDcwl?=
 =?us-ascii?Q?XuDNA8MCUN57dAGo3fz5bqpX+Q1wbDWpp9g29Kc2I+dhpy7mE9lnEt3sZS/w?=
 =?us-ascii?Q?g/MJbs53bqKclg7bi6GBZX0kNFybNIvfdNPyLylIRRkQndDCqBMJwPwpDsUm?=
 =?us-ascii?Q?SJj1R00kJXJ/SPZE2m9ACkbnuHaJax7pHg6oOCz7ZxnNPcOgw4Ep2RDUvBqq?=
 =?us-ascii?Q?+5tE9xn40qKKdHNa8z+NrORfiXBoGBUW+wTvZdKediaDq9boJlNsOJyZEeoR?=
 =?us-ascii?Q?vtxSSlqJWYydy8afLQGpM08a5TrpebDYlMASWsQVjbFa2pPqt+mNs7whdA0U?=
 =?us-ascii?Q?onHyT9brVPqOzTFSomZn8RHpUKdXYTnnVewXLBP29UZDKuWO9TIN+T86n2q9?=
 =?us-ascii?Q?8ODHXg3pVD8mgyXRqMOR2MBQL/3e83vH7o7tcqQsLP+gmVUUmOVNMutO1qvn?=
 =?us-ascii?Q?TiE+A/OoZE7MmfpU9fevZ8dvk03z9Yd+/A77nYmNRZQlUcDLYm3C2aFPdQ9R?=
 =?us-ascii?Q?naXehXUA8ekgMaUgrnVxcy5VAkkdPh5Jz8irQa8nU8ULZ+DFi11jR0iSQ4EM?=
 =?us-ascii?Q?LhsqjHgeJN3d7+mmajbcqMnq3a7j51rTFsuP07ibPZ9AQVKrrDghtPqXnr/F?=
 =?us-ascii?Q?TkGC23nj8igaRUVbsdKlVo3hDIenYNJdp62i8YlJYumZUDBv6EqmazULvT8X?=
 =?us-ascii?Q?le/t9pMHHwaVfMtWhe1IbwZ2pkmG7Oh5oa06oDdBNzSgkLjJ0ZOn4ikUVPbb?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b3415d-4d2d-431e-e2de-08dc78ff9d43
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:04:03.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owQm2fmALVz2wP1CiREQipTdTHyObflTo/JOE6QWOVC08fyBiPsYR20MCTvyNYDE5bNUs1K8t+ZabneXBXYRQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

Standardize d3 setup and ensure that it tests with D3cold and
D3hot.

v2: rebased
v3: rebase and fix description arguments (Francois)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 82 ++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 683f25969..438c6fe30 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -517,19 +517,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 }
 
 /**
- * SUBTEST: d3-mmap-%s
+ * SUBTEST: %s-mmap-%s
  * Description:
- *	Validate mmap memory mapping with d3 state, for %arg[1] region,
+ *	Validate mmap memory mapping with %arg[1] state, for %arg[2] region,
  *	if supported by device.
+ *
  * arg[1]:
  *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ *
+ * arg[2]:
+ *
  * @vram:	vram region
  * @system:	system region
  *
  * Functionality: pm-d3
  */
 static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
-		      enum mem_op first_op)
+		      enum mem_op first_op, enum igt_acpi_d_state d_state)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -539,7 +545,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
@@ -565,7 +571,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 	sleep(1);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -580,7 +586,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
 			   active_time);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -590,7 +596,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 			igt_assert(map[i] == MAGIC_2);
 	}
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 
 	/* Runtime resume and check the pattern */
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
@@ -785,6 +791,36 @@ igt_main
 					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
+
+		igt_describe_f("Validate mmap memory mappings with system region,"
+			       "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  READ, d->state);
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  WRITE, d->state);
+			cleanup_d3(device);
+		}
+
+		igt_describe_f("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-vram", d->name) {
+			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+
+			/* Give some auto suspend delay to validate rpm active during page fault */
+			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  READ, d->state);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  WRITE, d->state);
+			cleanup_d3(device);
+
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_subtest_group {
@@ -800,38 +836,6 @@ igt_main
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
 
-		igt_describe("Validate mmap memory mappings with system region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-system") {
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0, READ);
-			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-		}
-
-		igt_describe("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-vram") {
-			int delay_ms;
-
-			if (device.pci_root != device.pci_xe) {
-				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
-				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
-			}
-
-			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
-
-			/* Give some auto suspend delay to validate rpm active during page fault */
-			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
-		}
-
 		igt_subtest("mocs-rpm") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mocs_suspend_resume(device, NO_SUSPEND);
-- 
2.44.0

