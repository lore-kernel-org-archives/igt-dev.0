Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419A3F419A0
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 12:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78C810E0C9;
	Wed, 15 Apr 2026 12:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TruKUKBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE7D10E0C9
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776257498; x=1807793498;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=t/Yi+WOdBEgWtAYc/x0eURYAr4bwMx/Fy9TZ1p+NUFs=;
 b=TruKUKBA65zTKF/rnTYW9sAw1yB5a8S3lRvEgVx6+S8NYPVfQlYZo6n1
 VFNgs6f3AG5OYdjyiaQghv7o7nCJnDlJo6d2OB76iW8g3ohHptFXEDcMd
 69ERE4u8wIFi5unwIF6OZuWtcucoEI2dGX0+4RVdmWEOdgVdjMvxGuJxT
 UOrqkshxKl0QmBKGamol6iWZDO5DKQt88jx6+JQqb9rRHRgjGvBLVyrN9
 xhO+SYJ5+WIiIZ1vNKVZzwbNI+C1xYic1cRBEJOXmhFBFxMZYQ+n48ECC
 5Tv5+S0QHrfx2hFukvA++BNNQkWx5K8cRWyZFIMjn2Y6gj3rwYwJcvvda A==;
X-CSE-ConnectionGUID: gyUrPXQ0S9WX2WNmJv1XEQ==
X-CSE-MsgGUID: Pn2/7RErSuKqLXLeE602GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102691388"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102691388"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 05:51:38 -0700
X-CSE-ConnectionGUID: XivufmiETC2d7biGZqEx2A==
X-CSE-MsgGUID: C2bfBFgPTTm7S/DTuzjazg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230656704"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 05:51:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 05:51:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 05:51:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 05:51:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrErnh5aDbjcxO5DMqhbyN6Tgw/A4I0DkK1FzphnssGNpr6LfjtwtxdqoglEfvULh+ikKPJ0eIjsF6EUDmbXwpgVoYO4zGcvj6XQ8XtuXIvP73efRdawHGsgHqxr1k4tyJzXeAHXid5PiI3JZAEhMby3uf8bZOIDrFLyKMgJ7iCN4MDgb96O3mN0nJHlLcxU3h5rAloZcTDs2JSHc1gaaARUSQdz/q9v1w9vv5B3jL5wCx9kOERGbeoNhSV8QpemPUdPs40uskmg1x2ROn4HnVkjeUJA1Ry2G3rY/Ma9RM5iFGCH6MnqD+BWdgUvuirCsv2QkkTM9sp9zsBfO5zIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdKpsqMJCIeLWpBhnLVK3p9iqg5zbJSj+9Geh6weIKU=;
 b=LOj5EHhwXKZ3cMVYMi1qb3LB34JWnmsLMHLDXhnurXMVLmGwXUIq/n1KFOmzkZUEUJfCGuuf4dGfewhIMAssEFh/fsca5ll4xQ7gCbgEptrqadDtKtiWz1gc7/+ieMfXtZUb29lVWIZduMJtQWckxghUDNDlG/fq/chTrsM6DfszS7/a58wizypJ0R46ZUF0RDmIE03WI++te60Zv8vuMpizUBXOhqwKwvITsNVSPvaNAfits3szBa5FQBwddZklMRPMw3PAFm/AXD8wRgQzhV8ykJa6ONoPXYmZdZwgtojkKyZ4vUc/Mn2tcTy/hhTJRz1T8+p3t38YV2q6H+Q/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 12:51:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 12:51:34 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] scripts/hooks: Example guc log copy script
 and allowlist
In-Reply-To: <4aj2f6zypdgeh464ioioadbbb7gv5wmmpxn4o33pim7zwb5wop@5io7kd4hcw4n>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-10-zbigniew.kempczynski@intel.com>
 <87h5pdwad7.fsf@intel.com>
 <4aj2f6zypdgeh464ioioadbbb7gv5wmmpxn4o33pim7zwb5wop@5io7kd4hcw4n>
