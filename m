Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CB4CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 13:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30B410EB05;
	Fri, 22 Aug 2025 13:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwH2/PFi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDA110EB05
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755867654; x=1787403654;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e18IQHIS1aypybGkIOOgKvxhbMc+mg471ygdLH+FDKg=;
 b=XwH2/PFiFCV0pfdWNYwm+r2qBU1ojQJSbFvQWE+ijYAYXmVraPaNSSfL
 mWXq6qdxnPQQ0ApwPtaOqaUYy8PEeoptNbjN2dnaYvEU8fe0mxyMVhVRH
 LT4QBaYSzT/7LzjxmD6vt85KQggW1Gilxbo5Z2kct/Jrv3s5u8beVARZF
 aGdE1H41vrLjVV5ugg6Y/9pnQTmGK9HnFnac0z0xlXfZ4w4eFGvsLQFmu
 c79XlmsjF26crb+4S6hh2kGUegtqwVvaifz8OWkPS6TFX6YCsqkQtG6w5
 OZ96o9SGha4PAhNQjJTZnxPYUpl6fT0SNS1PXjc8bdbhJOAePNHvdTFhZ w==;
X-CSE-ConnectionGUID: 1QNY7M2+T5K8b2h2N3rFNQ==
X-CSE-MsgGUID: +Pz24QIZTru1EdJ5PWv5hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68876541"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68876541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:00:54 -0700
X-CSE-ConnectionGUID: 9DRGgdmZQj6devrBz/SjDg==
X-CSE-MsgGUID: H3F72dznRUiWYS55MYLTyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="174022927"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:00:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 06:00:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 06:00:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 06:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEfDaJ1bIDx2Uh7CJ69HcFmVMPKSS0HRNRDKtleCQZvJDsgmv5jsUcZ2aTksG81STA7ia/ryRQX/MKAUEroeUhA45tak94iNpFwuzqH59VzhdaX/BmDtveBz5KV5ygbGcPrqTaD42DFa49iACd0DH/YVEQllct3ojwkmVYkezmbnxQCGZUkmVubcn0N5ZJv9PizfyUGQJ2DONaLWzltXl/wVxhfHBayKiInsXiwPbc7M5SEdJAmWY4h82/i0GS2B6QJ0S/d4OxMGhHlWtEbt3fS3bLHAc1U4YDAllnuYnnDZZg2FGxTUxH2UW3TBZK52Wlrttu5+Y4SNRwDIUKAmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKRlPXsIUCtq/gZRQD84Tzil/tS5BnJGbaG6QY5UHoE=;
 b=YUgXH9Xkcr+Wsl0Wlyk4bB67LjgEaqvn8HDKjmbcLnh/UebcqLq/443F3U51cEKuKz47rNnubwCO3uGSdl32Sp2YYh5bN0qYlwQkiPiAygSPc9y1LDvvSpkdGCAW/+O5Imx2LX68m0lQdAGOzUky8ZAjzmHujtNseB4wlfAy6HPftu0diZCgFQCtEstA9REr8Qvdf6OpQ8oFFZ1vGD9SPYN9XFOfWZvD4XZ/PoTCQsPTw8KDdE0LmBZeeq4fvI6HvQ5DVf82FkkNNIBeWkgafT7ln2PaI4hkrpNrZgUddtOo5/ox7BZx2p8FCHjhoiF2R83CvU+G71S8at0c7ifjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL3PR11MB6507.namprd11.prod.outlook.com (2603:10b6:208:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 13:00:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 13:00:49 +0000
Message-ID: <b40b8073-a0b4-4cf0-9dd7-ac588ec41191@intel.com>
Date: Fri, 22 Aug 2025 15:00:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_flr: Handle missing
 provisioning data per-GT
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Bernatowicz,
 Marcin" <marcin.bernatowicz@linux.intel.com>, <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250822093908.414306-1-marcin.bernatowicz@linux.intel.com>
 <82bd517f-f746-4c9a-b6f9-e828d9e16a58@intel.com>
 <1f44e5d1-860f-434b-a212-1e3e6d1f95f8@linux.intel.com>
 <c08912d8-b0a7-4e3d-a616-60f88d0f4d97@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <c08912d8-b0a7-4e3d-a616-60f88d0f4d97@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0152.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::36) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL3PR11MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa13877-fe45-4ffc-3470-08dde17bead6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUkxQ0JoVkUzQ3NvMG50dFZhVXNGcG1Xa1pMRUx2S3BSaDl0dlN6N1Bka2Vx?=
 =?utf-8?B?Q3lpNG52TkxqcVJHczZFcjFSSzhtMC9WRVliTDh5bGdOcU52U1U1NVNZVkVZ?=
 =?utf-8?B?a0ZzUktpWStwL24xOElTdG9CWnA0RVFnM0o2NCtMckV3T05ZWTlRM1hCRXhm?=
 =?utf-8?B?bGhNbm51U0lDRlhOVVlaWkZ6R3I4Z1BZMjBQdzEvSmNMM2NIOFRYZEU3Qjl4?=
 =?utf-8?B?ZjE5M0lwYWg1Ym9zbXNrNEN0UzFRUmlVV3E0SjJjVEg3aERwOGdmbVYweHEx?=
 =?utf-8?B?SmFZa1N6NFB0bFkzNzB3Sy9nRXBmM2xSTkJ6MFNvYWVNbFFkVS9qSXpJZzE2?=
 =?utf-8?B?TDIzSnY5NmVCQzNaZktLK0ZWcUd6Qmt6TVBZN3p6TmlFZUF4V0tQOUcxVHJq?=
 =?utf-8?B?TlNqcURnMDhON0Z5Yk9rR01UbVhHWllkcng0M0dxakR2UkRqUXRaK1JNNHVk?=
 =?utf-8?B?RGoxTVhTekFvT1pVVUViWGxBK3RIS2lqTnE1c3RFU3A4cHZ5MkdYNmJiOWFJ?=
 =?utf-8?B?NE5BemtkNlV0U0diL3oraUpGKzUvbk5uakkxclVYYkdGVmVmYWhnOEVKUGNW?=
 =?utf-8?B?UDVPV09EZ0xpNm5Vc205eU9NRHAweU5Hak94WUJYWnhSKzhYNE1hK1BxcmlO?=
 =?utf-8?B?aWdpQVgxbHFsNWc5NUFLZVNJTTFMSGlocTYwYWkwanNDVXp5Zi8vdllNM1My?=
 =?utf-8?B?OStKMldxaEJ4ZThmd1ozaFZRQkxqNUp6Q2V4QVlnS3RuaDdROHl0RVJDUjVo?=
 =?utf-8?B?eTU3RmVkUFB4bjdKYWp6U2dCTmtBL2ozN2U1K2FPaWczZVJYZmlnelExZHlp?=
 =?utf-8?B?Q3ZLMk5tNEJScytDNGI3YWFFa0xBMmdyU0ljMDdNU3dmVU9pWFNmRXU1VUVp?=
 =?utf-8?B?Y1J6R0o4RW8zRTZubDNFd2VuYkkwWXVTTWozV3hBa0JDdWwxdVVwQUp2REJT?=
 =?utf-8?B?Y3A5YTNKa0tESTFEeWVmdHZEbXJ4ZjdmQ2VKcWRWVkZ4T1VEdnBjbHRxTjAx?=
 =?utf-8?B?UWUrSEJTVzVmNytHeXJxM1kxVnc4NnM0VHNKeitBMEM2d214QnBOcDZZbXox?=
 =?utf-8?B?Zlkycnloa3B1S1IxM2xOaCtHdmNqdFlKL0hvcnRzd0JWK3N1Y0h6Q3hvVGtP?=
 =?utf-8?B?ck5BK2VJTDA4eGllbXV6VEtFSVV0N3FmOTMvMTZJN2liVVk4M1NOSDIxdENY?=
 =?utf-8?B?bGRPZVFQUDZGd3lRSnQxMWNPVG5OY2pwckV2U0NwUGt0N3RNa2VpTC8xL3FS?=
 =?utf-8?B?dFpSQy8rcXdXbWVqbmorRDRsMmRSb3pFL3Zvck0vanBGN2lOYnhDcjNkUmNG?=
 =?utf-8?B?bFpKT1pHRExORG12cWljbC9NWjVBdm9RdEZ4RFQrV1EwMVljanlTS2JMSGVx?=
 =?utf-8?B?K1g3cG1ad29NYWJLUVFRaTVuNWFTc0NpNXFyR3V0V0N5UDZWbElmV1ZBa1Jl?=
 =?utf-8?B?UFlKbFNsUGlPbXVWZVdsVTdBT0dQdnBLYk9BcDVENHgwUXJvSVVTZDJNaWRy?=
 =?utf-8?B?Y3ZwaUZLVjZROGJOWnFCSnFYZldlNjg4bUNvbnAySklRdVJMSUVVckFKeGtr?=
 =?utf-8?B?ZzVOb3MraHhPTEM2Zjc0dENhR0dIN3pLbVRVcDdiSkgyNnBSOExDOUhpME4r?=
 =?utf-8?B?ZFVqNExydEJNR2VuYWpnazhvZjlmVjlVRWFYL29qblV5KzVDNUlxUmk4QkxB?=
 =?utf-8?B?c1p3aXdkaklFNDVoblcrZkRpT0I4dnZYdXh6eEJVUVU2Qko4ZGlwN1ZldytW?=
 =?utf-8?B?ejN3c0Y2Q0ErdmpjNGM3bS9YaXg4R25DbXgzWmhDZ0ptOXJjRDhNQ3FIVWEw?=
 =?utf-8?B?b3JIdjVRY3NXUnZqZE5pMFp4RXRsYSsyRmpVQUk5S2pNbkkvMEQ4cEVkekVC?=
 =?utf-8?B?SFhOZDFnWTlWT1V3N2lHNHNMRHlzM0EzZzhNbHo0QmlHTS9QVzRUZ2JsZHJh?=
 =?utf-8?Q?4laf2MGx/UY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVJiYVp3UGdGRFEyTFV1NXVjdVowdGpwU2swU2JHUG9YUTlqMTlDWGYzUGox?=
 =?utf-8?B?RGFxbllMdUtFWHVMZVJBNzdIRHRCOVVmczFYUkM4WkhPS25oVklaaGFpOUJn?=
 =?utf-8?B?MlU0TWZTLzg0YUxIbjBlWnRFT3g0dWcrTWdWSTBCaXBETGh5d3IwekJ4U3M1?=
 =?utf-8?B?MEZwbWxCQmJIL2VhdWsvb3U2VXZic2tGVEhjOXpJdllZYUlvU01tckJWL2VB?=
 =?utf-8?B?V2R0YStZSGtDdndPQk9HQzRjNXJUUnpRa1lCNjJyd3R5eHhLbWsycldFT0Rm?=
 =?utf-8?B?a0RDSmRtb2VSeUh6N3BhSXg5Mm1wQ3orZG9LR2Ird1ZLU3RpM0RRWGQxeWFj?=
 =?utf-8?B?SVhTbFdwVE9LQWdxSDI4NXZsU1VUVXVGVTJwWW5wbUlJVENqakNPR05CN3ZZ?=
 =?utf-8?B?Z1M0N2lJc3FBYjhMUW14aGd3MmhZemROQThDQkVZMHBxVUI3TEVvTDhuN3FW?=
 =?utf-8?B?cXlvNWduY3Z5ck91ZVBwRnRyZTY0Q3lHQTVldHBpclJvWXZmajE2elRCd0Rr?=
 =?utf-8?B?ZW83M3pSemhiNm5jR254VEp2WUhHenVZZWJxcnpzQVlqcFFqTFF3U2dzVHl1?=
 =?utf-8?B?bURrUXA5YmhiVXhvd1g4NGIraU9mRGNPRFBMQzBqUVQ4c1hYWncyZmVicXJU?=
 =?utf-8?B?M2Z4cEVuYlVJZXFFem50TXVJZUlBbmdRckI4WlFpQUlFc3dzMVBJUkFiYUpN?=
 =?utf-8?B?bW4xSTJCYmFKYnAxTTc2NzBCODIxME0rY0t4c1BSdEFTSDlqS1IreGJLUENS?=
 =?utf-8?B?THI2SlFKUmdHcGtQY3pGOEN6eE9LdnpiTzMyTml2alRzVkdzcmVTK1BZNVNT?=
 =?utf-8?B?anQwZVNVSFFsSUdvWm9LZkZLcnZkcDYwQkh5VXF1U0JQRUw1NGVTd2s4WXZF?=
 =?utf-8?B?MnlVWTFsT1V1VW42dGx6MjBIR1BrZ1ZqbVd5RjA3bUI1Z3Vkb2p6YnBoeTNT?=
 =?utf-8?B?UERIak1tb29WR2JETTRtckJvNzcyTjd5M1A0OEhVV3RtaTVNR1lQTlB4Qk02?=
 =?utf-8?B?cW4xaklGMWlTRFNORjlzNjFzTUZYN3A3eG9STDRSNUpGdzVqUUFMRllDc0sv?=
 =?utf-8?B?ZjJvVThxWGZhSnVUemcvUVViSVJxL3N6L0FOeVlsSHhmejBjTUZYTml2c1N0?=
 =?utf-8?B?eVVkdmxqM2IyaXZNZnEwRkoxUkRuSWF5ODZ2MmozbldSS3lSLzVab2plNHor?=
 =?utf-8?B?MUFxTDZBTjVjb0tGTkFuTTF1S012ZnVNZ3lsUHNFN1ZLRUtOQWJIZ3Y3cmRM?=
 =?utf-8?B?cnFleVl6ZFV6emo0NmZYZTFpV3JBeXNMaE1sMTdqdUp4MTNMK3BFWUJ6MExP?=
 =?utf-8?B?ckZraU5vYm9qb0pvSyt5azJ5c3lRZ1RZcXpNSUJiTWdEakcyS21jYXgwb0JN?=
 =?utf-8?B?bTJqTkJpeFdQcGFLTHh1TnBsWFZRSEM1cnVzbGtGcXIrUHJEQUJtdHdTc1ds?=
 =?utf-8?B?N2VzdmZ1OU5kUVZYeHA4WUhyZHFuRDFVZDhwZjIxL2FsVDYvV0xNUTNpdGJl?=
 =?utf-8?B?a3RmeFRVRlROQkZ0VHE4b3V6bHhXVk50aXB2YXh1Ui9Kc0dib2Z4QjZGdUI3?=
 =?utf-8?B?WHo4WVlXcXd2SjBURDVnRmNXZ05ISFhqZGxJNkdGRzZKRjF1YW80UjZvRnRn?=
 =?utf-8?B?VU04Q0Y4bmVUbG5uQ0J2dUp5dWNNUlQzQ1UrUENBWUh1Ujk4Q2U1dm1oK3hh?=
 =?utf-8?B?dFN1NVg3am9PM3pJNnFxazFHd0RpSkZMMWNram5nR28yeHVjelVUWUVNMGsy?=
 =?utf-8?B?MTJ3K2YvU2RNU0tUMVlCcHJGUFVuaTVGdjZPUHFleHowdmRodmsveEVQeGFU?=
 =?utf-8?B?SXhINm5yQkpWampjVjdKa2p0S1JEM09pd0VJcU9BWmVXSmlNSkVkc3dnc1Fp?=
 =?utf-8?B?K3hHblovSVd0bUNIWU9JSWdJdVdNRVZteXp4ME1TOHNYd2EyNVZHU2pPVHdp?=
 =?utf-8?B?ZTkxNlZMNVRYS2YzR3BoR21OWmwwdVJqWmdOVUZMb3hEbjZ6dUh4eWsyMVlj?=
 =?utf-8?B?VExLUTJLQ1gyaVY3RkZrK0Z1VE1IeVkrTU4vdTZTSXdCbmdvRkZObkNIeisw?=
 =?utf-8?B?Y3ZnZUgvTi9qR0l1T1ZHTDcyYVB6ak9aNzN4dnd3cnZNVlBQQXZNRHphZHpo?=
 =?utf-8?B?T1Y3U3VHbVk4MHJ5U2Q2bjZEUHZkejBPRENOSTl1b01heE9SN0Y5dXE0bHpj?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa13877-fe45-4ffc-3470-08dde17bead6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 13:00:49.5381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z42bWbbBZ7IKbELwV1bjiBmpWHC6EQHpTzCU3pDYz9K3p6Q/qnG/VwZU/PBcVQ/cbVjlpFzLvw03xKs5Tec7U2NLT6+T53y0hoz+gQwqvm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6507
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



