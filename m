Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7631CC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F0410F937;
	Fri,  3 Jul 2026 21:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJuw1cMa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C14A10F933
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112688; x=1814648688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sitsWE98AkvKAwy2nyCId2CtHNi+KFtf1AFdNidR0YU=;
 b=oJuw1cMaHGEJGtAielBifGptWZN1/DxaK6xIhH7liK7DemNT72tOCd3Y
 nJDLD8QEEDPklnzeNpyRztN3kX5Wd+QB/5Y779EkOmSuBuL7geIM5yOFI
 j9q8umJX1ZALjlbjF+kun2q8f7U/3yriHJ5MyeVr7EisXDARVQjK8GtqS
 X8nQSlbAnG5JJUBdA+bIhn0LF1/c0f3/JRhxtNBHBP6yT+9PZeIuxUKxR
 sDg1rqg1jDRrjyU5o4nPG8rd/dPJwoJblcry+YVdn6K5xcYme84KBbNyJ
 HypYYZOYs42lbdSh9epcHJuQtBkl4zWfqwNx6MB399o/betL4Bzzk5NLU Q==;
X-CSE-ConnectionGUID: UmIEVb44Sc2qoT8kUk+PTg==
X-CSE-MsgGUID: NTBmMVtLS5ySYBzQ7lNdKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="71383202"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="71383202"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:04:48 -0700
X-CSE-ConnectionGUID: E8owvp27QR+L+Sm8O2x0IA==
X-CSE-MsgGUID: qNRKYI/BT8icGnXrZ6Hs9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="291329648"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:04:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:04:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:04:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:04:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsuOms/JdW/nkNUy+LKv/aXYJE3Wd/mb1fONAChIpBEPPYw8ubtirSO4K1hMpKmVhpXSKyIfYw2L5vJGkbXcXs/z3YRSMlLwIGjzq5VMhYB/u0hYbs4CEShr8/SlsNScGwsjaM7TTZYHoaH6AtB2yZmd9v5m4ZuoDvRL+BteTYccFgdKSnr2aR1XeEWEiwvL1YEX7JcIvhDlJ4yPrLCLhqiWwrzr+FrAhzfXwmG2YIxYV4uKUhYIip2f7KptxklKYbxeE+nST5m61diuVTSjO5vVu1Atwr7FjhjVfzZffquIiS2+R8kg/+oIw0QuzuXW0eWOiRNtWSEzY/U/FffpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YH55vY/gz1kBR61L4RdbG07kcIoDyAYho2FwMtcC8kc=;
 b=TVhgtDismQ1tl9IgO2mezhURpN2u62UF4rCNQLNi4iNKwR6l7YaBUqykg8+avfCY7h9wLnyfcBA1mQH14QDlX/+Tl7ifsRZOGrjoPtFFcbsSV9/S8iZwYsjbGr+sqAPnNNyeNh19Ifw4DA6Ll8ffN8mHbWBTdixqP/sQliRl1g8VkwL3nnpHok0x0kCvLUKxH6EFxSJ/y7mnSv1ESJvCH6KhG21Yeu/rnfOglIdmKvW+OwJflL/DFysZwI8UKe32mf8yilOVOjTCuWCWSvFkxsNZnP9nZqe28n3JAloE9pjsqoP+nBTxERDDMg1g6JkXBx1ekTHcXqBtTY/z3J7uvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:04:45 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:04:45 +0000
Date: Fri, 3 Jul 2026 23:04:39 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 17/31] tools/intel_error_decode: link with
 minimal sub-libraries