Date: Wed, 15 Apr 2026 09:51:19 -0300
Message-ID: <87eckgz8s8.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 150584ff-b528-42ed-319f-08de9aedb94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 1ADt9DGdnE9Slb9MZUeeZaiKGAAkvr43oHHGdPe5GTnAzH/D1p1ZF8FU2kPoxvSo9Ry5oZdeF+JfPGRS//xlTWjUmW/Z9KfxOWwv1qSL05F8MXN+gQ0d5vyHC8LXd3Xy9dCAJ1DTKEVIy4kqwcnrB7wyg9clH/LrGzoUjtw0oArUfDQYa+CeQKrZww58WuSL4NDQorPypGJSqaeuSDLpPkjacuNfa3hInShiHXpKiq6fTLkXestvucSSPG4b0cxAxdfDpIDbKLGRLZ4w7j4JQoAEaXf22gqUVmE04JVoQh3x2TYf0L5ODYa18ZNCVLJ5XzGXcXsoQ8TNfPtQSmuCa4OasRO6fz9QT42WX8yziSp/1IrHjMjgH+iuQpMpO2eEj5GLVyvXAHhjnpLi+fsJ6rvXUP8iqQav1Aop2Z4nKK2FLr3Xxn8F2mzHOiZZ3mYghqLna+hWuA4NVCz0r0ZbHhbMud301hNV1vgxgPhAVNDRVL4ctt6M+QrVobO8HHq10n4gQkzNzOV7be9lSczF6gcs5oTzrAUbdkSC0xAJJkeh+LHv6xVDii/dqlAFKW6PbU1FXUbmP31FONBgRIR78YFGrcjO/dPvL10B3i5lgdmgAxeH9YMcSIhWfvcRT9r6BTYnONQXZTLMSII0VESTsrwMV4pA2U/c5F29IbSPX2OLoKfR3659bvde21W7y0XODEsE/lNekKswTjLKluUvl5h0jIiX8f/+rXC1bwj4S0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WisvRmpxQVlNQ0VrVlZvUElGYkpEbGJhbW42VGlnLy9KZ1krVW9yZ2F6eFNy?=
 =?utf-8?B?cnkxeHMzWk5VWEVXWHpmL1lUWTR6U3RxM2FKWFJlVWtSb2xCYWpqMjVOU0xB?=
 =?utf-8?B?QktITTJpQjNSQmI3Y1lwdjZ4YXY1U3FOWTNZSXBHOVBDRGthT2ZmR3pzNHZK?=
 =?utf-8?B?QzdMYTdTczBTRUx3SjBOOHY5N3BXdHEzL0hGZG9MZVRkMlNwb09UQXZFeUdr?=
 =?utf-8?B?RjdidzBTMzY2V2huVGM5c0hhOHB2R2VHOFZUQzcyeWQ0aW9OTkJidTBiTGRx?=
 =?utf-8?B?NG5uc1RWb25zcHg3aXRDUDg1eXZGclR1N0pteGVaQkwzbWI5VEwwOWtOeW9T?=
 =?utf-8?B?RUxzdWRselJpYnM5d1lyVUNtWHlZRzEwNEUvOGExOFBkeXFKQ0FtakpXelRK?=
 =?utf-8?B?SEVaTEwya2o3bVlLRkEvb2liMnRQeFFKSHFJdUMwZGE3c0pkMkJBN2ZvSExR?=
 =?utf-8?B?RDZhdE9nRTNJZ1BJTWxmRW4yWVJLbGtPaVhhaHk3ZlI0MXBXVUdoU1pnN3gw?=
 =?utf-8?B?UWwyK24vaDN4cThkYnptaGNYSktoTjM3QWNIeHdlOU9vZklOWDdrWkRNdHVP?=
 =?utf-8?B?bHFnblRKTkZrYXRZWFJ6M2ZsaXZWb0NrMW1ZM1RYL1R1YWZoQ0VpdTNCeGkz?=
 =?utf-8?B?VElBQXJQUC92R0N0c3lOekpnZGRBYzVjUWFJOXZJWElyalJjaWtrZStGWDB1?=
 =?utf-8?B?K1NXLzExVkZwTmZSaU5tMkRvTk1pT2NNTGVtWkw1ZFB2OHkxbHVpaW8vV3Iw?=
 =?utf-8?B?RHY0cHJxdEJkS1RIZ3BCWWVlTmZlRmVxVVdFTy9QMGtCNytWSDNrSHNyM3V1?=
 =?utf-8?B?MzFZQUxwNlE5b1RSQVhCeTQ5M09yTW9qS1dqV3NFMGE0REJsOHhza0J3QWxE?=
 =?utf-8?B?aWRYOFdWeEQxK2JvbVRIeTBQSTBKL3BNdjJ4Wm55OFQ5UmYyNy9mcHBxL2JS?=
 =?utf-8?B?TU1QQ3V1bGp3L00zQ1RXM1VRVkpqWmxYYVU5Z2RVZDBNT2NzbXdkbUNaRmhR?=
 =?utf-8?B?U0pnMWlPd3RIb1A4WmZLQmZVeHNreUpkc1BabnZhVUVuUmoyUU9JM3NDM1NE?=
 =?utf-8?B?MnhBQm4vN2RkNFFyaHhRMnJBS0d1bSswMnR3eTYwU2V5elhPQndwR0MwYzNz?=
 =?utf-8?B?Si80Rzh5eGJRQ1AvNFNlN1QraWRaclhKWlVmcGFmWkIxWU11ZW90MmU0eGkr?=
 =?utf-8?B?SUJFSFRjTmxPZTNEZjFlZSs5NS9rM1l4Zk13cy9WK2h3Wm5CMUhZUERmZ1Rp?=
 =?utf-8?B?cFZTUFRxSFZUZHlKUDJ5SHpvSXYvRVNYV1RDTU1iNitCS2lJME03STJUd25p?=
 =?utf-8?B?eE11dEU1bzVBN241d2ZFVFFlbTEwQnlxOHJMYlMyUmhTWkNKYkoyTTBRM3Zh?=
 =?utf-8?B?UXA4eWZSdTVvT1N3N2FWSjQ0ZVI0SGMxY1FtdVc5Z3d1Y2RMdWNLeVBpc3Y2?=
 =?utf-8?B?Yk5OekZ6SFFHZ2UwQnEvOGJUb3pOZ05KaGtvb09KMlVYM2JQL0FYZHBFRDJl?=
 =?utf-8?B?MUVaL3VONVpWYXZYTEpzRFRYMm1LTWg2b05YVEJvN2QyMkwzTVBnNUI2NWh3?=
 =?utf-8?B?UDJuT0o5R29YVnNkcmdJcU55SEpVOGdGYTZWSXE3K2Y4M2x4KzlaOWpUdGxZ?=
 =?utf-8?B?QmJud0J4MXNFODl6TFlJZE1rTHJtR2xKMWpUV2pHUW5FL0JhbERzMkVyc3A4?=
 =?utf-8?B?OHM2YXZVdnBHSTZXM0lPWkhwQUZlVjJOb2tZRmszaFdwcHIrNjB2Q1kwaUF5?=
 =?utf-8?B?ZFVVOTBXVzdla2RINVM4T1JZeEtNZjlBVmZWS0NtNmQxK25xTHJOall2NTc4?=
 =?utf-8?B?bUJxTFpEWERKTkVtNkEzcUtCaHRFV0Yxd0dXV2Z0WHNlSjRBMDNwcG5ndjQr?=
 =?utf-8?B?N1YvUENSUUhOaDh1U2hoSEkzMmZLajNtNFZzTmVGZUhDcjB3ZjRjWFNlQy9T?=
 =?utf-8?B?eC96ZXNBRzFtL2xib1pnR1F1eXJBa2dSUGdmcTBHNUV2K3FjVU5tdmViQm5h?=
 =?utf-8?B?dFAwcmQ1QXZHMXF1Q0NwQVQyTWw4NzNRaUFqZVo3c2tJbUJrR2xHMnROeVky?=
 =?utf-8?B?YjFoQTZnc0pTN3hIQlF5YjFROHFwc1RzUWgxNWJIZVRYek1Dc0JFRmRaYzQy?=
 =?utf-8?B?bUZHajNtNk8rNXVNMXFYK2JpajVzRFh1cHZETk1NMWgzSWJ2dHFBM2lCVnNy?=
 =?utf-8?B?d0pZLzJQQk1idmNQNkxsWUxYRkY5dVBTcWRlcFNHcGhGQXMwZTFqdkVkMFN4?=
 =?utf-8?B?cUtuRURmR3dIU2dGc1czOWJTU3U3VEkzbEtRblN3VzkrbkE2cUExVi9iWHF0?=
 =?utf-8?B?ZUttVFVwc3Awb1ZrcG1jYll6M05sOVdjN1ZIM2ZOOGhwcG9oR3NzQT09?=
