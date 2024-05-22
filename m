Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C85C25B7D
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEEC10EED4;
	Wed, 22 May 2024 14:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmTIM5Cl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5A210EA28
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716388423; x=1747924423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ClB6gx5XvWJWVUf7mBrp/ztbkTewGqqajEr5+7d4OMc=;
 b=jmTIM5Cl/Wk7Hf2P9Ibn/IRdRJ5WrsaftXSHDBrvKN469dnwbK4ew9a7
 EQp0SIrW/RJ8qt2TJhcODO/TQdeajyQVttIZCBAzk2mxf4NsBRVhShnt0
 9lDU4EJL8d9GSB7r8mbImz+1Nmkuy7Lz8d5xT3auxrYJ8QcnyKWMQyx4H
 h71ifZa9ROayyUkMYILXLMIcS0mCSPwsBjm0jUiOSnTugLlvao8b5D1kB
 ImYqF6sZLhtx0PcHpfJLBnauSWvn+U07zwDGZgwz+vVm/lwJt1Jw8Lh1U
 me25KJPhw/34IzMZJtA3/xzfkfYcFtFiIkHCBa4I9MlOhiHLc949LWELz g==;
X-CSE-ConnectionGUID: qepGn2b2RLi+gd6tH1tx/w==
X-CSE-MsgGUID: Yh+TAH3PRn2G5Jg9V8KKZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12496069"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12496069"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:33:42 -0700
X-CSE-ConnectionGUID: CPpPJjMBSDOHcuAi0meJ5w==
X-CSE-MsgGUID: KO+j/ohYS7uuBr+EfwaBmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33298800"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 07:33:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 07:33:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 07:33:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 07:33:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtS6a71/y7swKqWXMcZ7/EXam6uvmW3fnAtgnTwrqws9oM4gZcVyYLZhtBX2ye7nhnzEimuMPO4agKuMeaUR8y0udNOnkx1+mTn5AJfFvg6s7rlaCazbRJTq9agXZct8aM0TKIWoBmFXVL/zBcbW3WAE8+/zvP/2yoEmnwkfivedD/iipyCIC+TvM+wfGSomRW1nM8/AlH+jijvjwI3XN5pfjGSgid/j8ejN0UFabaZ1UYfxvbaXaf9VyQOFqYK5wi3NKLFfcwhqvmw+iJZJfeqXHNn/+uMe2BY6MB4GH77dvJnIZR81FJDnouO3UHP82bRJVfxk94oQ2tbwxI/xVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdaQIZqAcAVXwfY16IXTnhQ75DTYJHdenlQ1oW33RnA=;
 b=GOrYodbCVvVBmADXIFizRnh6Go6oEthFG5qvxiDut53e8mI0VzCzxlm/z6jikXajf/rDB1fT1Jp6DVsfvLX0b0YUIhj00mI8px10clva3/WmzMmdSXn3M/3nhy06RDRh7oipNM74sZmDwl0GVF6YgrEjRMpiE+RMqxfNwX3nmPRxTRoWOnW9Ufq3vNpvyv5x8Wmp0JIl2SdJXjDKhlbMJr/hb2Qaamu9Im6BgWziBJzlW6F1GSCz3bZXfgp3hhT+twEBL+pU3kxkVX/3kmdJ+S6vKjyJ9lUOAFYiyEPVjvgN+zr5ZJH1lJI/4oZ1y/LrlnSyhcaevNO7F8OY6rVN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 14:33:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 14:33:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [CI 3/6] tests/intel/xe_pm: Also disable display for mmap_system test