Message-ID: <g7tkdam3qg5slyynevhrduyl4bvdnzic3kf3ipypji43k7n75a@75uygfqgkepw>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <67108b63bf342a3a0d2ad2e78549265e3e82aa8a.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <67108b63bf342a3a0d2ad2e78549265e3e82aa8a.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0164.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::18) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b54bffe-223b-45ec-7e4d-08ded946b574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: rg88063LUvaWBwYKVNB8g8coCa7doFLWkTzRwZZAamFJjYE7q+gI2QrqDrDTPpMH9+HIYhb6tluGrEpPBcDpo4EL9dFJ1rhNIJ3pspbXeffpKgTFCncqMwx+PCeSeVnZU0n9ailb0HCKQyJ8YWSyNvEzhKENN9/HJk3yRxtw2S4tcBuYGfN9OdWpCYIvyw67tSXcMOwsn8iEVjfDYiyMrWttwXFvmKCHxJgXDZe6t0BAR75zNA1cVJP3X1yVMm2yLAgKorfetaOFLBklC3VtdHot8amuHYbz5fSDhP7nSzZQi826a6dgQXMHY2OlQ5nRnjGlA2+e3plWljN5qPdKIedfma6WnBrasDlE4mD/ODS8jVsZOUQSq8Beb36y5BM5zB13fciQ2HXw6Sq1970FOrF5lGSgaVFNPYp77mOJkqX5HRC6bzDu7iBF3M+mfUlCTt6UCbSMv8j6EHYwB7xKXuowS5gS9c6VjA71dfhlOZ6rTQEbvbv49+wbDi8pXc1qCIVPRDdg0VJuWhQkCTG+QNLF29sS5Djt1cSXTY2cqonnoEZxgHMUO/b4KtoZl2HbVeHgeTVDAoboOnVei04X3CA9HkDd3fUfvmilctai/yvVQdgvJqav2Nq3CBdAsSY2BgQ2aSRPu/vb3b96T98y5ok7jnBJiBGZ/14TDZtzc6M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDVDRGNFN0ZXNkFmLytZTFdTQ3RFYXdXTDVVczNEUnZrZTJjek01YlBzKzBE?=
 =?utf-8?B?cS91Z3NQUEtZVTRKVVVYdlNDak8vdWpzVksvVUREOVAyWVV5RzgyWkpBRUpB?=
 =?utf-8?B?QzdCeG5hUGs2alMvbmxpeWdaek9md09GRzJZTE9pelJTQ3pCU0J6OTBqY3hN?=
 =?utf-8?B?c3FxOUVqTGxOZkJBOFp5YlhrQUYzcDE2RFdwblVvMXNpZXk0SkFQWEFVVVRO?=
 =?utf-8?B?Z1ZzN1lYUDJlRnozSTdNcGloQzBSZUppcG5pZXM1Nk90RXpLMjNqQ0V5dDVY?=
 =?utf-8?B?SWNXUkFjeGZSZkNTZkhQMzFjUnV5dkNtRTBHQ29PUnBLZWJNaG5hZFdTMlNu?=
 =?utf-8?B?emRMSVBJTHJLa0Qyd3lucWJCdDdwOFluR0FudHFQS3pwQmt2SW94ekhOdUU3?=
 =?utf-8?B?d1l5UjBzemJRSjlKeENUdk9sMnp2Wlp0YU5BejB0UWhZd3Z3TGo0U1U2UjZr?=
 =?utf-8?B?RU5KME5KWGUrV1NCbXFKZ0xZdm1rTjhnQjJySEwvR1FUd0dCVWp4RXZSRFF0?=
 =?utf-8?B?WnZoZ1Mybkl0TzN3ajRaaHlTenVFd0VZdHM4cXgvV3ZsdVE4QUordkJHakNR?=
 =?utf-8?B?RmVyYk1PVDNWUDlodVRlSTlmTERxZEN2bDBlZFo2Ynk0NmhzV0I3eUpFSFpm?=
 =?utf-8?B?MCt5ZkpJOGhaeVlvWXAxZ3NyclprRXhndjVMenN5NUFmOE5obnZ4TXZ1ejJ6?=
 =?utf-8?B?VHVieThtMms3RzRDR1d3OTl0WjZiM0Q0eUxzVTMrQzBNZTh0aUhNQVcxU2Vx?=
 =?utf-8?B?azZIcjJTRDNZRXdzRWVMTjF1QllFcGhrcFZFeUJ4V1dlZ0ZFRDhHdmNDdFZL?=
 =?utf-8?B?cThacWhxUGI5ZFR6ZElJZ2tET3lhK3d1Q1EwS2E3Y0FwakwrdmZKNVcvS1h3?=
 =?utf-8?B?aDFyVE1sMExjVEZaNW9NZmx1WVd3UjFKeEVZWXdYNTFjV3AzTU1YUEZ2ZHRR?=
 =?utf-8?B?VHNhMVFDK1AzSGRQNkU0Nkx6U1hkeWV1eXJHMzFSbEN3OUtQTlduaWg5ZnlM?=
 =?utf-8?B?VFBDak84cldIcVpabnp0bEc5U2JTZldrRjUvY2I1Zm8rL2t0bGF6bzVFdUg2?=
 =?utf-8?B?Nm5QbGlOWWU5U2sxY1VQKytiSEJVYXFBTFBqQkE0TDdWNkxtb3J1MFFTaXA2?=
 =?utf-8?B?QkpwSTRtSDVzRjNQYjdaNWVOVExNNXlTbml4Z1l6MzQ5Yi9PZUg0Z3pZeGhF?=
 =?utf-8?B?TlhRZzR0aS8wU0VzS3Npajl4MmRCbXp6ZzBRRm83S05NMGhxY3FZbE9xdVdF?=
 =?utf-8?B?MzdRbzVGZHc0eGVtK0diTDlWWVJrU3V2UWx1Q29GK1BJcCtEUElsU2JjS0pU?=
 =?utf-8?B?dlZBNjE5QUlrRElHb043NG52SFJWMHVjWG9IV1dTQll1Z3pOUzRwZW1jYWlZ?=
 =?utf-8?B?Z2FCY2MrZ3hOOFl6MGFRMDFyTXFhR2J0KzhpVHBsSFh2dC82MGU1cmJaNWNi?=
 =?utf-8?B?ZE55SXBJNVllT25OZUhRK2dlVDYwaHNUYUFKcnh4d3hRUS9NcERsL0pJMW5S?=
 =?utf-8?B?OEsrQVIxQkJXZ2hPeG1Ydy80ZmFUUEU3WlFqT2V2K1ZJSGdkZHQxUG01c3Z1?=
 =?utf-8?B?dDBVRWUxRmM3d1loNVhaQ0Z1TGMvVmFmbmtQNzdoQnNYSEU3QitGcnJMcE9O?=
 =?utf-8?B?dnFoV1FNUzlsM2x0Z1k5SzNVMUU2UUxNRmRSZENrYmNmSnpneGlaYUdYZjNr?=
 =?utf-8?B?cmdCcktNdGN0MEZ2Vm5uVC9LWTA4Qm5OUWJQNThJc0R0dkFGSmJwdWRFVGh5?=
 =?utf-8?B?RTA2bVRHSFFaeUUvcEp2N0JCR09oQk5YeGpOc1B2ZC9OTGthUkpmRkcwb2pQ?=
 =?utf-8?B?RHhHYWluU29TNU9YRzBiNzBqaXc1TThlaU9qc3VRNHBldTlkcEpoTmE2S1ht?=
 =?utf-8?B?dUxzam5lOUlsT1dla09kci82anpPcWhyVzhCYnAwWURGa0lRNFN2OE40aVI3?=
 =?utf-8?B?MHdncWRrY29ZTXBXWW1jYWxRSkl3cDdVL2dNVzNuNnc1cmgrZWZWcnNabzBZ?=
 =?utf-8?B?bXppVURMY0diYkt4enFXbFozY1c0K2k1VkRhNDYxakVITjZjWWFCd3BYd2dO?=
 =?utf-8?B?UHI3eTBQUDhmSWJwWkVqSDM4V0crVzlGb1B3ckJleUM4SEtVamtvK3I1MFR1?=
 =?utf-8?B?bW9Kb3dINGxvRFg0T2l1NFVlU0NJem9BT0hOWXpuMnd6V29kejYyUEIzRzRt?=
 =?utf-8?B?K1RRdlFPZzVnQ3J3blFkVFJLb1pNK1BwSTJyMEZ0MG81K1lHMTE4SVhIMFla?=
 =?utf-8?B?YUNvbGN4Nk0wUFYxOGtJV20vd2JwanduamFsOGhUY3AwMi9aQVgwbHZ3dHlH?=
 =?utf-8?B?clI5aUNZZytadXE5QkUwS2o5NkxuY05XNHMxbGNiQXFRKzl6VE8rSmRLcEVr?=
 =?utf-8?Q?YEMND1PUYg+Ognhs0oYZCgaDKdt+y0et1Ad7KqkD1KxDD?=
