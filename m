Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33C5C5DF82
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 08:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F64410E168;
	Thu, 20 Aug 2026 08:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MILkaP0z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A398F10E168
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787214324; x=1818750324;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=xYXsNYKD06ynZPgbHcUDNA5UKKJdfsefPFtc3UHTF1g=;
 b=MILkaP0zipyAVbvQNHw78ctwg8dURwwEAdzo+rjWnSz2ClHsmQfbhNbV
 m4FWn4fryZf5liDOTrlvi1Kj1tS06SIS4EPYafzNVrvuCJdo5jLYNHyeA
 juU5Q/sc1d+KsoSHbtDwZwyejXjlD7v7mQWHj3prayVKoZCCV+42MxqeY
 pXAL8a3rmIW/HAmhpbmC/Q6ZRvwgb7QFigvnxAQ74oMscvuYeqGKhoESp
 71r8fYWjiL/l9oY4ZLmoNi80O+fUNavWgtikXBb7UMOhBAksdeUN7tNQy
 7VNkjnY1+nx5FSkMcUvSY7Zrv42gVEXwraPczvaJRL4dlk430FxjmwENN Q==;
X-CSE-ConnectionGUID: 0Wjb36i8QIuQt2idWA5s3A==
X-CSE-MsgGUID: m+ilPpDmSs+3Q6pftWhvVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86692319"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="86692319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 01:25:24 -0700
X-CSE-ConnectionGUID: G+OY9HYsS/qBhHJe0NOPtw==
X-CSE-MsgGUID: B7DCTFXfRmGFKBiwf/rcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="289413579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 01:25:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:25:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 01:25:23 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:25:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLbo/skA+LKep+TSJOnwQkYDVeX6Ix0UdoT85IxOrwAweVXdiQnZkzBWLizT7tV0DUcATpqEaUGmoi8HwQeZSgU7AKlQryF9s3HxbLEG/0X/RrYLbgkie7hMdIInj9H/DF7SKB83N7hw9xFXtiXSNUUlaT5tZ0wvoGyMVDagER5SNlZ01EjBRsgi6c3gmmPtHTrNBEgUozbBOUFAT/SVHqqYeonKm69aWsJmIIY+5h6yQrG6CqZuKc+JR7/85nKO2mvgUOvXbnjw5iBEo23uGrAKkMP6MgCiTQfHAUmp+5VA/jheSkTOMDrr/1wkjIHmIjTPgLvFfL9sBjo0WrCqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYXsNYKD06ynZPgbHcUDNA5UKKJdfsefPFtc3UHTF1g=;
 b=Chjz8epw4DyJ1eInNsHm7QRuLDz4IHW/4VDs6ogW2EnP0fjUi8d6thEwjqx1958wNN5nyTeh9J+EoYG62j82GwoTh7SGYnqctPqlXJ7j+3Y2To5bkpflEwXVGpth03zGJqFOQFEu3rRp9di76uAjzKEAY/qIx3XYGilGNnmC5cAHrzZcCCU5A6P9nfIGIIwJPcdOW9BTlp6qVyRaiczTsgjLACgX55EN5nv3vTKqAzxEYaz6XpRl3zYxa7f6enP8Hadcc495PgakYVxh0ewrDi5yWR/T9LPx7Nl5qqw6Xae5M/k2OCSy5LAiBvhoEliegwX5VtqmEBvY0nQ3c+ffCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DM3PPFCA4893B55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 08:25:21 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:25:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 20 Aug 2026 10:26:58 +0200
