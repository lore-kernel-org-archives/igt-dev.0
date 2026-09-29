Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D28CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 11:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3285710E9A1;
	Tue, 29 Sep 2026 11:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFW8dSjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F91E10E6CD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 11:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790682296; x=1822218296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EGZZ1iGgZyvT+CHf3ZoD3Ljto+qtKirj2nqNjTUbhC0=;
 b=DFW8dSjXuS2gXq7K5SrEFrvRQcpR+ejUVe5ZfPgpsavoCqhMFteMs0G7
 TL26rJmw1QZ5QVkbVRIhnFoF4+yXlYjAan7sDoG2f1AInQxWS3fjyG2sX
 u4Ik+4kAQm/4lAjr/Je/c8NByXXXLQOQff3x5UK1YLk/3IaQKiSLhNsVQ
 vvJNbtUNEE9LlnaWrKn1fZLpC1csUJYfc5D9j9WmZ+okC0xJqJfngLePb
 PTmsQSSBKUkG8Wmfdd/hDxloKzZ4IEvOROW9/X+U7Ty4s1rTZLdEcP32r
 iRGPxo1Yippf4XOa8U7vL6TdiSNiWMZVNqooi7MMWiwgmn4SnqWwN/ukt g==;
X-CSE-ConnectionGUID: BHRxesXtSoiJlU75IXABOQ==
X-CSE-MsgGUID: LA4Y0s3AR8Wa8XTxber77g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116929594"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="116929594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:44:55 -0700
X-CSE-ConnectionGUID: VHyjpoeaTa21QqUOd8AY1Q==
X-CSE-MsgGUID: XUecVRwTTaS0UVUcmnCZPA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:44:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:44:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 04:44:54 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bwhn0EnAX1Fp628LDb3FUUIyD9ZJlaVybJJ8/RaxMuEjIlO6QFTa/gzgUwpjVGyrFE1KIu6iVL2lamdt4+bIfNPA6H42l7z7VMvTuEuhK77NErM2ZPGgE5fEh9hDEInBx98K1N7c7rUhM6B9+WgK12jzKkClzO8Sq+q7nEFMqiePyGqxm8IH0+ozoLyDa2TbQSDcC4/CBFaLD59SWcn5AtzRzfAEwJj8HVC2DSH9spjsykLJ/dNLJhAO35ap+LPdnfS/8PtF0Uki5Qx/qRa4nRG/grMqX9sjV8KabQ0ZBKflzddaGceq1jNViIRCguOOmPm0aCVYh140Gs7QKDX55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C79EUiyYcvwqy0VefsjwIUjMoCzgdg41zZQySn9F2V4=;
 b=nCiKrKYc1bwlxQyYCDNedy/KIapiCb3H1Tk4/iE8K/h4chRD1hUnKVC+a7jq5F5p9PIr8stOIOmeKM/7f8IDNyNGR3zEmfyfcpasEZnMxg/b5Y6qT9LlBQcjDHK4i1K/TnutZuCdjVg5kFISbooP+p1/esvNflHB0moQkoLQLSu660oqSCPvStBTBdBIO/kaZlYUkL2SjZOJZhHHSU3kfPaQBt2idSJ0oJOQLoirsAyWlkF/IFW3bWx54nRvkWHm+0YvmdcO75Vp7ehxU4XLNu2xf9Q3flmxbJpymJZwpSXd1HWEAXwathpfasHEez0a8P8TJJ58prUSPVLATnSKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 11:44:52 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 11:44:52 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 1/4] lib/igt_pci: Add raw configuration space helpers
