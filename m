Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BA1F419B9
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 13:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C4F10E6F2;
	Wed, 15 Apr 2026 13:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JC/L3BPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D962510E6E0
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776260928; x=1807796928;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=/IhLgel5yq6HEwo6CNTKJbMsxM69OHu1m4M5WwzvIH4=;
 b=JC/L3BPyG2+cURfjRX7nhbfxKIW03B/7OnUx92XYKMIospDpHzmZF28X
 pbXu4qY5fYlLwSGD0GE3El4IcdK1xh8/kPw5dF70MQBtgkZxvu59aOjMq
 i8nSrJhN9U6xnyqOr++aILeLJANexSbWHksOnm36xZP0MFTXFETmjdiCh
 RS3zqKKFzHxNa+8EWrHsnazjW5q7i2yTdfAkqkdoNyyx/pxlsDaIAwLDk
 PZLtuGig7q4/N5Uwu0J8qd873S6Z7IYdBnESf7wczYiIs8QbgGFyezIwp
 +NMdNHtbb2PcnrpCb9hKrG2vUdeu73FT3jUIuO9yjNB89H2qne/+fwbvv A==;
X-CSE-ConnectionGUID: rJe3ZNnASKmJP9dhTcBAMQ==
X-CSE-MsgGUID: hfjAGtTESxWsogcHzvDOHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77112547"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77112547"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 06:48:47 -0700
X-CSE-ConnectionGUID: ghzvINKgSuCY742B8nRFnQ==
X-CSE-MsgGUID: q+hX4DzoS0KM66hWSOpbYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="232169772"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 06:48:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 06:48:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 06:48:46 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 06:48:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQ/jVG3fyVsLPCH51LxUBstbDEEc8S+luKkDFh26fIA82rGuW7h59ixamGoJp/xq3oqofPaZb10Loub9KrxsT8m0hpEiV5h3z8B8BHc6aLNZzZlaZGu7F5Bzz6xMoEZWv29deSxCTbhLnq3H3zrbGlWZwHTNRMp9oRQe6+pTghhz1gKd+WTEyFoWACaYJENWF2ADsBa5OUIGMNT0G7j+R1Sp8i7zaDFXmbvIMNuCX8wxMW1dw1UYm2EnXUJR7vtrIOZJ8/673ihIFGPYI3cKnTSeJ33XQC3BFRACYRN5Pls+JJvTcLWAPBJyLAPujazSoRPS37WAMiOCnczBgpXk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGITmdJTP5SzHD/1mW5T1OqyKtnDXQYdyTcR1TX0L+c=;
 b=aLITywxoiAc6yd1JTEWwEip9VcKB7fvrlmgD0UAHxa9eJiRL06xy+RF0xh2t+ZJgnqDyT2HR5cekXkhJl5lbKRX59fIPqyhKmZEDOXwifQWGTnm3L0CR368nmjjiAh4PMBfaFOuX23Jlnv1WDxd8nv5ON+ee98T+rSUK4CywOZy3J0AQkyxYvZsYonMd81BH5WYw4PSwCK+Bc/JKnE06vigr/AzZGsiSsM9G6kNtZ65Vezs8+ovjNf+AZE/61Yv0f9lMoZt2bJXm+PfIhRq/7IvqtwThkGLaMFJeX4m0KE+oHN6s5oZRNpp70R/snXJWVg3h33qQ/CKwMhlhkT5Kog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN2PR11MB4582.namprd11.prod.outlook.com (2603:10b6:208:265::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 13:48:42 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 13:48:40 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 2/5] runner: Create attachments directory to
 use by hooks
In-Reply-To: <k5tyhor5k6z4fr6z3l7kgruc4dwefgbuqu7vpisczqxgc7nhpy@5pvm2oxodcsy>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-9-zbigniew.kempczynski@intel.com>
 <87jyu9wde3.fsf@intel.com>
 <k5tyhor5k6z4fr6z3l7kgruc4dwefgbuqu7vpisczqxgc7nhpy@5pvm2oxodcsy>