Message-ID: <DKTMMXD1PMXU.2TRC9WWVA6HPQ@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_params: add
 invalid-offset-multiple-buffers test
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: DU2PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::23) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DM3PPFCA4893B55:EE_
X-MS-Office365-Filtering-Correlation-Id: e1580e29-5159-4482-9d22-08defe9492cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: xCzvOdWpkyFOHeXP4Aqi4ZvVpXQ6a8rn46Oeeqp3mAL6Ztaa6ThT/jYue+AiBSnorGhVU8e9W/ip3dQ44O0/pnVz5r3hZbK7JZwGIe6Kr+CdebUMXx6gmCRYlV8J8vhmo+Tjm7GT9OijqsBpu4y9DD0c9mVkvrkW9yzZXqY6/ehh3BSNh5OJgSoVOXVc2XuOD4mVRZUXZmXRRhtA6jgAeTkE5ghtfL2shCI00Cu2go3KDyEG4FF4xyhi6AIC54b/rxHyBmwd/fiyT8/FnoikdIz4PH8+hA3qSnclZmCg+put9RifUGHPV/XCP8nmV8aaxFtVAXVCnu6gTajy7A9uASkbqTVUW9IKcT+SsoZJzm4Zik6ZRmsSY5C96/TxEPNowz8rhWicClCHPD7hPjjAswH4FNTGJTBi8w1E3ZlW4Cogrri9aS2OIjns+ua3vS44PgTxMirPZKhcqvTYQsFRQmnds7Km54KqshwM6jkm4VHvsZb0ICb4n7ruY7u5iNCtvOfNFHHp9Ilst14zjt6KsHmMgtH+M13Z18fkXIZiXtuxStkoOPRJZKDurLktkvr9hBUA4Utc+iVBuZiCHGG2WV2/TrgUMs49Ry+7bZa06UZ1H7+QxTClkaAfsV3qNfEZONxJG2FpM5hFFiTCaggQ/NyqK7+/6zqyY/DDwUEZbas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU00VVFIb3o4K28xOFV0dzZOVXhqRmlnUXQ0bUlrczBPNjFQbTNNeEJwR1FR?=
 =?utf-8?B?MWhRRklxMktKVmxBVlJPR3dJeDArcXVXaDhZSWdWYnhCZGJSanRONUkwN01p?=
 =?utf-8?B?NVpxUTA3R2ttWVNpdStjaWhSd3RwekEveG1wOHNpWit2TW1wa0ZBME9rSWda?=
 =?utf-8?B?RkdqWk1vYjBQUzZ1WEp1eVAyN1A4NVlYU2tmZ1Y4di9Odk4xaXlxS0crVDcv?=
 =?utf-8?B?amxJeWFWQThrc2xjNFBYU2RJeGlBYjhYMFJPUkZSQmpLa2dhbjNJc0xva01o?=
 =?utf-8?B?dVlTNDhhTG54enZya2prN2pOdEdiQVc3Z1ZaZ3h1ZmdyV3RDdGVRQzFVWllv?=
 =?utf-8?B?L1VJU05hOGZacUtScnRUTGpEME1EY3Z4QitST1dpOGJKQXVGU3hvNjI2bTd6?=
 =?utf-8?B?Qm94NGE3UTFFT1Y5RlpGeXBOU3lqR0FaMDdTWFFuWmN6Y0E2cGhSdnBMZ2ll?=
 =?utf-8?B?RXZYOXkwR2duMllUcCsrUHlKWkp2czNpaDdPdzUxQzZXeUVjc2x4czM2ZTBh?=
 =?utf-8?B?S0dTUWt2WG94Uk8yc0I0MzRlZ2RrcXNtL3ZNeG85dklXcnJDdmxuRlcrQVZQ?=
 =?utf-8?B?L0sxcVIxNnZ1SjA0ZE1pL283akRrUWFPWDRqWk4yL2U2bURLQnYrK2NUWDd1?=
 =?utf-8?B?WUNRQm1BSDN0MDkyeWVnaXZqVi92dHExRHF5ZW5VWjFSTWZnMG9IUE5XS0pS?=
 =?utf-8?B?bkw4eW80UjQ5ZCsyNGZoNHV1d1Noc3E1TUNtcjJkbTg4RUVkVzFzNTdzVUdt?=
 =?utf-8?B?dHBHYTR5YXJnSVhyU2VBQk96dENRd3VhK0ZqZW1uaytra2E0SFZsZlIwOVl2?=
 =?utf-8?B?NzJPUG1FcGM1dWpnUXc5TXYyZEZsV2ZvYTM0S2YvK0d4N3MzZUovMC9XZm4x?=
 =?utf-8?B?MDRBQ3VVaG42dDBRT2FYUEtOamlKUWgwMDR1UmtnRTRTZlh4eTFNTUhXOXIx?=
 =?utf-8?B?eUxvaDRkL0NPam1BM3hXL0pvMnJlSk56cTdHcHNadkoxNE9ieGZuVUNRSXlL?=
 =?utf-8?B?UGlueU5NQjI4TXg0eERqdE53WXhnYldnRDNldzUzNytqUjhHekxRNmhLTk9Z?=
 =?utf-8?B?QjczdXViN0xTcExtYW9CNlE0dXJqZDl2dW9PdWh0dUVPSTNwVU9tc2Q4Rkdk?=
 =?utf-8?B?c2k4ZjltZ0puWVhZUzdnWHExU1BhWmhuS1gvS2ZyS3NnYjM2eFV5Z014YU1o?=
 =?utf-8?B?cHprTXljVzJwbitYUE8xV29ORTh3Uzk4YzVXZHJucnNjLzZoOEtLSDR4dDQy?=
 =?utf-8?B?VTA2U044ZXhrYWM0aHRJUTJlTW1QUVJudEYvWEEvRVMyUWUrT2c1Q0hjdVhW?=
 =?utf-8?B?UEZNY1c0REtWZDB0L202dUNPaXVHNTF3SEhXQ2hpMi9GSE5jUVd4dmVnd1Yz?=
 =?utf-8?B?YUdySHVXMzhLL3dLSmsyVUVBZjNBeEFyZFhDNzNXVW9sZWlVOGpYdVArT2Jq?=
 =?utf-8?B?Ym1MRW1jN2ovQTd3ZGVDc2tlWlA1RDRhYk5wSkdPc0hjelVWV04vNVI2aU9y?=
 =?utf-8?B?cFMwam01QzNoVVFmeFVXdEFHck5oZ2htZ1hZRTJWK1kzT3FzVTdZcTI5YWJQ?=
 =?utf-8?B?ZUtPaUNhdzV1VXVpTDFJVVh3SC9jMU9KakZKM2I1THE0RWRTVWxuWFZ3M0xZ?=
 =?utf-8?B?NUtZd09xWDFKelpZMlFHakVJbjV3TG5aV1d0aVBNLzIxRTNhOEF6UEV6WHJL?=
 =?utf-8?B?RjBRZEo5UGwzL0VUMlI1UmFKNldMNjJkRFROZUVkczIwNEI1NFRTQTZjT0tR?=
 =?utf-8?B?VG10cWZFWVZIWDJYVEdDTEJUdndkOUpXTUx6V0cxbk5rUFZVNVFVRkZTVkgr?=
 =?utf-8?B?UzlxU1FjR1kxZEx5M2YvYkI2WDBRZ2YxWEgzSStlaS92NGxRQ3pDMXBjL2Qr?=
 =?utf-8?B?ejRsVS9ZSyt1WWE2TkRJK2tDaWx6cTFCa1VjM1U4bzRjQkc0RUFwZU5Lam9V?=
 =?utf-8?B?OFBLLzV3UXdhNENhS0RXeXlmVkpWcGlKY1VLK2ZWZDhaUElORFY2Tno3VkZY?=
 =?utf-8?B?UHpUZUFmUHp4c2hzMGczK09VdzhHaDZvRU9jUzF5eTk1dy9MdG5acS9LV1Zi?=
 =?utf-8?B?bzZiL2NCOWFHSGdQUUdIbDlUTFRjMm9YME10eVJlL1JuRzRwRmdrdFJoTHRF?=
 =?utf-8?B?TElpNjNxUW9TRDJERVdna1E3SDNsQzVmVFFGVEk4MURZd0J6UGN6K05HaEw0?=
 =?utf-8?B?VVkyOUNYaDhBZkdZM2pNQmRBVVdEY1R4dFJoZVhteHgvS0c5SGlnQkwzMEJZ?=
 =?utf-8?B?RGVRS0ZqSnZvaW1pMC9rb0o4a0hubWMxbTkvRCtxekdOakkxcXRFdVRBdnh2?=
 =?utf-8?B?dEp3YkFsd2RtY3Q1UExpUEJSR1oyamZkNXBiMWxQeXZhZTZTOTd3NVEvZWd4?=
 =?utf-8?Q?HNInu1RMDs/4SyHs=3D?=