Date: Tue, 29 Sep 2026 13:44:32 +0200
Message-ID: <20260929114435.2961154-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929114435.2961154-1-piotr.piorkowski@intel.com>
References: <20260929114435.2961154-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B7F.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::607) To BY1PR11MB8054.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CO1PR11MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: 2360ffe1-fca4-452b-93db-08df1e1f1299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lKSlCcnXi/J8F67UnbLIjavrNoYu131YAIMiavc6iNxztJEKhURfkW0pwBFHA64MOhG7gnTV9BgyJUu/ElJYxKfQ8sXQ9LRf3w8oVhBuNkIh3TYZVDRX3YOVULJdhYPqck0g981LZDrrHrkXbfOiJQVPg7ePuTYjVtmvBPGBurK7OyNRkD2EcxR6a5+Sc101w2wg5qqBIfDp4NWIds5IPrygNcFEY9uxNCkY7N2eu2YUZlCUHNGm4nGLDyOuXrLWZFVve28ySHz+/6yNqIGiXa3bXHzMD7y9xWVMiBZALhCx6mObGY3AfSXIeDSf6yndQMaaCjHN5Yr0UkyrfX5UZXEdbSS2lqieYmml2Zl3r/1KlNN74vf85Jx7paYM/EmVh4t6uWfZcv1HjonjI+AQUCUO5c1q0HRBpCKPUwYlHSM9sUapscA9xDgi2tzAdley6Z8KbNZsJMud8gB36UQ9ruHZJUT8SAnomfz5DFxzYe8SRuA7/AULJ+f7h0oXQ01gA0RkqRY3fwDGauhTX3TaWUMZy8fEc5MEml12Ma06pazu0BUZ3corcCSRNagP4vEPMMt7AyQt7ep9ysDnlcW0n6nj2YMhAcx+bbsNsaOtZvOALMpZA29NgFgHzBxWEZrU+0wD/kr9pqI2Bx8+4HxRoBSaCL+f8j2DBiDQuhy4IBM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGVuQkxXYXMraFFkdTA0Vlk1andhZ2FJWjg1TU8rQ0UxWnlxU2VNNUlMSlJR?=
 =?utf-8?B?bmk1RHk2RG9zaDJncE8yR25kendMaEl3NDZzdGcxNTVFcGJWU0tPa2h4bE8v?=
 =?utf-8?B?ajNiaTV5L2FEV0xmdnFBRFpZUTdNOHltM1lZMjdOeS9ZejNQS2gvRGF5am5N?=
 =?utf-8?B?ZEJRTlNibm84ZjBnckVsL1RZUU9IUWdpTWVJbWpyU2YrcWRVSW55OVUyOFpv?=
 =?utf-8?B?aGdTV3FTUDlxczRwMzAwdlpMcmRVM1RDUzNpZXp3Tk9wUkRPVmQxcitsRmQz?=
 =?utf-8?B?THdTaUg4VFlyUC9WaElQdFVLTkc0WnpWQlRBNGxTT3NydytrV09zUmt3Tkcy?=
 =?utf-8?B?TkdaZWczTlJXSWZwd3k4WXNab0dCOVgxc2dQN2FEb2cxTG5CSllPSlVUamJt?=
 =?utf-8?B?V2ZmMm5wWnFlZjlpbk1jYWxpTkh3bk5WTHUvQWxpYzhod2VRUnl1b3JUUFdr?=
 =?utf-8?B?NFZvRVUxQVBkZm1ReThWWmhDUHBBYkhEenZwaGhBNzNOQ1kvOTcwdGhSenpx?=
 =?utf-8?B?T2h0eXF0ajR5V1ZhdzBQbFNDVU9qa3JiNGtWeFU0WHVkVXR4RGZzbWVEU0s0?=
 =?utf-8?B?OHllT21lUndSVFpjekJSUnBQc01BNGpFczl6K0dlTFlQZmMyS3BGU0FRZThD?=
 =?utf-8?B?QS9HR1YvckdaY3VrbnBxZ096eENOK3VKVFJGZmpUejZSMkRtRWZjYTVMckE2?=
 =?utf-8?B?bnVOMC8zR1BOaFowZ1ZYcy9LTFJIKzhBN1JKa1hVbHViMi9qUUhEUVRlRWVh?=
 =?utf-8?B?UXZ2cGUyTE9hdTI5ZlEvTHo0amF6K3Nrd01vZzIvRlh3aXBuck0zMVpxTUI2?=
 =?utf-8?B?UEwrM3dRVWwvRnNUMkpGdzV2OEszdTJEdHQ0bVFtWHpEK2Z2WnBVOEtGSUdo?=
 =?utf-8?B?WGd6ZEFQemtpUko0VTJQWDQwbU9sc0VBU0hUbEpMMVUwa0ZiWDdxRmJJVGJx?=
 =?utf-8?B?VFQ1cmMxaktZRXJqc21JY3ZodkF5SnNCbmxrbkR5SWhqWnRzcitibjhNNzFa?=
 =?utf-8?B?WU5PZzNBaTdOOVZyeXA3VjgwbnJpM1hZaFh6QU1scTZMdmNyK0pNZU5Db0Vs?=
 =?utf-8?B?SlhMbGZNb0I4UUlBZ29TZkU4RHZIaFc4bExVV3R1aGptWENCdjNLeFI1SURP?=
 =?utf-8?B?YVBlaVBSTzYwaklBbVV6MGlXNDhmT3JNdHZUaFRoNlprb0R4RTEvU2tnbEpm?=
 =?utf-8?B?SENISExnVEFoM1YxZGVQUnVnQmVUU01HNHZLYmY0a2kvS0Qza2hMZm90WDBk?=
 =?utf-8?B?MFd1V2QrUmpVbGFieXVYZmhIS1dld3dCcmJjcEFsMHJLOHE0M0JDR2dPVTlY?=
 =?utf-8?B?a2dnVGIrMHpQNk9IYU9XZTEzNjMzcG84T21Wbllha2t0NG5Dd2pQMzZVZmtF?=
 =?utf-8?B?TEdLVHI2bHFrWjRCekY5cGpRRXNETkg0VkhmSG50RmhHWHpPaDVrSHByVjdI?=
 =?utf-8?B?NERMemQwYVpoUGRuYUlsdGdVWGlVSkdjM0d3UmFteHkxeHBqZ2tXc0MyTGFN?=
 =?utf-8?B?czZHbHBmVHdwWkJRNDB5TStHTHlLY0hEdlpDVGxWN0lPeitQbTVjVlowbkgz?=
 =?utf-8?B?RFBkblhKUEI1eHM1d1hIcTNvd1lFUkVDTXYyNzBRNFpwbmRiR2JZc08vUnRP?=
 =?utf-8?B?dS8rbDFtWi9pWnJYUmE2U1V3UE5GcFNyY0JlbGdGaDVTMEU0MjRBM1YvSW12?=
 =?utf-8?B?SlkwUHI3ajFNd3JMOWNEWFE5QUNMMGcrc1d1dkZhaDZjSFBuSmNHYWYzUys3?=
 =?utf-8?B?bHpDb050SktIUW5WVkRWUnlnN2kweEVMU0lIREg1Q0hVRWFoZCtNVENUa0xt?=
 =?utf-8?B?NmRNazdTN1dtT21hcFBzT2NQUGs4aHZiNEcwSUFqNUlkcjFyQmF3ZjM2UjQ1?=
 =?utf-8?B?bGVzWnZZS0h4b3VNdm93eUlwRFMxSTVHd3BLaHVpbTdxdlNRY2Z2OWV6ZEEy?=
 =?utf-8?B?UDdzUkluYWw1ejRVMUdXK1BuVTc5aDdlM0twMzEwWWJOY1BnTTUveHlKM3ZL?=
 =?utf-8?B?TDBIZHRmWFRLY2xwaDhnWUhQd29RRFd3QUFGeUIvVkZJM3g4N0JnOFJwYWZu?=
 =?utf-8?B?OEx5aXIrWFBSbzdMb1g2VkhWSWlpS3A4aFNkZWZBbmt2TVlKc1pYdVNlV2d5?=
 =?utf-8?B?czRwMnR2bVl2RmFrdW9sZ1ZmV0F2WW8vZzNKdWZRTjFSRUNkc2traE5KL0RK?=
 =?utf-8?B?TitlR3ovMUVONmMxRHhaTEhJbUtUUmZScUJBTGNaOFdVaGI1ZkZMa3RkbkVt?=
 =?utf-8?B?Szd2aGZ2Ni81M3hiQmwwZktYUk1YYTJkYjg1dmt1VEQzYkU0QnQzbnZqVkN2?=
 =?utf-8?B?cng4bWhnc3cyQXFzWnpLbnhqay9MZGQwYkpvQi82RSsraWlxanhDWGYxQm5h?=
 =?utf-8?Q?23FKRTCrlusumPI4=3D?=
