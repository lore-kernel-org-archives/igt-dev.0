Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0DAC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A1E10E631;
	Wed, 29 Jul 2026 11:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGA1aB5I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE86E10E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323015; x=1816859015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wwP045gL155ItBsXt1Q9F3ANSe5pI7vNyRgew1vv3Ys=;
 b=PGA1aB5ISQLOgBa4x+5R+BlOTsqJ2xSHjhDGpq8is867j1EfJXZ9qqag
 zvSMxSDekOcRVg4ueVogJau7DNhPRCzPwv5z/Iwz1LLLOh8RUlmanZXSt
 q9HwhEMCsZIYvfSfZTlUOXwusxyjR2Eqx7IIDfS7rf2EMP7ETWJbGP6Dt
 BGvW7YWeiVu3q+y762sXUYQC7wSDABEHf3h0GfB2N69dKB9KxbJeY92x4
 H+oQ+MUvyk9X48XlqcOdZkIyGqNRF0500/XZXq8eKAC2y75o/jicR+5Sx
 +OhmHWnxyzh81pRBU2rucVtmKhZ1firf7oyU9JrNosEtBC/JG1aKLJh4m w==;
X-CSE-ConnectionGUID: o20eJ9RdSK6jOUhtvLNy2w==
X-CSE-MsgGUID: tobPIFY7RK2KRv2RRVCN+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108719015"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108719015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:35 -0700
X-CSE-ConnectionGUID: vWCtLf9UQwqv7FldG/ajYQ==
X-CSE-MsgGUID: tN8WN3AHTTCbJhHh9280BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204805"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:34 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqnzENmNdNDPCxWcFLtxLvNinf3Hsbxhy1oa7H96dIbMBnJ74gR1tdZ5SRW65FKdAxRAgedogZWNsckL3YszwVHNiMERG1p+3t6/LMX6C6MdVgK0hUAy9rmbabsayMj0XPVxydtBZsLMsXxxlUAr/hodb9vzNiAYYqRolU8S4D9LSzhzhB5H1yHhbYZkWx33lHIaJ2pzLuQgSdGuYi3nGh2Vkv9z28L1NLEiHUyl/YAOvqD69y9m55QBZ9zRyBbBXoDM6ahv2a2Hn29ldmt44qizvACCGSAFvWWedO2oqzdx+QSUBf4B3wNLmUjD4eVqCf5/Mqu4RMVXgNT5QqQvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0ndYiWin4HFUYpgQgT6Cs2Xl36eoCOajmubf0EmVPE=;
 b=L8uD+Lc5GbavhiwYCEyK7wJUDgA7Ynl0fzQkrmeoTXCXyck19eP42kBwbNWaxjRInP4Md8bqQTugsLKaqfg5Ldl/l0/AiMF0NRxfju3+XiSu8/ms4FtTp6MVgItJ2HXTQdHvL0DytEW1YOgcvvtC+hTxFqjXGzFqG3urfk5jv03TNSv2SPJFveWMTcIZKaRcoa8mLCfp/iutJXGxjTqwtLSFd5J1L1pHqug2gGabn3fcDgYUf6j3aFGzG7GdRwSRHmVJLA0/0uLvAwkxVrJrA/E80csapvUxj/uAJS8WhhLlB1m4/flQeyjJ8D/fW4AOrwlmNiSJuEfOwJZ5dxK89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:28 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:28 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 20/31] tools/intel_lid: link with minimal
 sub-libraries
