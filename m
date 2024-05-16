Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A41C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 18:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F2F10E4E0;
	Thu, 16 May 2024 18:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YD8SI+Qo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E74910E4E0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883029; x=1747419029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Yxv+T27/l28KGfzRMHzzZuiQCsxSUj8Qy/zItA9Mbvs=;
 b=YD8SI+Qo6KQ4CtsohI2rnYygFACuHyY3MUOPAxJUXM8ABbwFVshhhise
 8C4FD7P9zwnXANJM5FSQrCmQT3CbXqko3U8NUgHRmwksHDvhLBLDRxuxF
 o+PYG4akWoaXteaFX3GngzZfbs+8AxTDJih8ANNPRWxAg4DB+ECvGlOYB
 Iu0IDhasH+jUZBGCGuRy77FF73QVOMaUAl9ZZ/cN83yRewvgRnhKOunAH
 DQj003cXlont0wvhgKniC2J85LXDdNalweQYhxQCQ1TAO1pqdvBRXlTrL
 kwM3mij40OIMe0YPlp/5JuuE84Ca0mLN2ZtNjHyIfAlujmdT/SnV2qWks g==;
X-CSE-ConnectionGUID: IISP91pVSNKicgujdHF43w==
X-CSE-MsgGUID: bxaE7b7nR72DcibybuAVfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11828669"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11828669"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:10:28 -0700
X-CSE-ConnectionGUID: KydhRIZHSZWQ+SAjl/X97w==
X-CSE-MsgGUID: WCHbzLR2RK2lXiPdIXnLag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31449430"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 11:10:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:10:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:10:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 11:10:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 11:10:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhpv1se2kJ9fDL2Nbe/BA6rG3AhJ7RePR4v3e1U58Aj5DIouDGZgpLne9essgR0LKFhI+VJKEDJCCvGR2Tp8jkiyvqUwzpVWwlLlaESrygii244hVyLyQTjjrwkmwr5XKgunrTbb0/E9y3pbp0z+vG1l+BKfxG9xNqCrrV2xgCWq9pbUM++C31bx3Xurpz3QUOmgPXZAFSOr6kbVxVY0044/a9ouMoxxlFq950JorYioef9J6PNX6vDWzxrIL1YIixlaPtuU4YkkisljN/wqy/tHzGSjmILamQGcPQOfY3HmyqxHbIDtW2k8TAr+fSzUGMNpfO+lLn6Khf8XdU+WDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KptEtULpOjKw+SwwdeLGf3DudkzBUs4etKj9B8aBBhs=;
 b=c1YnMQ7vNI5Iz00h1FUiMQfAomMuNpfkW+/CaAs0qZOszLlztpD1DCvokgTFO2DbXt/w2aYPMk0tr1CAkmse44VmADWHQaf6s704O7IN1utrZEea6X7+TphvY4e9oqsWn0CXY5PMkPLceibt5HwPBzPUElC1d2WHiP3nPskx94Afjc+TUa+kb1eDMShY2nO/2dZ4nSt6UYs/1xsofoFWj9zIgxdeWgJqb0mDkG6qmpYMoG1u029O+cKoJ6RkVoNnn4FznTTyPYfurImgdIcaOu0RJ9v24sOCOJvI2SwCNusJOfeBlEqyqIVGcIYDQmJ5yQYWbUtW17er7vDfea4HlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Thu, 16 May
 2024 18:10:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 18:10:26 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Badal
 Nilawar" <badal.nilawar@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/xe_pm: Also disable display for
 mmap_system test