X-Exchange-RoutingPolicyChecked: 4qjCG4aSfcs4FoW5jsUDLeU7uZWqvoUdG2QuRtgAOtGyt1d7ETjjvs3G3qjlDrPB/tlIqmB6h30rhx0RjQIOulWmgN/RY2p7ckgq2hjcN4MrkZFm2orWPYbdLky7OSaTGeVevuF3dLjkM50Ykw254ddQTqTIpmb5WSkOdTE1S17tCRDtx6un3XGrh1WxSE33It1BgnqdfRBUWuUQAIEcVzkWC91jCLAOcW64sX3YyRq7+624EYpaBJ++iJ3zdfQZ7WNVrZ1Hc1EcZn3etkkSUstxjtb+Zk21UHHd5n8FMpugcOVexRLEtigjbNLm2XBYre+clhwZ8Opiz8yYGHmq+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2360ffe1-fca4-452b-93db-08df1e1f1299
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:44:52.3837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVK2bl88IHz5BANyCjRhGKoMo8A9diIEUQtwlG5qHToCBHZj+Kc4Z8B1eXYdVzO0Q+SKVQrm3EaZ74IX4mLMDU3UJwWnCIiqaLG62140df0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add helpers to read raw PCI configuration space from sysfs and access
its contents.
Provide little-endian u16/u32 readers and standard and extended
capability lookup helpers for configuration-space buffers.