X-Exchange-RoutingPolicyChecked: X6S9KIddQrNoKHoMEsT9bf9LWETo/pGXVV1RxrfqYf56Qm0kfGR76dZcFmRY88SZyRSemY3wcpH48rsZHmISa3izd3AlVLlX1wRRK/r4wUJRSrzpq2i1LQOyNp/fhpsDy4S3tvCXpDfqj8Ue7heuQ6c6qrwzrR0h0sfBnR1Uzad8FQGVp8o9pQ8ydv6Og0N7JYSCgM7UZuBX4tTIoBmYNI+gpGvQ7S44ZNeVrFW/4FAmlS05tOFEqcsooNNkiYR1v1EoD7Y7u8D+O+opTMvIk8tYMM0hNrpUz5DTu+O9Q1uWVnI+JxjBd71QNn9QtUaFaiFM6Yz1ayTx9ocBoPOC2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 150584ff-b528-42ed-319f-08de9aedb94f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 12:51:34.2113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2p93auTCSM3MPO4QJbFMXkkoEehH0ntji4nM8clzu2x/WLnrMVmrOlS1/5MIuFTaDDIqgxkwCEuON53pCqRipQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> On Tue, Apr 14, 2026 at 05:33:08PM -0300, Gustavo Sousa wrote:
>> Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:
>>=20
>> > We need to explicitly extract guc logs for failed tests so add hook
>> > script which does it after subtest/dynsubtest execution. As copying to
>> > attachments takes a lot of time do it only for failing subtests.
>> >
>> > Adding this hook script to CI will extend execution time much and
>> > using allowlist is necessary. Instead of allowlist argument in the
>> > runner (previous attempt) now script filters such list on its own and
>> > decides when to move forward and do some post-test actions. Such
>> > approach is more flexible but moves decision to script what causes
>> > it is more prone buggy.
>> >
>> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.c=
om>
>> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> > Cc: Ryszard Knop <ryszard.knop@intel.com>
>> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>> > ---
>> > v2: install hook to datadir/hooks
>> > v3: migrate allowlist from runner to script
>> > ---
>> >  scripts/hooks/guc_copy.allowlist  |  2 ++
>> >  scripts/hooks/guc_copy_on_fail.sh | 47 ++++++++++++++++++++++++++++++=
+
>> >  scripts/meson.build               |  3 ++
>> >  3 files changed, 52 insertions(+)
>> >  create mode 100644 scripts/hooks/guc_copy.allowlist
>> >  create mode 100755 scripts/hooks/guc_copy_on_fail.sh
>> >
>> > diff --git a/scripts/hooks/guc_copy.allowlist b/scripts/hooks/guc_copy=
.allowlist
>> > new file mode 100644
>> > index 0000000000..04cb3f8298
>> > --- /dev/null
>> > +++ b/scripts/hooks/guc_copy.allowlist
>>=20
>> Do we want really want the allowlist to be part distributed with IGT? I
>> think we should default it to no allowlist and then CI (or whoever is
>> using the hook) defines it if that's desired.
>
> I think we want this allowlist in igt. If there's a test which requires
> to copy guc logs due to failure developer who will analyze this can
> change allowlist without requesting that from CI folks. We already have
> blocklist management in igt source and moving this allowlist management
> to CI would split this resposibility. I would keep such management in
> one place - is igt source code good place for this - I'm not sure, but
> at the moment it's there.