X-MS-Exchange-AntiSpam-MessageData-1: l1BnPm8pciwoMKBnDmZcR00ovh0RWG79t58=
X-Exchange-RoutingPolicyChecked: SDQVqpdinC0942/mOQTLYzoiDvaIzuDF/9CDca5BtExNSJxyVpgt3Eoek1KYtk7K373RYHN3NJz7pCLSXIMElQkjHmhdDwg5Nt7V86vhhzVmGwtk43gOQDwy+OKOX4gEOr+/g1NIOTuC/L+Qh8QHBTrsJ78wOndiXfwB/CQ9erhGzypPdKx8OJZC6A4P4yKdc7DyhEkeEL/eCJCJhjYOiXFQYp8LqmP1moSFxrsqfNr10WTwLflga+fIC7uzH329wY2uRa/bFTw5gE3SG13cj87tYCRqTNsuUcC2pQ/u3eSL2ZG36Ccb5qFkVu1dFexgXhBlmjJ/SzWzJ/KMgoAIgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b54bffe-223b-45ec-7e4d-08ded946b574
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:04:44.9765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KulhChG46LGQ7eVwqvMhXGOXYrOv59FXpBOOO9CAZzTmJUb86Foq2IDuScLBCT2HRTc7+/y4eqs6HaOCjeekdMr62+gQfdeJfZbAmchiir4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:51 GMT, Sebastian Brzezinka wrote:
> intel_error_decode needs the batch decoder, chipset tables and zlib for
> compressed error state handling, but not the full libigt.so stack.
> 
> Switch to linking against lib_i915_decode plus the minimal helper
> libraries it relies on.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 467b8eea1..b04754c5e 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -20,7 +20,6 @@ tools_progs = [
>  	'intel_display_bandwidth',
>  	'intel_display_crc',
>  	'intel_display_poller',
> -	'intel_error_decode',
>  	'intel_forcewaked',
>  	'intel_framebuffer_dump',
>  	'intel_gpu_time',
> @@ -84,6 +83,11 @@ executable('intel_dump_decode', 'intel_dump_decode.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_error_decode', 'intel_error_decode.c',
> +	   dependencies : [lib_i915_decode, pciaccess, zlib, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