v2:
- Validate malformed and cyclic capability chains.
- Add unit tests for capability lookup and malformed chains.

v3:
- Share the capability list walk between the pciaccess and raw helpers.
- Mask reserved low bits of capability pointers instead of rejecting them.
- Stop the extended capability walk on an all-ones header.
- Rename the capability list start parameter to cap_ptr.
- Document the remaining raw configuration space helpers.
- Use PCI_CFG_SPACE_EXP_SIZE from linux/pci_regs.h.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GitHub Copilot:GPT-5.6 Luna
---
 lib/igt_pci.c         | 191 +++++++++++++++++++++++++++++++++++++-----
 lib/igt_pci.h         |   7 +-
 lib/tests/igt_pci.c   |  76 +++++++++++++++++
 lib/tests/meson.build |   1 +
 4 files changed, 255 insertions(+), 20 deletions(-)
 create mode 100644 lib/tests/igt_pci.c

diff --git a/lib/igt_pci.c b/lib/igt_pci.c
index b63550b390..c6d184463a 100644
--- a/lib/igt_pci.c
+++ b/lib/igt_pci.c
@@ -8,6 +8,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
+#include <linux/pci_regs.h>
 #include <string.h>
 #include <unistd.h>
 #include <pciaccess.h>
@@ -16,35 +17,71 @@
 #include "igt_pci.h"
 #include "igt_sysfs.h"
 
-static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
-				  int start_offset)
-{
-	uint8_t offset = 0xff;
-	uint16_t cap_header = 0xffff;
-	int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE)
-			/ sizeof(cap_header);
+typedef int (*pci_cap_read_u16_fn)(void *ctx, unsigned int offset, uint16_t *val);
 
-	if (pci_device_cfg_read_u8(dev, &offset, start_offset))
-		return -1;
+/*
+ * Walk the standard capability list starting at @cap_ptr, the value of the
+ * capability pointer (e.g. read from PCI_CAPS_START). Returns the offset of
+ * the capability with @cap_id (any capability if 0), 0 if not found, or a
+ * negative errno: -EIO on read failure, -ENODEV if config space is
+ * inaccessible (reads back as 0xff), -EINVAL if a pointer points into the
+ * header, -ELOOP if the list doesn't terminate.
+ */
+static int pci_cap_walk(uint8_t cap_ptr, uint8_t cap_id,
+			pci_cap_read_u16_fn read_u16, void *ctx)
+{
+	int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE) / sizeof(uint16_t);
 
 	while (loop--) {
-		igt_assert_f(offset != 0xff, "pci config space inaccessible\n");
+		uint16_t cap_header;
 
-		if (offset < PCI_TYPE0_1_HEADER_SIZE)
-			break;
+		if (!cap_ptr)
+			return 0;
 
-		if (pci_device_cfg_read_u16(dev, &cap_header, (offset & 0xFC)))
-			return -1;
+		if (cap_ptr == 0xff)
+			return -ENODEV;
 
-		if (!cap_id || cap_id == (cap_header & 0xFF))
-			return offset;
+		if (cap_ptr < PCI_TYPE0_1_HEADER_SIZE)
+			return -EINVAL;
+
+		/* The two low bits of capability pointers are reserved */
+		cap_ptr &= 0xfc;
+
+		if (read_u16(ctx, cap_ptr, &cap_header))
+			return -EIO;
 
-		offset = cap_header >> 8;
+		if (!cap_id || cap_id == (cap_header & 0xff))
+			return cap_ptr;
+
+		cap_ptr = cap_header >> 8;
 	}
 