Date: Wed, 29 Jul 2026 13:03:37 +0200
Message-ID: <3c39e7b8cacd457f3f2f45779506fb9732eb366e.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b7fd1a-93a3-4b0d-d61c-08deed610495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CKZtR2Pk12anGJOYfvFbgI513dh9vCqr/mXrK7gBUy9slC/E2MOZkKnzZhaM+uhTTZX9yW8Z/FCx0s1WarKRWaUXj2wrE86FZEEXKXDlfEf4OvG+I+3NCmA1+IENLxL7MAcCGyPBx8ZqdRng009hivJ1klSbKbnqjepDoKCTFhCG9ANA96pZM/Bfo4hSjc1z0so696IJuCeDpYbkK88F+D4ehvfrss30zlHgzi3JhYDkn5fOtvCAFZkubAskwoVt18atynMQaq58t3fV5yHw9Bjy6ltxV0Ld5MKIzP4ydMqbAE4sth1hwyElpOq2HBBL2dEidKmmbPb1h8rKQumAuH/ofS4RUVxIt63+x9ODTfcXmXe4v4f/Qg+uL8lMN3XuTT4rMYJ13fjhARsqSIFSpm1g31RdVARdTSvQGj7oogZPEoZdijxV/2QetaZmt5EmW9eDozGSCB3y0jJ1ij/+tafFqCpN24hq8ZWnZvKPBg3+mOl2CMJc2klYxjLfCDgPYvtZxSsxpmQEWmGUEqvvw11DXTiIpFiC83ZhmGFwliaWHb6o6etpaQ8RftO1BW6zGObpNWukoljWy0iD/+Axhwee1W5e3WWAoNVEM2pEIL0G5i/TXRXq/T5la+VRHZ76KtjTfoFY4fNXbUMbagfweMM15m/hBq/uKX5YBWnkCFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nqKytA9mgqFP+8rwUj3D1Iys1jIHyauc83hzJc1Nr2PC2RonGYLhL/0QGT+/?=
 =?us-ascii?Q?45O55BOIuRJkDjbuKHH0DDdC2sOHjNKVd1nh/+czfYTYD3KFhQxFvVlDofql?=
 =?us-ascii?Q?m+rybPOgPinPwOOO3nkkm35vOqnSQCEfje68Hv+h5X5di4Lgtlykko0HwDi5?=
 =?us-ascii?Q?3lJ1ZSeVlKRHov57iUK/DJXOlq7/dzzFTz/6SQlnBKSIIBKptQ5kRsCLYvAJ?=
 =?us-ascii?Q?zJGBNyqopz99mwO40iIT1zr4+AynxRzUl/ygO2dv0k03MBm1/HUAOBG+bBH3?=
 =?us-ascii?Q?BH9OyS+zrEcWat0eDQzEJe3XawRSL6gHzr/jZMcQf5p+nrrJsDJkhv8Kpiu9?=
 =?us-ascii?Q?6ZScuVD+EeoiaIj37cTzVy4MfL/53+U1wpq5ttC1f2lTKe5Aq24waXtCSjMl?=
 =?us-ascii?Q?HfPbNPTGlnbumQXgkc53YUkBckBxcsSC9CrCpCgrySueb8cGWrLml4VBm+/3?=
 =?us-ascii?Q?k/l0cOBc0bttdRh+/hBKBd3IokQ1Mxo8YfvXpN74PG2k8POozISv2ANscTEF?=
 =?us-ascii?Q?9lJ9RIK3bX0+ohA/QTFinBDMK9AM5TMYtV8mwzg701c7JlAQhCHLyR02KaUN?=
 =?us-ascii?Q?57OMfqWMXbCUOAX2aUqbQWggO7FflzecfAvFwWCCgSPvfTOodcA5Z8ymLZVE?=
 =?us-ascii?Q?9I5xsCFFUUkXCzh9F5ptXZSWBo28s0sYLJ+8BnBzVm0NhcmOGC+DdAT/5Skx?=
 =?us-ascii?Q?HpYtX4si/z8y4YISRqUtm/SHjCYTI/87nvoDxdjDrWUvUKIDPh3C3oCLNHao?=
 =?us-ascii?Q?Z63xrEgGtiWBSG0aXniSCHrBFtWMn3mYuMpPdzGJHASqXNgwjaSnatg0eWOX?=
 =?us-ascii?Q?qtcwtOj4N/crbGYaM+WEi2Wg/WG0TrUTqW5AY/NnGc6mGRD9p8WBi3VIoqT9?=
 =?us-ascii?Q?H8DE2R0KN6xk8LFbAE5+MqB6QsGKH8R3pS8zRU9TNiwEC9eNweik4rkz4yv1?=
 =?us-ascii?Q?jdXTwLts5JJCwY04ypzJ49p6Y7jK8tfgRCKkqkq9yzUjtd/q5TcXTUiZn3bv?=
 =?us-ascii?Q?OquJGiM/hly1vz7K7EtHLALIx4igwXY5TxEu8qJH6D6L2rHRyihbfO8lhMQh?=
 =?us-ascii?Q?KRU/keuvmjVSR/lADscDfdXeInawaLi9cA4K85Y5/0El3Nh6vShwHM+vrltl?=
 =?us-ascii?Q?mNGo8eD8q5FZZEvJ21lWEpQyX1Bl089PFDGdWn+zkdtXqIQELJfbtUd9dSkR?=
 =?us-ascii?Q?GtvQFLq3AByy1w6TJS4HpPzo54X6sR6O95UkpG1rZPFrohwd5HQL5FGgieT1?=
 =?us-ascii?Q?b8bS3BDwu6nB4tzIJRPlzbwyhNr7QyUEAYyg60QXmGFyq7B/ncyWdhni2Q/q?=
 =?us-ascii?Q?fkGUgS4TLCq3zhcv1/hExlM58bzZ2uGiHBdaUQID+aQcJsj6cjYk/UpycI+u?=
 =?us-ascii?Q?y01WbDegArv4tDNFzudX+47zJTkqPOuq8yXaVSDfxv28J9GS+0XW5CaNpt1a?=
 =?us-ascii?Q?YjSru1btYHVm+W0YbPzesUdfANWGiDQW+Y4s9zB7dNCqebFq1INMf+g45nFr?=
 =?us-ascii?Q?nOZK4xFIRQoOElxAUjVqHdbXVvHfi+oaMsKj0EKMOvdmcKGDsq8pqt6dl/6T?=
 =?us-ascii?Q?caWzmWRadh99vN0pNdbKbEqvx8eocahDnlwM536wj7xoP35zjtwEcNyZXWLB?=
 =?us-ascii?Q?K8HSlLwv3zQR65wkIQryuvBTqnWV9j5Jm8Au71rMZc2ET9GLx2gDizFdTdqP?=
 =?us-ascii?Q?L5TaRyLTdTDl9rgjLi8vnaokmggWXaA9MoJdubLiMbDqywvcdfK+lNJOOOst?=
 =?us-ascii?Q?/Gpl12QuNSDvnNNW0BRl0+F2AwvGiz4=3D?=