Date: Wed, 15 Apr 2026 10:48:36 -0300
Message-ID: <87bjfkz64r.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:a03:80::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN2PR11MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: af805047-bbd5-4513-4e7d-08de9af5b36b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 7P2wnKwHG131TvHhH/ioCxKnpWNofabRzP49ZeSpzgZNcBVMC+hUMD0vpyofq7BPs8OUuGN8HUNpOiu9aiyTmmdt+5xRD6DJxUE4vk5BXny3cQfKdz0vOGsfmm3fzL3uvvcGe4w2+JveB9eDT4i9GJTAg4Nib7NrAX21koWlhmh7cELLMTZyrNTomrNnb7+jjWY45VpSigLkZK0f5tp9AtLDIgxqvCaZ/GjTooPs9f9mIBa/evc9S62udCAhJD0BOCaEw4pQUI5bEYf0QJXrohKIt80W3HHdcnL8ZWleB62tRWtcfks3gkLmqZn3lZpvnoeYKUFsuyqGgNX+whM6rFf2O6PGe/fnO9oKpKtcNrdDVQBKEoZ+NMqc9nh+yxvV3lpgE5TkGwNe2X9ESAeAhby163CaDQRiNjIn5NCwXUODsLdRcsoWP2klKWG4t5LM2GZ+hzhN7ENYa3umPgPoYh5ROG/dfL2BCqxKPyImS9O1/PtO3rf0XNILNJmyGij95dTSoDqV6o9Fc8bzaobeViNUoK93UrLwwGK3oaWGduFc1RZtH324S7QxORCiCN1rWJbjuCBoQ8cLKdg9fEnWAH6Do5YW5ICKR7IuuYp/0k09DquG4yGtNptvC3wapg/qsdZhX9S6hJDywlTvRL38ONNgUpzeAqvjq+ENNsY0Pz3lP3O/65WaM03ipRxxInhD3Kt0TkFIEzyw6fkXI5enQRdwYR4ao+ypCDp+VyiryQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bURhS1h3SUVqNlRvMzFFblMvSG5qMzlXQ0UrakxqekxxVEJPOENlSjU5dVBw?=
 =?utf-8?B?VlhLMENTQWxySjdJNkpQbE94WWlqb2pZZFk2bGk1aUlCbjFvVTIyNGdmN1M3?=
 =?utf-8?B?S3EwYlliZUZhNk9QQzMyS3piQXhpL0xuT2ZKdDlPWHQ5aU5vbktLZFlHRWND?=
 =?utf-8?B?bnVMRW1TUlZuRlphdjhjWFI0YUluQU9mZDZ4KzIvWXNjdlhRUFRQYzJsVFFN?=
 =?utf-8?B?YmJyT0NTenFVTm9JcUkyK3ltTjlkeWVzdFF3K3k3b1hPQTlxRmlyRHR1UE5v?=
 =?utf-8?B?d3UxUWMrMWxVV0JaVEpubUlTOUVUdzgvYTl0Vi8yYlZBL0FlbTJhSGhjcy9B?=
 =?utf-8?B?aGhjdTc1WjQ1QzgyOTk1MGlINUJyY042cTIwQ1JsTTREaFNaM0tYSnMxK0or?=
 =?utf-8?B?ckV6RUMxeHdNdDdCMVBCNlBwcnVmT3VBT3lGc3l0MzZCMlhHNGJMVEpzMW8y?=
 =?utf-8?B?VnF0NEQzREJMRHo0cjBlRDFLOVA5SVVlZ3FwbzYzbzl4NEYyTmQrRjh6clp5?=
 =?utf-8?B?cE95eVltYXJQODEwS3FsV1UzVkhxVXNqTFVXMmZFY0p1MlpMdzEwUjBJODJ1?=
 =?utf-8?B?c3picHh4ak9SMXk0K3JvV1NUT0dKYTYwMTdaS3FubUVBNGVsYklEYnEweDdP?=
 =?utf-8?B?K0lWWENyRmYrblI1VkJRbm9HS2dJWVRxNnpXdzQrc01lSXpKOFNCRzM4STNM?=
 =?utf-8?B?WEI4N05VbTNhc2RVQTBsSjY0bWQrdnNRSzV0eHZWYm51VnFHUHFaN1ZUZzBJ?=
 =?utf-8?B?a2JxdkpES3U2M0cvU1NTVTByeURxbDFINzlkQ2NrMUJEU2tUYTJKaFVWWlRO?=
 =?utf-8?B?Z21vZTJQZHpXbmswODdDOVR3aENUbldEWnM5T25XTGh3NW1kbjBuTzcxcjRp?=
 =?utf-8?B?YmROQlJYYkVRbCtlWFNTTkRKejZJS1Q3aHkydFhldTBFRVU0R0tCOTBBSUw2?=
 =?utf-8?B?RUxBSjBCU2JFcDNocmVGSW1tQ1Q2Z3RuV2ZpTS82QnBpZTJjUFB5T1o5cm5H?=
 =?utf-8?B?WTh6RFplS3VBeGVsT1oxYmZLU2s4ekw3OURjYUtmQ29LQ1FTckNvUnZCNFlZ?=
 =?utf-8?B?YzlZSjlYRS96c1d0Rld0UXhwWnIwTTQ5QjNjV2QyQVNMbVgyWFhpN2Fza2pV?=
 =?utf-8?B?SlZtaCtqQUZKUUI1T3FOMzl2dFQ2NjhvTVdQWHZFbHJYb0Rka0tMck93MThB?=
 =?utf-8?B?STR4NE44YzZCNUpDUkZ5Qy9zYlJKMVVnQUVvYzg1YjlLWiszdFpLSVI4VTR5?=
 =?utf-8?B?dCttSEJQRkVMODhUUDBpSmUvU2xicGJsd0Y2dURsTzE5d2hNc1BsRTJyY2pa?=
 =?utf-8?B?TUMveGY2NHBIQktZTUFtMFVNazlraG0rRms1MUhCYUMwb25OQmE2aG1nTlVR?=
 =?utf-8?B?SDZsOExNUU4xWnNXOVZkWHI4TEx2bk8xL1VpbEJhVlNZcTI2RW45eUJoMkNt?=
 =?utf-8?B?NlFCbE4vWmF5ZXRuRytzcm9TYkg1bmNWUG9uaHgxMkRTK052VzlBL2VFQ3R5?=
 =?utf-8?B?SS9ucnNWK2lRZzVLYkxQWDhEV0F4Q2NjQ3NFa21nU3J3bCtjMExvV1E4eVMw?=
 =?utf-8?B?ZVJhdWVtREwzWjFlNnRqVjc3Ri9JRVBBVXRxWUw5cmJsQUQrN2Y2YkZ4MEtQ?=
 =?utf-8?B?VE43bkVVYk8xRW9aWTZIVjRzdndUdm9yQkFCWHd1bmFFQXU4anl5NEYzOExq?=
 =?utf-8?B?L2NBYzhQNWJGazdqcVdzVlpLVm1vMWtTNmk3eUY4YmJFdjZiMEplWU5mSGUx?=
 =?utf-8?B?cVNTWkZ2Y2cwNS9saTd6bjhYMGpiRG1nZ3FNNEx6enJza2JXVnBSSm1PKzhJ?=
 =?utf-8?B?WjFodDZLSDdkazYrU3Z4VmI3Yy9YNTNORVRscXJVZXZRQ1kyTFJrWXBkZDNp?=
 =?utf-8?B?eVVDR3pnci9sOFJYcERKSWxBdnBLQzlnVWJ4cERVbnc2cjZ6RXR2K2tLeXdQ?=
 =?utf-8?B?RHM3MTBvMDlIS0I4L1VqT0NOM1IwNG5WOXpVM0JucWJUejFYVWFOaEllRCtQ?=
 =?utf-8?B?dzlwMWFQWEFQVWF2dGE3THJGMk9sUTViYWxqTUdycXNYdTFvTjAvWmo3ckQ5?=
 =?utf-8?B?aHVGSjg4YkJGM0VVeVB3Vk1EYjgwK3RJeUIxelBzcTFKc3RsQXlQRk1OaGNh?=
 =?utf-8?B?WDcySlNRNEhPczdmNWx4NkRwWFJ1M2dnRmFVNjRTZzRLN1NRQVF4aHVZM3RN?=
 =?utf-8?B?U1RrRkIxdGVocEtrVlRsNitrdk5jRFJYNlZSQUswYUNaeTRlSU91MlNjV1R2?=
 =?utf-8?B?Z1pGbmR5M3hpZlJ6SGlPRnpJcWJpRnplVlpEWTJpdnI4bkVQMWtNU2lDa3My?=
 =?utf-8?B?aU8rdjgwQ1FPVTNUTnpwcEhwMWQyNzlWcTV0bWZsenRGaDg5RG0yQT09?=