-	igt_fail_on_f(loop <= 0 && offset, "pci capability offset doesn't terminate\n");
+	return cap_ptr ? -ELOOP : 0;
+}
 
-	return 0;
+static int pciaccess_read_u16(void *ctx, unsigned int offset, uint16_t *val)
+{
+	return pci_device_cfg_read_u16(ctx, val, offset);
+}
+
+static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
+				  int start_offset)
+{
+	uint8_t cap_ptr;
+	int ret;
+
+	if (pci_device_cfg_read_u8(dev, &cap_ptr, start_offset))
+		return -1;
+
+	ret = pci_cap_walk(cap_ptr, cap_id, pciaccess_read_u16, dev);
+	igt_assert_f(ret != -ENODEV, "pci config space inaccessible\n");
+	igt_fail_on_f(ret == -ELOOP, "pci capability offset doesn't terminate\n");
+
+	/* A pointer into the header has always terminated the list here */
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret == -EIO ? -1 : ret;
 }
 
 /**
@@ -61,6 +98,122 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
 	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
 }
 
+/**
+ * igt_pci_config_raw_read:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ * @buffer: destination buffer
+ * @length: number of configuration-space bytes to read
+ *
+ * Read raw PCI configuration space through the device sysfs config attribute.
+ *
+ * Returns 0 on success, otherwise a negative errno-like value.
+ */
+int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length)
+{
+	char path[PATH_MAX];
+	ssize_t ret;
+	int err;
+	int fd;
+
+	if (!pci_slot || !buffer || !length)
+		return -EINVAL;
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/config", pci_slot);
+	fd = open(path, O_RDONLY | O_CLOEXEC);
+	if (fd < 0)
+		return -errno;
+
+	ret = pread(fd, buffer, length, 0);
+	err = errno;
+	close(fd);
+	if (ret < 0)
+		return -err;
+
+	return (size_t)ret == length ? 0 : -EIO;
+}
+
+/**
+ * igt_pci_config_raw_read_u16:
+ * @config: raw configuration space buffer
+ * @offset: byte offset within @config
+ *
+ * Returns the little-endian 16-bit value at @offset.
+ */
+uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset)
+{
+	return config[offset] | (config[offset + 1] << 8);
+}
+
+/**
+ * igt_pci_config_raw_read_u32:
+ * @config: raw configuration space buffer
+ * @offset: byte offset within @config
+ *
+ * Returns the little-endian 32-bit value at @offset.
+ */
+uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset)
+{
+	return igt_pci_config_raw_read_u16(config, offset) |
+	       ((uint32_t)igt_pci_config_raw_read_u16(config, offset + 2) << 16);
+}
+
+static int raw_read_u16(void *ctx, unsigned int offset, uint16_t *val)
+{
+	*val = igt_pci_config_raw_read_u16(ctx, offset);
+
+	return 0;
+}
+
+/**
+ * igt_pci_config_raw_find_cap_offset:
+ * @config: raw configuration space, at least PCI_CFG_SPACE_SIZE bytes
+ * @cap_id: searched standard capability id
+ *
+ * Returns the capability offset, 0 if not found, -ENODEV if config space
+ * is inaccessible, -EINVAL if the capability list points into the header or
+ * -ELOOP if the capability list doesn't terminate.
+ */
+int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id)
+{
+	return pci_cap_walk(config[PCI_CAPS_START], cap_id, raw_read_u16,
+			    (void *)config);
+}
+
+/**
+ * igt_pci_config_raw_find_ext_cap_offset:
+ * @config: raw configuration space, at least PCI_CFG_SPACE_EXP_SIZE bytes
+ * @cap_id: searched extended capability id
+ *
+ * Returns the extended capability offset, 0 if not found or the extended
+ * configuration space is not accessible, -EINVAL if the list points outside
+ * the extended configuration space or -ELOOP if it doesn't terminate.
+ */
+int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id)
+{
+	unsigned int offset = PCI_EXT_CAPS_START;
+	unsigned int loop = (PCI_CFG_SPACE_EXP_SIZE - offset) / 4;
+
+	while (loop) {
+		uint32_t header = igt_pci_config_raw_read_u32(config, offset);
+
+		loop--;
+
+		/* All ones: extended config space is not accessible */
+		if (!header || header == 0xffffffff)
+			return 0;
+		if ((header & 0xffff) == cap_id)
+			return offset;
+
+		offset = (header >> 20) & 0xffc;
+		if (!offset)
+			return 0;
+		if (offset < PCI_EXT_CAPS_START)
+			return -EINVAL;
+	}
+
+	return -ELOOP;
+}
+
 static int open_pci_driver_dir(const char *driver)
 {
 	char path[PATH_MAX];
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 509345b2d8..d7d6f96832 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -15,7 +15,7 @@ struct pci_device;
 
 #define PCI_TYPE0_1_HEADER_SIZE 0x40
 #define PCI_CAPS_START 0x34
-#define PCI_CFG_SPACE_SIZE 0x100
+#define PCI_EXT_CAPS_START 0x100
 
 enum pci_cap_id {
 	PCI_EXPRESS_CAP_ID = 0x10
@@ -27,6 +27,11 @@ enum pci_cap_id {
 #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
 
 int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
+int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length);
+uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset);
+uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset);
+int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id);
+int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id);
 int igt_pci_device_unbind(const char *pci_slot);
 int igt_pci_driver_bind(const char *driver, const char *pci_slot);
 int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