Understood.  Yeah, I guess it is fine to keep CI-managed allowlist in
IGT as well, then.

Since we have CI blocklists in the tests/intel-ci folder, maybe that's
where this hook's allowlist should live as well?  Maybe in the future we
could move intel-ci to belong to the root of the project, since it would
contain more than testlists.

Now, I don't think executables generated by IGT apply the blocklists
automatically, but CI passes the blocklists as argument as part of their
workflow, right?

If that's the case, I think it would make sense for the hook to do the
same.  In other words, my suggestion is that we can have a CI-managed
allowlist file, but not use it by default -- CI would pass it when using
the hook.

>
>>=20
>> > @@ -0,0 +1,2 @@
>> > +igt@xe_compute@compute-square
>> > +igt@xe_exec_basic@once-basic@ccs0
>> > diff --git a/scripts/hooks/guc_copy_on_fail.sh b/scripts/hooks/guc_cop=
y_on_fail.sh
>> > new file mode 100755
>> > index 0000000000..595cf5205e
>> > --- /dev/null
>> > +++ b/scripts/hooks/guc_copy_on_fail.sh
>>=20
>> Maybe guc_log_on_fail.sh? I think it is more descriptive than
>> guc_copy_*, since the latter is a bit vague about what is being copied.
>
> I think copy_guc_log_on_fail.sh would describe its intent better.