X-Exchange-RoutingPolicyChecked: GyXnyNS6cQCsn/F4YcihZzaw9ZaxjYYnjVghuW2lqYrSn9EErvUVpGqEUV8K5PAu+RMM8GxUTX8WPhV7Jl+BlCeBe14N0yrtfF3A3DYOHIHR3BAtV2/TCBrTTS04IlvPo6IuZxbFv3ojAZE3fCD9HA9t0twhfKdwoeS8rh2eE9yxNWl3b03F5dmFv3433tMEsKG2nU67glw+detZxyAtFWq2NbNNc3h3mbfugd1NMlt997u4o4yyfZzgpmDGYV5Ii367Ibv6neTqmUVdVpvH5Q0wuqTkIEjsuwyeGcotCCAxdWsQpQdpg1KWLUPnpVHXTHb+i5FWEWjMrFuVu89z8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b7fd1a-93a3-4b0d-d61c-08deed610495
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:28.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99wcrKCMzSYQNVPv3NT2HUF5hQIUiId067+HhRuqgknUEI0VK5VHJiF6B2k6LcVw+HKDy0ItEyOhGpm8taKscAiy7+yyX+mJKpZB6SCNGRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

intel_lid only needs the register/MMIO helper subset, not the full
libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8899a5b49..0978f8f11 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -25,7 +25,6 @@ tools_progs = [
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
-	'intel_lid',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
 	'intel_perf_counters',
@@ -96,6 +95,11 @@ executable('intel_backlight', 'intel_backlight.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_lid', 'intel_lid.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