Date: Thu, 16 May 2024 14:10:13 -0400
Message-ID: <20240516181015.149824-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516181015.149824-1-rodrigo.vivi@intel.com>
References: <20240516181015.149824-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 02bed872-225e-429a-9a79-08dc75d3760b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E70x7ZDyVsoww7tzXnRvd6859WFmbo7YPlaeQNYiBtR66DXmR4Ps3+3Zx0V3?=
 =?us-ascii?Q?txGLBpQVS+zUfe4jftYVbMNYqWsEQSKMOKfU5EU6A8TCE4XXo18PBM0R3Ldo?=
 =?us-ascii?Q?mqtO7JLi22zRiwGu5p+fpWvmqtsK9EeSyBvqmXsAQ58VjBSvERn0aDyzfcqn?=
 =?us-ascii?Q?JWreFtdqEhRLkRJ5pQPgfhTydkS82tJDgzoh+CIYsJS2/+66rLdoUQv0Sbcl?=
 =?us-ascii?Q?+6NJpEYAnONh2ByP7emCBeSZQO8sN4Jcj7/CG/KD2fG0TIiDbXkK23SMdYy+?=
 =?us-ascii?Q?Es8RQ6nzaWNWBL7pgaw2Cziru3ZF3s66wCJeY5sRhjSgxnhiTnZ09poj0UB5?=
 =?us-ascii?Q?JLq8VtMdUrp6Q4MfoVFepSDd3KpiEqzIVmFpNijw9Zs7kN+r666pMGhNhx5N?=
 =?us-ascii?Q?6DK3il/WLzQpAH/3JwZ1Bh2TeZ600Cm2sCPDlqwl2az3gP/SCGcwz8Ejb4bZ?=
 =?us-ascii?Q?5YtyAdXzPi2vBmJoIK1nyZL2DP471vzactKKhCuHOfDKMXS1Q0ewKU0KIK1F?=
 =?us-ascii?Q?2IBti8MfAhqWB6zz2TK389j2PbgHUqvJ77aaEXZgt1FSu1E7qDHV6FJMMnYH?=
 =?us-ascii?Q?A/TNCMmDkqdIAQUTlFZ4qysFegCCmz5EL2Rk2I/S94XEny2LG37J/ADQ91Dr?=
 =?us-ascii?Q?xjRr3QvAjXbRxvF//lXqeqD0Obey0UqqDKhXpz/K2nTT7GldSH/0Pwild498?=
 =?us-ascii?Q?nrD5iP3m3bpFkhxQ34jVl7HG1aQ6UXHcHNlfu1U6prpo5u8kBgAa/2i0VGjB?=
 =?us-ascii?Q?YtK+a5PkTvh1RnNdxIp/tZQHAM7BYtNrENTcOUrIXJLhqqt9J6GeMXoiQ+tC?=
 =?us-ascii?Q?IW+h3b0Sh/Wm2U511qQPEloKQY5F5vpz/C3BfCed0ncERFLmyjEkw78lGAGw?=
 =?us-ascii?Q?kYS5y2TuhxY5iD/g/ZZu2ZpcC7YVr1YWjJxNvaQcOpaCRefwQhMu/mOdKdPA?=
 =?us-ascii?Q?WkIrX5CzzHrgybo9cv57ADIne/pE/7yQOqZ0LFwJr/pYjIuW6B+aGre4dpAG?=
 =?us-ascii?Q?Y9HfuMpE+3FZYK5kjbj/3css0r8n+Raok/ekLcuqofhvF3DjBhOOoyaGyLo3?=
 =?us-ascii?Q?D1nAWnhGjR63axZ3WtHylZEqxaFfhu5Mqv1uJD+NHS0wPdStfOql2NT1c157?=
 =?us-ascii?Q?vfe2G97iK8oSEnIbMmlifcUVGDx+UbKB2TJChah0a48+x5s5jXqNVMEt1uqB?=
 =?us-ascii?Q?enW099zdvwUtEknZCbowBgG9fz2jXvcrGIVoDQOvrdECDmmQAXCe7ZklYqin?=
 =?us-ascii?Q?n/AInrHPmF1sfY+PK1sd8+v9K/1R0V2yh8rlAUzgHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2bXlkZNqMTCpYJW4g/LB4DMs6yVc7jvVOaSZF7ET7Rn7vRYogOvwjpxLUMK3?=
 =?us-ascii?Q?pgu4D4uNElhBw85irONmLJjebFDKx7kqTuLzDSpNumQS/WvHtSUELF6Y+SgA?=
 =?us-ascii?Q?ylhZ1JrV4X1ryVMIuddMUnNqWMmRWGANQSk7TG68m1Vh7LayllmqrFxyGk99?=
 =?us-ascii?Q?0ECdBs5nUxcVhwdpeU+ijUpkP5EbGyjrdrgWggpaoO+y28xUCLIKo8RnzmfW?=
 =?us-ascii?Q?z4tinplgXvhhxvsCcig/S9NR0WeKXrd+9dy2Gno1igvc1wsULhs8oOIVXofF?=
 =?us-ascii?Q?xwpFu5H6mFeodH1zQCpu2JwKh48YAxOyheiRbJVAsE74oYqRC5NpqyuU+a0n?=
 =?us-ascii?Q?z/Jfe1Z0KlkxIywNxPbMP4cmAa8Utw4UXcPzWJYwLnFTSJFjnbx0ojp/sLin?=
 =?us-ascii?Q?57mzgsID6Xew62sGxOYKAGXlifaxxLQa48mrGCuY9tJJL9vRl6vo5XfGjPQi?=
 =?us-ascii?Q?zDOFN6lBIjf88pWwbgLPSLgljsYqppUt2pKlMwZysqkdtXnKSZYPsF798cqT?=
 =?us-ascii?Q?qmB3sBElMG7s8bRTV6zVCSobhVHs7qM3mkMZHjGADdC+Ywd9nYrhxny8J2LD?=
 =?us-ascii?Q?xJOeoHQ1D+nB4Qsenlnkmpe54hErAzS3Z8Y/upj67wSSw6/6La9WVrYxYARP?=
 =?us-ascii?Q?4pi2NOqCndhc6vTANlGzW/E0mh47PglOL0a/R9hHT+on+Ed+0t/szID7tqSt?=
 =?us-ascii?Q?cVfq6YkPRefKp/DB0smjgu9/bKUU/GyDhnpUxx6x6OJCGe3oDJsAFt1SNVEP?=
 =?us-ascii?Q?RWZr5aZQeak904TJzVMaDGKqd9+iDkFFSnTTyOI1h9dLk3JNF4pNnaQugxlR?=
 =?us-ascii?Q?rVONMivTqsi+OIon38alj8a0bDGFxZqHl+Syka1KBeNLJEwZ7ebhTxbaFW4e?=
 =?us-ascii?Q?/aO9ZsRH04fqpzLRLXxl+Jew3NmhUJZLYw6PD8bHko+0K4uzqcB/CHiT/jMO?=
 =?us-ascii?Q?OL2h/hTI5D0gGXTSdacSmjnqeeYtZGFCMSgsDlCqdfkYYJ9ETkLHjTuMl7ke?=
 =?us-ascii?Q?+ajB/bvpGsDW5esezLuUUH4hJ5x/EBgtN6bEU8yLiI6epvAJQ8erffM1hNks?=
 =?us-ascii?Q?kOihdr3in43uYPH0ciOLtopP21ISNUKrIg8K7YiDM+a1r9lIyYIMuMooM2YI?=
 =?us-ascii?Q?PrafdrF6AH2UqvNj9u/l8hRwpHFVFM22oEibYaXFoNnDWkQn2eeW7UqOD35z?=
 =?us-ascii?Q?ROPpx3TM3GiwJevYsrbX5OgMh+jNEK4QS9O8cs2FvnM0mbxh+JCXZKdGu7tC?=
 =?us-ascii?Q?EmS7wyQl4TyEeZZsYsuiEjVgISC7+8UHWsnhYkpj7YZVUzCW6fgXzO/5S9Om?=
 =?us-ascii?Q?/Ew/ZJjgFQOscFKCmMYY6ELoRU/Lt74EJkbRpRhIGprciGHCYoAimQZWCCJ0?=
 =?us-ascii?Q?RXD9y0FMmmH9BSz9P8yMypgpdKWQ19bSIO9itgvBo4Rd+15QEInswp9OcKzy?=
 =?us-ascii?Q?eUJkhPiBMF3vELh6FX1fEnvWPGwbF4bTPc7L4GjBBTi9hilk9jnGaq7V3HMM?=
 =?us-ascii?Q?4Tk1+V3EBehvZFcyU9OerrucADf3++/XfT28ZnVaNiqaK8jRtG8gNB1pli9P?=
 =?us-ascii?Q?UPbHzel+ptSnPJ5FHs4HIkOMIBQQdINyC0VOfWrKRX+20ZrmC0Zv2tno/yNM?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bed872-225e-429a-9a79-08dc75d3760b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 18:10:26.1297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDA2ZI2OrJ4loybVmfQS7wMovb2FzV5WmGn3eKmisVcqpJMTONXWMcnd4EcogNJ8fXRf0cCQu7hnvwx6EEq9Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
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

If display is enabled, the always-on components will always
keeps runtime pm references, unless you put DPMS_OFF.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 9e1f1723d..a80964d1f 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -791,7 +791,9 @@ igt_main
 		igt_describe("Validate mmap memory mappings with system region,"
 			     "when device along with parent bridge in d3");
 		igt_subtest("d3-mmap-system") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mmap(device, system_memory(device.fd_xe), 0);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
 		}
 
 		igt_describe("Validate mmap memory mappings with vram region,"
-- 
2.44.0