Ack.

>
>>=20
>> > @@ -0,0 +1,47 @@
>> > +#!/bin/bash
>> > +
>> > +# Hook script for copying guc.log.
>> > +# Suggested usage with:
>> > +# --hook 'post-subtest:scripts/hooks/guc_copy_on_fail.sh' --hook 'pos=
t-dyn-subtest:scripts/hooks/guc_copy_on_fail.sh'
>> > +
>> > +# Copy only for failed subtests as this is time-consuming
>> > +if [ "${IGT_HOOK_RESULT}" !=3D "FAIL" ]; then
>> > +	exit 0
>> > +fi
>> > +
>> > +# Process and copy guc logs only for those specified in allowlist
>> > +ALLOWLIST=3D"guc_copy.allowlist"
>> > +scriptdir=3D$(dirname $(realpath $0))
>>=20
>> It is safer to use "$0" above.
>
> Fix me if I'm wrong but $0 won't contain absolute path if script
> was executed using relative path like "./scripts/xyz.sh"

I mean to use "$0" (rather than $0) as argument of realpath.  Actually,
I think the safest would be:

  scriptdir=3D$(dirname "$(realpath "$0")")

>
>>=20
>> > +
>> > +if [ -z "$IGT_RUNNER_ATTACHMENTS_DIR" ]; then
>> > +	echo "Missing IGT_RUNNER_ATTACHMENTS_DIR env"
>> > +	exit 0
>> > +fi
>>=20
>> Well, we could allow the hook user to define the output and default it
>> to "$IGT_RUNNER_ATTACHMENTS_DIR/guc_log" if not passed and
>> $IGT_RUNNER_ATTACHMENTS_DIR is defined.  Otherwise, we should error out
>> IMO (i.e. exit 1).
>
> Ok, in case of missing above enviroment exit with -1 makes sense.
>
>>=20
>> As an example, someone could be calling a single test binary directly
>> and want to use this hook.
>
> If standalone test wants to execute hook script which was designed to
> use within runner it should be executed with proper envs set apriori
> its execution.
>
> I would like to minimize number of envs passed to scripts from the
> runner - IGT_RUNNER_ATTACHMENTS_DIR should be single mandatory
> which would point out the script where to write. And single optional
> mentioned below - IGT_HOOK_ALLOWLIST_DIR in which script could look
> for allowlist. I didn't set it in the runner because I don't know
> the allowlist path (this will be know after installing and as DESTDIR=3D
> might be used we can't say from the runner perspective where it will
> be). Assuming script and allowlist will land in same directory (as
> currently is set in meson) finding it (dirname/realpath) is possible
> within the script regardless it was installed.
>
>>=20
>> We could do some simple argument parsing here or, to make it simpler,
>> establish that IGT_HOOKS_GUC_LOG_DEST would be such an input variable
>> (and document it in the doc comment at the start of the script).
>
> Multiplying environment is imo bad idea.
>

I think the hook should be a standalone tool that could be used for
either single tests or in the igt_runner environment.  I think we
should make it easier for both cases, meaning to have a simple way of
the hook user to define the necesary parameters (destination dir and
allowlist file) and make it define sensible defaults when it detects
it is running in a igt_runner environment.