On 8/22/2025 2:48 PM, K V P, Satyanarayana wrote:
> 
> 
> On 22-08-2025 15:51, Bernatowicz, Marcin wrote:
>>
>>
>> On 8/22/2025 11:47 AM, K V P, Satyanarayana wrote:
>>>
>>>
>>> On 22-08-2025 15:09, Marcin Bernatowicz wrote:
>>>> When reading provisioned LMEM ranges from debugfs, some GTs may not
>>>> expose provisioning data at all. Previously, this caused the test to
>>>> skip entirely with a "Failed read" reason.
>>>>
>>>> Relax the check to treat -ENOENT as a valid case and simply continue
>>>> to the next GT. This ensures the test is not skipped unnecessarily
>>>> when provisioning data is absent on some GTs.
>>>>
>>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>>>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>> ---
>>>>   tests/intel/xe_sriov_flr.c | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
>>>> index fc08703c0..9eebe5f71 100644
>>>> --- a/tests/intel/xe_sriov_flr.c
>>>> +++ b/tests/intel/xe_sriov_flr.c
>>>> @@ -816,7 +816,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
>>>>           ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
>>>>                                     XE_SRIOV_SHARED_RES_LMEM,
>>>>                                     gt, &ranges, &nr_ranges);
>>> Is it applicable only for LMEM? What about other provisioning parameters?> 
>>
>> GGTT is already handled.
>>
>> -        if (ret) {
>>>> +        if (ret == -ENOENT) {
>>>> +            continue;
>>> Can we add a debug level print here with GT id?> 
>>
>> Something like: "No lmem_provisioned attribute on gt%u" ?
>>
> Yes. With adding this debug print,

IMO we shouldn't even try to read LMEM provisioning from media GTs,
as today it is exposed on primary GT (gt0) only, and this is just due
to some early xe debugfs limitations, as there was no tile concept there,
but since it was added recently, in the (near) future we might want to expose
LMEM directly under Tile only (tile0), but definitely never under media GT

and without that call, there will be no need to handle expected error nor
print a little misleading debug message (as it's not about missing attribute)

> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> 
>>
>>
>> +        } else if (ret) {
>>>>               set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
>>>> xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
>>>>                       gt, ret);
>>>
>>
> 