X-Exchange-RoutingPolicyChecked: l8YX6/O8HBoqzbnjoh3LQCi/dRkn+VC7scQn28bRmjs2+qfhOcBpiE7RLsuSR4Emnt3MmMwJplneZGhUzcaJxHZ+/Ac6wLGorTIy1WTSO0PA1QTAAu/rtj6su1Bd60rbvgtC0z9E504Sn4Zese8Q3JQ4HZwgvcP/zLDabYNfVvPUN3GwU7pYRlefp2Mu1GRC29uhqRsFlCXviE+3qFb3JPknBRvznSHwSUuBep48GDfvwcIZSVOt6sPwGAymp74LP3Sx/HaEZaJ4ArgYBiI2k+wmAznELfRf8lVCDdaQaEtLFoM2eUUJ8IxjkWrW2mNEgyq8udvIT3uzMpVPJzr/uw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1580e29-5159-4482-9d22-08defe9492cc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:25:20.6105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faiLAJWNk+hi/U2oA7QEsn099wuFgUVgTA1V9fUAef04qOpcn2g6di0wtlzfPWLa4uZ9JRfQmnzx/O+v8ga5Y0YVzkstj/h2B7KwH+0wXUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCA4893B55
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

Hi Krzsztof,

On Wed Aug 19, 2026 at 5:21 PM CEST, Krzysztof Niemiec wrote:
> Add coverage for the case where the batch start offset is invalid with
> multiple BOs submitted, which was buggy in the kernel until 4fe2bd195435
> ("drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffe=
r")
>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