If you prefer that the hook should be specific for the igt_runner
environment, then I guess it is fine to avoid the extra work I'm
suggesting.  We could revisit this in the future if we find users trying
to use it with standalone tests.

>>=20
>> > +
>> > +cd "$IGT_RUNNER_ATTACHMENTS_DIR"
>> > +
>> > +# Look for allowlist in following places:
>> > +# 1. Try in IGT_HOOK_ALLOWLIST_DIR if this environment exists
>> > +# 2. Try in <scriptdir>
>> > +
>> > +if [ ! -z "$IGT_HOOK_ALLOWLIST_DIR" ]; then
>> > +	ALLOWLIST_PATH=3D"${IGT_HOOK_ALLOWLIST_DIR}/${ALLOWLIST}"
>> > +else
>> > +	ALLOWLIST_PATH=3D"${scriptdir}/${ALLOWLIST}"
>> > +fi
>>=20
>> I would just receive the allowlist path from CLI args or, to make it
>> simpler, from an environment like IGT_HOOKS_GUC_LOG_ALLOWLIST; and I
>> think we should default to not using any allowlist if none was passed.
>
> That's good idea - if script would receive optional arg which is
> filename it may use it. I'll add this to copy guc log script.
>
>>=20
>> > +
>> > +if [ ! -e "${ALLOWLIST_PATH}" ]; then
>> > +	exit 0
>> > +fi
>> > +
>> > +STNAME=3D"${IGT_HOOK_TEST_FULLNAME}"
>> > +echo "${STNAME}" | grep -q -f "${ALLOWLIST_PATH}"
>> > +if [ $? -ne 0 ]; then
>> > +	exit 0
>> > +fi
>>=20
>> This can simplified with:
>>=20
>>      if ! echo "$IGT_HOOK_TEST_FULLNAME" | grep -q -f "$ALLOWLIST_PATH";=
 then
>>         exit 0;
>>      fi
>>=20
>> > +
>> > +for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
>>=20
>> Suggestion: use $(cd /sys/kernel/debug/dri && find -name guc_log)...
>>=20
>> > +	attout=3D$(echo ${log:23} | sed -e 's/\//_/g')
>>=20
>> ...and then here we don't need this line...
>>=20
>> > +	mkdir -p "${STNAME}"
>> > +	cp "$log" "${STNAME}/${attout}"
>>=20
>> ...and here we can simply do: cp "$log" "$STNAME/${log////_}".
>
> Will apply above in v4.
>
>>=20
>> One issue with the find command above is that we could potentially
>> collect GuC log for other device (not the one under test).  I know that
>> IGT supports selecting a device via the environment variable
>> IGT_DEVICE.  I wonder if we should make it set an environment for the
>> device under test; we could use a different variable name to avoid
>> issues with the existing one.
>
> Good point. Question is - how to pass more than one PCIID in multigpu
> scenarios? For single card it is simple, we can set IGT_HOOK_LAST_PCIID=
=3D
> for each opened device. I'll take a look to this and share my thoughts.

Ah, interesting.  I wasn't aware of this possibility; so we do have
tests that work on multiple devices?

Yeah, maybe a variable that uses some sort of separator.  I guess this
needs a separate discussion and we can keep the hook looking for
guc_log files for any available device for now?  We could add a comment
noting this behavior.

--
Gustavo Sousa

>
> Thanks for the review.
> --
> Zbigniew
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> > +done
>> > diff --git a/scripts/meson.build b/scripts/meson.build
>> > index 6e64065c5e..2ce961898d 100644
>> > --- a/scripts/meson.build
>> > +++ b/scripts/meson.build
>> > @@ -15,3 +15,6 @@ endif
>> >  igt_doc_script =3D find_program('igt_doc.py', required : build_testpl=
an)
>> >  gen_rst_index =3D find_program('gen_rst_index', required : build_sphi=
nx)
>> >  generate_iga64_codes =3D find_program('generate_iga64_codes')
>> > +
>> > +install_data('hooks/guc_copy_on_fail.sh', install_dir : datadir / 'ho=
oks')
>> > +install_data('hooks/guc_copy.allowlist', install_dir : datadir / 'hoo=
ks')
>> > --=20
>> > 2.43.0