Date: Wed, 22 May 2024 10:33:27 -0400
Message-ID: <20240522143330.312014-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522143330.312014-1-rodrigo.vivi@intel.com>
References: <20240522143330.312014-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 53684add-66fb-481c-5c5d-08dc7a6c2c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FwhABL0r+8nDyglrbWCwnd8U70diBZGPrrL6h7HARC8M7wSZiRbB4/xkmdVI?=
 =?us-ascii?Q?ka97GJ1WzxR6cHuGV05U3+fY/lNFRfUkrbKmkmLrQ3Wdt26EUmyWKUDg7Sry?=
 =?us-ascii?Q?0HdD2tx7vaKvikVCBkElgQHcEsDhbgYNAiMuYF6SIEFPiYUsK6h5fBnQDioq?=
 =?us-ascii?Q?Ga5H783heyI7QW24WEfzLUIRuIkTZ3pVyzf7dwywU2cFCu4MPE7/9jrSmAjZ?=
 =?us-ascii?Q?iBTM2kd/nQON5crlqz3xNgSdFjdbwP9/Hlh1Gci4mUTrLWbkiwM24geygn6b?=
 =?us-ascii?Q?W9N968KjCCaybuLzqUtqJEVBO+D/o6lucWp46N9qYEGH5KfjJy/yLeFqsZGb?=
 =?us-ascii?Q?ncQRXJZ/9VUZbH5d69bNEvWHg8uUBOvJjU7msuZODdm45wcfIIiARDcQ0pFy?=
 =?us-ascii?Q?dVHOO6+vhav6wtL2P109BaLcyn7BXeu1/YI+8iKE95OFKqd5BsUkv7pRXFqd?=
 =?us-ascii?Q?xuC9LPaEb3Qdz8gt+v20A1Pm6+F8bi6eF+6b0/JNmsEFiAxx22EOouFGUDkb?=
 =?us-ascii?Q?6N3ug3sEvXloF1/Z7twsNvSXlwZLHt32n0v2MGPsB5Wh9z4P5cTgWHlGqKve?=
 =?us-ascii?Q?MgjaTOf5DTF2rJiMiTfybSD7xtD+Nnr82P/fSXyUpo02IcQCuxqjGgu3DVlv?=
 =?us-ascii?Q?5jAYCoifhuXc9Zv/n7NffLdqu51Rjq5DQZ5G+A/DiYXcduBF/jUUMgKh/Lzh?=
 =?us-ascii?Q?H9LTTJABNfo/hZz2dOb/R55keok71vwXNVcuDnjyVquBJFfsx54yPB6kzl4A?=
 =?us-ascii?Q?xjx4UWL0ag4qCt+kjCdDnaEMs2FXd/FwuxbpImF83J3I9CEXmlsTHpWJvjyR?=
 =?us-ascii?Q?Zt0lv4NVzScKK/WPTBmLanhUVsR7RL+4N5aqsTJ4FMgfxTCn7pBa6n0aTyuf?=
 =?us-ascii?Q?SpjKohCjd5wg7KL7HIzJ4S/TJxHhYBpcicbht/NMYglxKFFwQbf/gmACQiuj?=
 =?us-ascii?Q?kMAVOh63ku0aIapOwvdkxNo511aXcm6oxiDOtsxJz6rXuyJVJ4B+TpP6Xnux?=
 =?us-ascii?Q?ueQxmwk3rt46cXF/T4intunHt4Ct4eb1wugXAbx/iaXdPalHpytPew2qR59R?=
 =?us-ascii?Q?6BH9vpcRI1Uh6bBHZhSpVLTLHDO4UmQLrCtXCakxOCXVl549/+kuSnrTyHnO?=
 =?us-ascii?Q?+a1Oq+H5UwUNkA+hQNdZCBMCMp7/rrKpzjYEfnPFVTfxoo7w7jJy773OlXqy?=
 =?us-ascii?Q?Yn12zQnEcl9vjMsU3TNEWSQK8h87R9Dd6o92eau4AD2nHzUszCBSksvBvVc5?=
 =?us-ascii?Q?X15pPybHV+ea7V3V8+jCum99l0aN0D323f+pXMNJ8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qRgYlQCJRH817782O9l1M3LuPQjiEmDq++drpgzITl0GNXo5vCpWPKq+FqGH?=
 =?us-ascii?Q?xVp73Znrt+EmUc4N1qrRk28ev4duYCLmSTjPaYHeYM0AdXvNzft9CqKN1njn?=
 =?us-ascii?Q?R7JUC6ITLsN6zHL55W54v39PDEL4NlSN9t8LspWY2d+gTOqPvTwD30uYe3Pt?=
 =?us-ascii?Q?sO9qG4nmiaOsyIfR74E36nIozEPQURAk409k4rSGC6YWGS1HNrPQLvuH0J9z?=
 =?us-ascii?Q?fz5BNmR47D4s+YnrzQiwl+JmxR7VqYTjZSYMPXZQyFBrEQYKBiiHfpBHiTIw?=
 =?us-ascii?Q?cJ2uSrww0l9S4he0jTJsf2qsAP6a5ThDpE9morVLr7OiMAH7FR02L/Sejmo1?=
 =?us-ascii?Q?jOEhPvO0idCIyN6E4j1BQ4TQTiPkkgoXdWrdEu9JlGUplp6dxviyckXaS+V8?=
 =?us-ascii?Q?PlIOT5fpndtxuE2b+24s/NJQsXfkiFDF/ACUbL1hrWQNWt2dFw6rNA4o8uC/?=
 =?us-ascii?Q?TxN8L0XR442kCkomUDRS/fRCvDQiKUDAjaPfs+JdTKYp41mtNh2HQ2bK56km?=
 =?us-ascii?Q?xY1a7xOfFkqAofmrD9UW45BNe5ycBK8mZLQa9fhQgONaIg1H6WTxpSmwmACj?=
 =?us-ascii?Q?ipUodCj9yj5MFyTN1blI3eD3KCv1agbWoU+9QPPQobseD6u/H9FJlWe48TcG?=
 =?us-ascii?Q?tFctNweuctE7NhESeiwotdHtLTh9ECjd5nrXgNSPtdZRpvYHzrugT6Ix2U4q?=
 =?us-ascii?Q?Wv0G9tkxvd1Y10wiXbJgZ8HLZfItXgTkWdf4xshJSWkVxpBaBRQYSaE+N4tU?=
 =?us-ascii?Q?X+AYN5D2mzBkJZ7QSaCIM4zcNJgQn3Bo6DQ6KuT8vMKqhbeHAjEXZVEjdoyj?=
 =?us-ascii?Q?gVymfVJtiVPCPDlAwecCSpy01gXs6wcim8UMTC6rr05m5p7kd6vQyS04AQcU?=
 =?us-ascii?Q?ICIaynXJVQUOrAszk5B/8kJmRfnJ2+wvwlUmKy+D0gcj+iEq5ZGmNmjN00fE?=
 =?us-ascii?Q?Bi1cw7pYbD6QQDNQvZAybK4v7WVsKO3O5mHed/KQpMpMBcZIDRuThXVHP0aI?=
 =?us-ascii?Q?Q0xWu30dqLy5/9TT7wL57ToAw61tQ73DV0X/+wbjUKwPRd/TQngmexbY+i/F?=
 =?us-ascii?Q?D69coHUzkLI1lZdG/txzDm/utY8IYZRySvVRmRoG/PiWNUxUYdp4i8VFHo1e?=
 =?us-ascii?Q?zSjnJ74IYQca+zhemj7tyiSOkklm7t937OUiuME3+Ee9Nb6trADXHHQAM2HJ?=
 =?us-ascii?Q?vkf3fc6qBDV0klK/yXlt1ULFIX2JoKhuDBQT7ZMhnqFqLKMm0mpu7H9/USYr?=
 =?us-ascii?Q?518092qDy+2D+lViuRQ/yH6YJ2I7OGTeQPtG5vXBvHs5BqV2AUuqlsmIRoe1?=
 =?us-ascii?Q?uLYKXskQ02liKUCDzAx+CMA1ehEbQ8yB5SsK6fykb9VbrNircIbfQ/OEfMgZ?=
 =?us-ascii?Q?bU+CtgYaNqei1dUQv9dAGbW3xzf3PV0vru6vwtapO0BUIAqrBFdPGtOvHfYi?=
 =?us-ascii?Q?acf6YMWCkiyaCTbcksEZPy08+7J8Jsx0bdxa5l3k+ckcnCiz9/7NA3JQMCqH?=
 =?us-ascii?Q?j/uXAKLAVQ7UznCodP//u2pYkd4lIMK2ntIwiOl2aGOFlGBcmgOnwSlBk1xV?=
 =?us-ascii?Q?nvxZq/KORCW9J/SsAVuYtxwutHtXItjyy+HGHEuLfi2nhv3x7nmyImYvr2PG?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53684add-66fb-481c-5c5d-08dc7a6c2c78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:33:40.3124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4nfhVm4nK+TYll3QklkXaGDYjwE3NSw1/pm32RLF3V6dXR1iQavQzwY5Cd1oz713SGiVgPS9Qj1Hyq7F2n80A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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
index d301ad031..68e3dd1ec 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -793,7 +793,9 @@ igt_main
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