X-Exchange-RoutingPolicyChecked: Gpta0GYwu8Mc3fa3WBvA0ghC15vTQ+YoE6Sn03d2x1VEiE+DLazzFCSVTlys2IzCLbtm8lLd2PKhIUi7ODjm5G0aJSuH04RWNeAhfLYXUjQJoeC7YueNPk9/mrAJxYOrDeg/q8bejjiVfYdkpKEs9hkYPHSF107xV0R3RN8Yk1FM+hp7wuT2Wu/zfwXD5aGafk6XN/fEbkayeWlGqH1EyGSfxY5ITE/FuBTovJwXZ6RH+B1XtNi8uy2vt298WDg61qzVRY6SLoxtbsOwTIUTuck6MnjnyG/l0RAomQpmeAy/WxFVfRCnoAGiU22sw4XIxiByEq/ZQMmcfIPDUORdhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: af805047-bbd5-4513-4e7d-08de9af5b36b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:48:40.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emgxySZItIEpki0BlutyAdgdEBmycM7Nlw1NJuXv4vovb3+z4l4ujbvtoa02x4VXu+u/QaSX5iALlowOAMBObA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4582
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

> On Tue, Apr 14, 2026 at 04:27:48PM -0300, Gustavo Sousa wrote:
>> Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:
>>=20
>> > Results parsing is currently limited to few predefined files.
>> >
>> > Create "attachments" directory and export full path of created directo=
ry
>> > to be used within hooks. From now on environment variable
>> > IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
>> > to execute tests. This env contains directory where subtests/dynsubtes=
ts
>> > may write auxiliary files which finally be included in results.json.
>> >
>> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.c=
om>
>> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> > Cc: Ryszard Knop <ryszard.knop@intel.com>
>> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>> > ---
>> > v2: simplify attachment dirname concatenation (Kamil)
>> >     remove files in attachments dir when overwrite is set (Kamil)
>> > v3: unify 'attdir*' variables (Krzysztof)
>> >     do recursive removal in attachments directories (Gustavo)
>> > ---
>> >  lib/igt_hook.c    |  4 +++
>> >  runner/executor.c | 75 +++++++++++++++++++++++++++++++++++++++++++++-=
-
>> >  runner/executor.h |  2 ++
>> >  3 files changed, 78 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>> > index f86ed56f72..b8f25b6c7a 100644
>> > --- a/lib/igt_hook.c
>> > +++ b/lib/igt_hook.c
>> > @@ -518,5 +518,9 @@ available to the command:\n\
>> >  \n\
>> >  Note that %s can be passed multiple times. Each descriptor is evaluat=
ed in turn\n\
>> >  when matching events and running hook commands.\n\
>> > +\n\
>> > +When executed by the igt_runner, environment IGT_RUNNER_ATTACHMENTS_D=
IR\n\
>> > +is passed additionally to the hook script. It contains directory wher=
e\n\
>> > +script may write additional attachments like guc logs, etc.\n\
>> >  ", option_name);
>> >  }
>> > diff --git a/runner/executor.c b/runner/executor.c
>> > index 1485b59d1f..af39b12aea 100644
>> > --- a/runner/executor.c
>> > +++ b/runner/executor.c
>> > @@ -1,6 +1,7 @@
>> >  #include <ctype.h>
>> >  #include <errno.h>
>> >  #include <fcntl.h>
>> > +#include <ftw.h>
>> >  #ifdef ANDROID
>> >  #include "android/glib.h"
>> >  #else
>> > @@ -1779,17 +1780,22 @@ static int execute_next_entry(struct execute_s=
tate *state,
>> >  	int errpipe[2] =3D { -1, -1 };
>> >  	int socket[2] =3D { -1, -1 };
>> >  	int outfd, errfd, socketfd;
>> > -	char name[32];
>> > +	char name[32], attname[32];
>> > +	char attdirname[PATH_MAX];
>> >  	pid_t child;
>> >  	int result;
>> >  	size_t idx =3D state->next;
>> > =20
>> >  	snprintf(name, sizeof(name), "%zd", idx);
>> > +	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
>> >  	mkdirat(resdirfd, name, 0777);
>> > +	mkdirat(resdirfd, attname, 0777);
>> >  	if ((idirfd =3D openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CL=
OEXEC)) < 0) {
>> >  		errf("Error accessing individual test result directory\n");
>> >  		return -1;
>> >  	}
>> > +	snprintf(attdirname, sizeof(attdirname), "%s/%s",
>> > +		 settings->results_path, attname);
>> > =20
>> >  	if (!open_output_files(idirfd, outputs, true)) {
>> >  		errf("Error opening output files\n");
>> > @@ -1870,6 +1876,7 @@ static int execute_next_entry(struct execute_sta=
te *state,
>> >  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
>> >  		}
>> >  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
>> > +		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
>> > =20
>> >  		execute_test_process(outfd, errfd, socketfd, settings, entry);
>> >  		/* unreachable */
>> > @@ -1948,9 +1955,61 @@ static int remove_file(int dirfd, const char *n=
ame)
>> >  	return unlinkat(dirfd, name, 0) && errno !=3D ENOENT;
>> >  }
>> > =20
>> > +static int ftw_attachment_removal(const char *fpath, const struct sta=
t *sb,
>> > +				  int typeflag, struct FTW *ftwbuf)
>> > +{
>> > +	(void)sb;
>> > +	(void)ftwbuf;
>>=20
>> I was able to compile without warnings after dropping this.  Is there a
>> reason to keep them here?
>
> I'm trying to keep code I write clean according to warnings. We have
> '-Wno-unused-parameter' in meson.build so above lines could be dropped.
> But if someone will decide to clean the code I won't give him/her more
> work. And imo this is in good taste to annotate unused arguments.
>
>>=20
>> > +
>> > +	if (typeflag =3D=3D FTW_F) {
>> > +		if (unlink(fpath)) {
>> > +			errf("Cannot remove file %s\n", fpath);
>>=20
>> Maybe append strerror(errno) to the message here?
>
> Yes, why not.
>
>>=20
>> > +			return -1;
>> > +		}
>> > +	} else if (typeflag =3D=3D FTW_DP) {
>> > +		if (rmdir(fpath)) {
>> > +			errf("Cannot remove directory %s\n", fpath);
>>=20
>> Ditto.
>>=20
>> > +			return -1;
>> > +		}
>> > +	} else {
>> > +		errf("Cannot remove %s (unsupported file type)\n", fpath);
>> > +		return -1;
>>=20
>> I think it would be sensible to drop symbolic links as well (I think it
>> could be handled in the same brace for FTW_F.
>
> I wondered about this, but I would be strict - only files and dirs
> are allowed in the attachments directory. What for user/script would do
> symbolic links there?

Not sure, but I don't see a reason to disallow them.  We can't predict
what a user hook will do, so I would be in favor of being more flexible
when we can.

>
>>=20
>> > +	}
>>=20
>> I think this would look nicer if it was handled with a "switch"
>> statement.
>
> Agree, switch with default will look better in this case. I'll
> replace if's to switch in v4.
>
>>=20
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static bool clear_attachments_dir_recursively(int attdirfd)
>> > +{
>> > +	char attdirname[PATH_MAX];
>> > +	DIR *currdir;
>> > +	int ret;
>> > +
>> > +	currdir =3D opendir(".");
>>=20
>> Why do we need this call?
>
> nftw() requires path, not fd so I have to ensure I leave working
> directory intact when I quit the function. I don't know any method
> apart of fchdir/getcwd() to get dirname I would like to pass to
> nftw(). And I won't assume I know where's current working dir.

Ah, I overlooked the fact that currdir is used to get back to the
directory at the end of the function. My bad.

That said, I do feel like we are doing a bit too much here and passing
the path directly would make it simpler (that is, if we were to continue
to use a separate clear_attachments_dir_recursively() function, as
opposed to my suggestion below).

>
>>=20
>> > +	fchdir(attdirfd);
>> > +	getcwd(attdirname, sizeof(attdirname));
>> > +
>> > +	/* Sanity check we're in attachments directory structure */
>> > +	if (!strstr(attdirname, DIR_ATTACHMENTS)) {
>> > +		errf("Cowardly refusing removing in directory which is not "
>> > +		     "attachments directory [currdir: %s]!\n", attdirname);
>> > +		ret =3D -1;
>> > +		goto out;
>> > +	}
>>=20
>> This function is static and only called for DIR_ATTACHMENTS.  I believe
>> this check is unnecessary.
>
> Assuming no bug is here you're right, but I would like to do double check
> directory content I want to remove is really I expect to.

I think this check would make sense if things were more complex and
would make it hard to predict how this function would be called.  I
don't think that's the case here, though: this is a simple case where
there is only one call site for this function and it is for the
DIR_ATTACHMENTS.

I even think, as mentioned in an earlier reply, that this function could
be avoided completely, but I won't block on that.

>
>>=20
>> > +
>> > +	ret =3D nftw(attdirname, ftw_attachment_removal, 4, FTW_PHYS | FTW_D=
EPTH);
>> > +
>> > +out:
>> > +	fchdir(dirfd(currdir));
>> > +	closedir(currdir);
>> > +
>> > +	return ret ? false : true;
>> > +}
>> > +
>> >  static bool clear_test_result_directory(int dirfd)
>>=20
>> I think we need to have the path to the test result dir passed as
>> argument here so that we can build attdirname without having the change
>> dir + get cwd dance.
>
> I didn't want to rewrite clear_old_results() function. Current code
> uses mostly fd's and only place where I really need path is nftw().
> I will rewrite to passing paths if you insist but personally I wouldn't
> do this.

I think this scenario justifies rewriting clear_old_results() to pass
the path as well.  We are doing extra steps -- creating attdirfd and
then, inside clear_attachments_dir_recursively(), all that handling of
fds -- for no real benefit besides conforming to a "fd as argument"
standard IMO.

>
>>=20
>> >  {
>> > -	int i;
>> > +	int i, attdirfd;
>> > +	int ret =3D true;
>>=20
>> I guess we don't need this ret variable. If the removal of the
>> attachments directory fails, we can just print an error message and
>> return false.
>
> Ok.
>
>>=20
>> > =20
>> >  	for (i =3D 0; i < _F_LAST; i++) {
>> >  		if (remove_file(dirfd, filenames[i])) {
>> > @@ -1960,7 +2019,16 @@ static bool clear_test_result_directory(int dir=
fd)
>> >  		}
>> >  	}
>> > =20
>> > -	return true;
>> > +	if ((attdirfd =3D openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDO=
NLY | O_CLOEXEC)) < 0) {
>> > +		errf("Cannot open attachments directory\n");
>> > +		return false;
>> > +	}
>> > +
>> > +	ret =3D clear_attachments_dir_recursively(attdirfd);
>> > +	if (!ret)
>> > +		errf("Cannot clear attachments dir recursively\n");
>>=20
>> Why not simply call nftw() directly from here? I don't see much value in
>> having the function clear_attachments_dir_recursively().
>
> I created a separate function because I like dividing logical tasks
> to separate functions. I can unfold this function here if you think
> this will be better.

I can live with the separate function.  I just think dropping it greatly
simplifies the current code.  Your call.

--
Gustavo Sousa

>
> --
> Zbigniew
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> > +
>> > +	return ret;
>> >  }
>> > =20
>> >  static bool clear_old_results(char *path)
>> > @@ -2002,6 +2070,7 @@ static bool clear_old_results(char *path)
>> >  			close(dirfd);
>> >  			return false;
>> >  		}
>> > +
>> >  		close(resdirfd);
>> >  		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
>> >  			errf("Warning: Result directory %s contains extra files\n",
>> > diff --git a/runner/executor.h b/runner/executor.h
>> > index 3b1cabcf55..bc6ac80dc4 100644
>> > --- a/runner/executor.h
>> > +++ b/runner/executor.h
>> > @@ -25,6 +25,8 @@ enum {
>> >  	_F_LAST,
>> >  };
>> > =20
>> > +#define DIR_ATTACHMENTS "attachments"
>> > +
>> >  bool open_output_files(int dirfd, int *fds, bool write);
>> >  bool open_output_files_rdonly(int dirfd, int *fds);
>> >  void close_outputs(int *fds);
>> > --=20
>> > 2.43.0