diff --git a/lib/tests/igt_pci.c b/lib/tests/igt_pci.c
new file mode 100644
index 0000000000..cc10a6c812
--- /dev/null
+++ b/lib/tests/igt_pci.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <linux/pci_regs.h>
+#include <stdint.h>
+#include <string.h>
+
+#include "igt_core.h"
+#include "igt_pci.h"
+
+static void write_u32(uint8_t *config, unsigned int offset, uint32_t value)
+{
+	config[offset] = value;
+	config[offset + 1] = value >> 8;
+	config[offset + 2] = value >> 16;
+	config[offset + 3] = value >> 24;
+}
+
+static void test_cap(void)
+{
+	uint8_t config[PCI_CFG_SPACE_SIZE] = {};
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE;
+	config[PCI_TYPE0_1_HEADER_SIZE] = 0xaa;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa),
+		      PCI_TYPE0_1_HEADER_SIZE);
+
+	config[PCI_CAPS_START] = 0xff;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -ENODEV);
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE - 4;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -EINVAL);
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE | 3;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa),
+		      PCI_TYPE0_1_HEADER_SIZE);
+
+	config[PCI_CAPS_START] = PCI_TYPE0_1_HEADER_SIZE;
+	config[PCI_TYPE0_1_HEADER_SIZE] = 0xbb;
+	config[PCI_TYPE0_1_HEADER_SIZE + 1] = PCI_TYPE0_1_HEADER_SIZE;
+	igt_assert_eq(igt_pci_config_raw_find_cap_offset(config, 0xaa), -ELOOP);
+}
+
+static void test_ext_cap(void)
+{
+	uint8_t config[PCI_CFG_SPACE_EXP_SIZE] = {};
+	unsigned int offset;
+
+	write_u32(config, PCI_EXT_CAPS_START, 0xaa);
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa),
+		      PCI_EXT_CAPS_START);
+
+	write_u32(config, PCI_EXT_CAPS_START,
+		  0xbb | (PCI_EXT_CAPS_START << 20));
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), -ELOOP);
+
+	memset(config, 0xff, sizeof(config));
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), 0);
+
+	memset(config, 0, sizeof(config));
+	for (offset = PCI_EXT_CAPS_START;
+	     offset < PCI_CFG_SPACE_EXP_SIZE - sizeof(uint32_t);
+	     offset += sizeof(uint32_t))
+		write_u32(config, offset, 0xbb | ((offset + sizeof(uint32_t)) << 20));
+
+	igt_assert_eq(igt_pci_config_raw_find_ext_cap_offset(config, 0xaa), 0);
+}
+
+int igt_simple_main()
+{
+	test_cap();
+	test_ext_cap();
+}
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index f1db66d07c..0a7c903f16 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -19,6 +19,7 @@ lib_tests = [
 	'igt_invalid_subtest_name',
 	'igt_nesting',
 	'igt_no_exit',
+	'igt_pci',
 	'igt_runnercomms_packets',
 	'igt_segfault',
 	'igt_simulation',
-- 
2.34.1

