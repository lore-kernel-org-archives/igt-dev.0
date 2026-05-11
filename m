Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DBECD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 14:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D9810E78B;
	Mon, 11 May 2026 14:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NK83U9wo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276FF10E77F
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778509330; x=1810045330;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=1XlB4yy/Xgwwq7DDxe0tQF0zekIf7z30BMnboVLHXEg=;
 b=NK83U9woIXRNk01+Vtu6/hEyyW4HPhWavve1XM+k8/s789yH43LNBHRa
 F/bLHdm2DqpGSX/4Tcu8nEBzYud4JpRci5k/DRPNIGd0P0lcnEWePDMmc
 G16A6zvw1/yZJJXbk6WEasvb4sPvRWWsvPe6rlNaWe2N1GHTlBUkjQ6dF
 q5y9ZSN4udb5Xa8O1f++A3++TIvUO0NgIzSxzrROT0Uf2oiXRc8jfZRb2
 KkrCVVTKp8mgNU0YiEbXTCZkNtkTf/vnxcRmqHV/xYkzkXR3uadZOEINP
 pNBRGudzuV0bO+Yhc4zS1J2MKlhgP0+JaW0ZwZzgSpG9bftmGFHuW8vfv g==;
X-CSE-ConnectionGUID: TfSdaZUMQ3OvdAAbH7bA4Q==
X-CSE-MsgGUID: DFQppDNtShu6IeO4TVebxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89981024"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208,217";a="89981024"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 07:22:10 -0700
X-CSE-ConnectionGUID: LHaOolSRSuabTxtKPAvwnA==
X-CSE-MsgGUID: tywxSZzXTk64QvVV7ArEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
 d="scan'208,217";a="237417710"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 07:22:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 07:22:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 07:22:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 07:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVd0QgMggPlGsfFQLQVIqT+OhHomyTU0v5juNCezOeE+utub6pkqM85BLf0G95x5rvlTnXzRH332tE9Pi1IkpUkuynVFjwNMeWw/uPHUGTDP7an4Z6J1eC0aOUecbe/pCXoxgi4JqfBgy0kWXPpmpHCZFXO8jY69du6eb/ZtVn9dCHdgkzYMWaVK8TXZyL0iEoxsg+QB8wY+jGu+m9nK9rd4Qb2PuwMAZeC75Hx+vzJBOzLrtSYqOgDd6CLsKP2qaWJP3g8Sz5f57mbiR4QZwP+E4MmgzvdhCOTgbEEmuHl7xWTWRxWDJYnDh88+alRheb63qq/QdJ9Wo1+qRLxEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pT7z/sHo5p8WD9wLwEiXrol662zpPuQL3ENZ2TgalHQ=;
 b=lRC+1S4ekUR1r7sHmZBU0hU0xQ0xkExGHeTcxOEuWza1Vl1ab1irTZJ5Ew2LiOJYo4a97a2rk5Zv35ledbyDrsKLP9yJe/6SHAqRqbl6x8NE4p6fxJBn+CyziyfGWOGK3K650Af0zFQuN6LgFkj4EnQjT+eVlFGY+e6jBQqYWp4oJkAM4+0v1cX2eeMrQxGO3omKzxbegsvvhg8SElN0bWsYdq4wH8/0KkVjIfqdprE6ItusQv+Snn3w0I+PACDHH9P+ulDhmX77qaB6LLiJ2s37w2YckZdO2GHuDobCh92tjw5Rabo6uAx8Z7OlL3b8utsOY5bTCnKBlttKbOOwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by IA3PR11MB9352.namprd11.prod.outlook.com (2603:10b6:208:575::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Mon, 11 May
 2026 14:22:07 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 14:22:06 +0000
Content-Type: multipart/alternative;
 boundary="------------r33hE0rhdtdEes0RxZr9tbpE"
Message-ID: <5ac97f4c-67a5-4859-9869-e049dba60f71@intel.com>
Date: Mon, 11 May 2026 19:51:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/kms_plane: Restructure
 planar-pixel-format-settings test and make it Intel only
To: <igt-dev@lists.freedesktop.org>
References: <20260506184936.76492-1-juhapekka.heikkila@gmail.com>
 <20260506184936.76492-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260506184936.76492-2-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MA5P287CA0225.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::14) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|IA3PR11MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7c2f9a-046d-4bcc-8227-08deaf68ae14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799003|22082099003|56012099003|8096899003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: 7z9lbVwKeDlm128nky5ptOcJ1wQ16+dmPDqBzWs5WpnyPks/NZ+rDVMXf22kALv2wWbhkDgzl5Ki7LUsj63IhLA5SGDwTPP2R+rBH2AV0XpX1iedUYJki0Ah0KY1TX3hy2L2s3IlYrC1N3RRZpYEegpAi24T2uEI6dcqf/JQ990X/U7SRXgSR+lZA3F2fv2FdyY8Z1lk9L+6fcwNVCYYlvFwErlu6cTNEsX0/JRUn6wVtc1WZzGKZ2kUg3F6gd5pbz0UeXerZrwngW79JClTojFqE4TtRXDaQ00wpwnIB+ZjODXeMtKSJYZ0rQrJTlm0EaoETmfds/oXNgzNgTXtmOnFqMr2NWhA4hzLuuLGIoJanleKBSa5w5Y+fmWrodNAj1ARcs9wml/fVYNnMnCSI2tDuDjs6QkBUgGFMekdVhQUC5E9zsJqVVLrHZM63WmRqg0qoatwmUdXhtHLKgI6dLxFNN3iwqTSUjZjL3wg2G18XmAQQP+c0jrswLBnxv8XWeA77dBv09t4MjZ4CzR0zKb1WzNW3ltPFpahTHPMb/rc2Cxcf/BULH1aeONQ70dRMdEAoXWVfl6D9N7jruhWKvJqU/LPvCxqtygukUIviJh0NdXGA7emzB1kM/4Ish59Aw+diYu8ZNillEGgQNuzJcbEvZnWlDsR8wqrG6QvZwwzgmcSeDMB10Tfqc7CH3AE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(22082099003)(56012099003)(8096899003)(18002099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFd1R0RBZEhVRC9WZ204QUhvK0ZnQnJZMzlFU0xxZ2tYazdmSWIrczhuSVJX?=
 =?utf-8?B?TEQrVnVHMytzK2toYWRrKzJLRDRoVWtMVVNaZkxiNElCUjlpUC9SWUZQdDdU?=
 =?utf-8?B?amlDUW5MOW1OenZhaXF1SlVWMDFUYmRybXl1eS9CbHhqTkJrR1J5ditEUCtr?=
 =?utf-8?B?ZVYwWmU4TnorNHdTV1Z5Sm1mdjE0ci9RdFNhMjNSbEhPSUVtenNpSU4vUkJw?=
 =?utf-8?B?ejFud2t4WW5mVWlleGh3ZGwwYnltOVVoMi9VOGcxeGZOcE5VT2NBY0J2eWN4?=
 =?utf-8?B?Sm1VM2ZGSVlsQ1gwQWllSFFXOXRkb1ltd3VSSXhWbjlJdzFZM0tGbiszRThp?=
 =?utf-8?B?akM1eU5rUURwY282VXF6ME5IOCt5K3U1Z2F2dWlTSHA4ZlJqZkxuUTV4UHEr?=
 =?utf-8?B?YjhuYW9EbFA5b0JmTHRmSE9ld2RabVdKSmlaSFF3cU9tSlM3ZnRHd2NrWEoz?=
 =?utf-8?B?KzJIRDBzKy94YUFrbzliU0labStLUzRzdzdPVlhwMlZZUmxsY0ZiL0NmajAr?=
 =?utf-8?B?QlRic3hkMXNMK0t2VzYrSUJIZm5oak5QQkxRc3A4LzFwQlJ0QVZVUjVRT1B0?=
 =?utf-8?B?U3Mvbnd1KzNFeUhMQms4aU80V1dMYWwxM2pkQVdFYis0SmFKc3R5R1JITE1Q?=
 =?utf-8?B?RUVKZlp4czc5ZDJZYkdGN2VJbFBKUjdUcmZDM1FOdGV1V0tuR2UwbUVuU0J4?=
 =?utf-8?B?OHlMU0V3MFFJWHFyQlJKbkFDUjBNL0hweUpBRFJaWHdINDRXanFETDd5dnVU?=
 =?utf-8?B?YVdkbTdsNlZJNk9ncjlQTm1UcGJyR29yM0NvRU92eWFyR0FoS0JackZTM2hY?=
 =?utf-8?B?MlVjK2x3VUU0R0RDSFVBTm5hQzBCWDV2YXM3RGVDMEFlMGd2VkxlN2JVUE5t?=
 =?utf-8?B?aGR2N2tvK0pSZ0tzMHpQbWhqRnlBcGNKdC8rU2lhKzVHamI4OWxPendiOWlG?=
 =?utf-8?B?TVAyUUlvd3BYM2JWalloa1poQlVDQWlQckhkZGhSZ3J6dzdmNll1YXN0YWgv?=
 =?utf-8?B?bmpLM1g5SGY4WmU3Q3hxMkRQRlZGS0xaempzcW4vMTF0MDA1TXNKYlJBSmNJ?=
 =?utf-8?B?WEd0NWJTQmlhNWFWZ1JFb1pydklnNDRRd1cwTFhkUXZDbGF5ejlabXRjUE1W?=
 =?utf-8?B?dTJ6eWFTbTFTU2xUbzJrZ3ZjSlZoZlRQL1hFTWpEcGxJVW5lZU9pakxFdThG?=
 =?utf-8?B?WGtndzlqaytYTSswSWcvRzJ1VzE0N0I2ZnRzalFmalY5NUdXMktsWFF1MSsz?=
 =?utf-8?B?bWdhdlIrcGhOZGdRdEU4blRDSnNKS21vUFdvY0JiZVloQUNzejNiUTk2SEMx?=
 =?utf-8?B?dnJkSFFxcGhFRDlIQllTcEUxVlIrKzNtRDJMOWduVlE0WlBzU1JZM2xITW1F?=
 =?utf-8?B?N2JPdUhNR045MU5nbjFnZjFnTGV4aGpCbUZvN2g5SFV5TngyZVFhaWQwREtz?=
 =?utf-8?B?dDVoNlRPRHpXMXRZc1gxL1RpWWZxM2IxZmJONmswOVNmSkgyR0xkcnpoRW95?=
 =?utf-8?B?a3pzUzBZZWxTZ3NiWFVhbWZ4LzJyb3hVNmJKQldHeGFCWEVSNTcwZW4zS1F1?=
 =?utf-8?B?QzJPeW0vSHVESHd5Sm14VmpPM1lpK3c3WmhFWVdybytlRkhWN2IzU0NUMkNj?=
 =?utf-8?B?UlNjcHlpM1RtWFQ3YVEzVS9HQk5lV04yOHZyRDlFd2xEQ0R5OUNCYWtGWWpk?=
 =?utf-8?B?d0Z6OWlZWFFCYlVpczFVRHFiVlNaenlBV1VSWGRVUDFFclc0eHJNektkemQv?=
 =?utf-8?B?SC9ZM2preFk0dFJ4YUxrZGpGRDdtUFUyZXlmRE1UQlFXY2tqcSsxVk1ObzJz?=
 =?utf-8?B?cU1HUGVuSDB6Y3V4ZFpla1UxcCs1RDM4ZTBEVjZXSnNYTU5pOGtHa28zcVdn?=
 =?utf-8?B?WFFaMFN3eE5UUGJtSzVTdFI0enZUYjU4eW4zVXlRZTJGcFZNcDdHNEQ1Y2pp?=
 =?utf-8?B?YVp5L0ZVaDY4U3QyU3lWYzdkYUV4bEZGNDlmZS9nTXpicEFyM1BVQzkwMlhG?=
 =?utf-8?B?ODNhR2VhY2dZMTNROFdseW9KZGE5SzRBa2M4d00yUk5hNGJLd3FSTTB3MWQv?=
 =?utf-8?B?dFVzWUQ3OExScEp5d3BCUjZBNVZOS0RDZGN0WE9FV00rVGdKQ0ZNY0o3Y2JB?=
 =?utf-8?B?c1k3S2xtNU5HUytjSUJ0eThQR2x5N1o2Z2dNd2pFQUNVWjRnaG9BYUhJclZK?=
 =?utf-8?B?QTE2dmhFT055ejYxNUJhRGpGeHlCTDJUSTFMVHF6SGJEMVJrUm5LOG9lWWND?=
 =?utf-8?B?bXZqMklqdC83M3RtelYzNkJWV3hkMjlQRVdUNjkrNjlqOEgweWxkckVGaTFy?=
 =?utf-8?B?eU9QUkxjRng3eC9wK1RtY0RkWGRFcmRBSXRsRFFvck94djVwNmpQL1NPVFpa?=
 =?utf-8?Q?3vFEwkdkILnWEu08=3D?=
X-Exchange-RoutingPolicyChecked: Nn85bihJC/FdzJoLCQAPBSaJmJ/rxQBM5NsdILVMrP5/m5l1cI34x2QyroT4z7qeosoE5Uzz+qasq/T0zC43v1FjK4i//f6KwUbYMzCxpjwqOpl2Yy8wo/ZsxrL7V3ibRhhYRoeuK3GkwLJXFkfH8QcN3IyF6Xw3t8gMbJz0yZkLOxDyoaNj1M/iaMJNcB5xb1OK2VQk+ZPW9vYimfckgyLfeLEdoRehg+phBFHdaekoMtv6zGgGZuFZ7a0k1MeQbBHOXwSGpnVgzD56Ri4RArRe3DpjpHEnzXbgk69gxfqk+odhBcpcPvHRgRu53cEWISvwfip59qBpyZzFdTcdZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7c2f9a-046d-4bcc-8227-08deaf68ae14
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:22:06.9090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYUU7oKYJpaAPPtkHm1yS2OpruFh6j7fwht3hPy3Jx+CFBQRGIlif4hePFrTtDjYDdnNmC2wCND2qvAp5srr1xzjHHp3G4DFhxOgkjXQk2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9352
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

--------------r33hE0rhdtdEes0RxZr9tbpE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi JP,

The review comments were mistakenly replied to in revision 1. The same 
comments apply to revision 2.

On 5/7/2026 12:19 AM, Juha-Pekka Heikkila wrote:
> Separate different planar pixel format tests onto their own dynamic subtests
> to make it easier for debugging. All tests here are only testing Intel
> hw related restrictions hence it make zero sense to run this on vkms or
> other drivers. I added back the original limitation to make these Intel only.
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> Tested-by: Vidya Srinivas<vidya.srinivas@intel.com>
> ---
>   tests/kms_plane.c | 322 ++++++++++++++++++++++++++--------------------
>   1 file changed, 186 insertions(+), 136 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 7962c733a..6c08f1de8 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -41,8 +41,25 @@
>   #include "xe/xe_query.h"
>   
>   /**
> - * SUBTEST: planar-pixel-format-settings
> - * Description: verify planar settings for pixel format are handled correctly
> + * SUBTEST: planar-pixel-format-settings@nv12-odd-width
> + * Description: Verify odd-width (257px) NV12 framebuffer is rejected by the
> + *              kernel on Intel hardware (display ver < 20 expects -EINVAL).
> + * Driver requirement: i915, xe
> + *
> + * SUBTEST: planar-pixel-format-settings@nv12-odd-height
> + * Description: Verify odd-height (257px) NV12 framebuffer is rejected by the
> + *              kernel on Intel hardware (display ver < 20 or >= 35 expects -EINVAL).
> + * Driver requirement: i915, xe
> + *
> + * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
> + * Description: Verify odd horizontal pan on NV12 framebuffer is rejected by
> + *              the kernel on Intel hardware (display ver< 35 expects -EINVAL). + * Driver requirement: i915, xe + * + * 
> SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan + * 
> Description: Verify odd vertical pan on P016 framebuffer and check CRC 
> + * matches a reference XRGB8888 blue fill on Intel hardware. + * 
> Driver requirement: i915, xe * * SUBTEST: plane-position-%s * 
> Description: Verify plane position using two planes to create a 
> %arg[1] @@ -1354,165 +1371,197 @@ test_pixel_formats(data_t *data, 
> igt_crtc_t *crtc) igt_remove_fb(data->drm_fd, &primary_fb);
>   }
>   
> -static void test_planar_settings(data_t *data)
> +static igt_plane_t *
> +planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>   {
> -	igt_display_t *display = &data->display;
> -	igt_crtc_t *crtc;
> -	igt_output_t *output;
> -	igt_fb_t fb, fb_ref;
> -	igt_plane_t *primary;
> -	igt_crc_t crc, crc_ref;
> -	int devid;
> -	int display_ver = -1;
> +	igt_display_reset(&data->display);
> +	igt_output_set_crtc(output, crtc);
> +	igt_display_commit_atomic(&data->display,
> +				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +}
> +
> +static void
> +test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> +		    int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb;
> +	int expected_rval = display_ver >= 20 ? 0 : -EINVAL;
>   	int rval;
> -	bool is_vkms = false;
>   
> -	/*
> -	 * If here is added non-intel tests below require will need to be
> -	 * changed to if(..)
> -	 */
> -	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
> -	if (is_intel_device(data->drm_fd)) {
> -		igt_require_intel(data->drm_fd);
> -		devid = intel_get_drm_devid(data->drm_fd);
> -		igt_require(intel_display_ver(devid) >= 9);
> -		display_ver = intel_display_ver(devid);
> -		igt_require(display_ver >= 9);
> -	} else if (is_vkms_device(data->drm_fd)) {
> -		is_vkms = true;
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd width NV12 test skipped - format/mod not supported\n");
> +		return;
>   	}
>   
> -	crtc = igt_first_crtc_with_single_output(display, &output);
> +	igt_create_fb(data->drm_fd, 257, 256,
> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +					     DRM_MODE_ATOMIC_TEST_ONLY,
> +					     NULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd width NV12 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
>   
> -	igt_output_set_crtc(output, crtc);
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +static void
> +test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> +		     int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb;
> +	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
> +	int rval;
>   
> -	igt_display_commit_atomic(&data->display,
> -				  DRM_MODE_ATOMIC_ALLOW_MODESET,
> -				  NULL);
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> -				     DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> -
> -		if (display_ver >= 20 || is_vkms)
> -			expected_rval = 0;
> -
> -		igt_create_fb(data->drm_fd, 257, 256,
> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						     DRM_MODE_ATOMIC_TEST_ONLY,
> -						     NULL);
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
> -	} else {
> -		igt_debug("Odd width NV12 framebuffer test skipped\n");
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd height NV12 test skipped - format/mod not supported\n");
> +		return;
> +	}
> +
> +	igt_create_fb(data->drm_fd, 256, 257,
> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +					     DRM_MODE_ATOMIC_TEST_ONLY,
> +					     NULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd height NV12 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
> +
> +static void
> +test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
> +			     igt_output_t *output, int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb;
> +	int expected_rval = display_ver >= 35 ? 0 : -EINVAL;
> +	int rval;
> +
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd h-pan NV12 test skipped - format/mod not supported\n");
> +		return;
>   	}
>   
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> -				     DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> +	igt_create_fb(data->drm_fd, 810, 590,
> +		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_plane_set_size(primary, 810, 590);
> +	igt_plane_set_position(primary, -501, 200);
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET |
> +					     DRM_MODE_ATOMIC_TEST_ONLY,
> +					     NULL);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd horizontal pan NV12 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
>   
> -		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
> -			expected_rval = 0;
> +static void
> +test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
> +			   igt_output_t *output, int display_ver)
> +{
> +	igt_plane_t *primary = planar_test_setup(data, crtc, output);
> +	igt_fb_t fb, fb_ref;
> +	igt_crc_t crc, crc_ref;
> +	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
> +	int rval;
>   
> -		igt_create_fb(data->drm_fd, 256, 257,
> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						     DRM_MODE_ATOMIC_TEST_ONLY,
> -						     NULL);
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
> -	} else {
> -		igt_debug("Odd height NV12 framebuffer test skipped\n");
> +	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
> +				      DRM_FORMAT_MOD_LINEAR)) {
> +		igt_debug("Odd v-pan P016 test skipped - format/mod not supported\n");
> +		return;
>   	}
>   
> -	/* test against intel_plane_check_src_coordinates() in i915 */
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> -				     DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> +	igt_create_color_fb(data->drm_fd, 256, 260,
> +			    DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, &fb);
>   
> -		if (display_ver >= 35 || is_vkms)
> -			expected_rval = 0;
> +	igt_plane_set_fb(primary, &fb);
> +	igt_plane_set_position(primary, 1, 1);
> +	igt_plane_set_size(primary, 256, 256);
> +	igt_fb_set_position(&fb, primary, 0, 3);
> +	igt_fb_set_size(&fb, primary, 256, 256);
> +
> +	rval = igt_display_try_commit_atomic(&data->display,
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					     NULL);
> +	if (rval == 0) {
> +		set_legacy_lut(data, crtc, LUT_MASK);
> +		igt_wait_for_vblank_count(crtc, 1);
> +
> +		data->pipe_crc = igt_crtc_crc_new(crtc,
> +						  IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> +
> +		/* reference: plain blue XRGB8888 of the same visible size */
> +		igt_create_color_fb(data->drm_fd, 256, 256,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 0.0, 1.0, &fb_ref);
> +		igt_plane_set_fb(primary, &fb_ref);
> +		rval = igt_display_try_commit_atomic(&data->display,
> +						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						     NULL);
>   
> -		igt_create_fb(data->drm_fd, 810, 590,
> -			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
> -		igt_plane_set_fb(primary, &fb);
> -		igt_plane_set_size(primary, 810, 590);
> -		igt_plane_set_position(primary, -501, 200);
> -		rval = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET |
> -						     DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> +		set_legacy_lut(data, crtc, 0xffff);
> +		igt_pipe_crc_free(data->pipe_crc);
> +		data->pipe_crc = NULL;
>   
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd horizontal pan NV12 framebuffer\n");
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &fb_ref);
> +		igt_assert_crc_equal(&crc_ref, &crc);
>   	} else {
> -		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
> +		igt_plane_set_fb(primary, NULL);
>   	}
>   
> -	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
> -					    DRM_FORMAT_MOD_LINEAR)) {
> -		int expected_rval = -EINVAL;
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_assert_f(rval == expected_rval,
> +		     "Odd vertical pan P016 framebuffer: got %d, expected %d\n",
> +		     rval, expected_rval);
> +}
>   
> -		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
> -			expected_rval = 0;
> +static void test_planar_settings(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_crtc_t *crtc;
> +	igt_output_t *output;
> +	int display_ver;
>   
> -		igt_create_color_fb(data->drm_fd, 256, 260,
> -			      DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
> -			      0.0, 0.0, 1.0,
> -			      &fb);
> +	igt_require(display->is_atomic);
>   
> -		igt_plane_set_fb(primary, &fb);
> -		igt_plane_set_position(primary, 1, 1);
> -		igt_plane_set_size(primary, 256, 256);
> +	/* All sub-tests below are Intel-specific. */
> +	igt_require_intel(data->drm_fd);
> +	display_ver = intel_display_ver(intel_get_drm_devid(data->drm_fd));
> +	igt_require(display_ver >= 9);
>   
> -		/* set odd v pan and check with crc fb didn't break */
> -		igt_fb_set_position(&fb, primary, 0, 3);
> -		igt_fb_set_size(&fb, primary, 256, 256);
> -		rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -						     NULL);
> -		if (rval == 0) {
> -			set_legacy_lut(data,
> -				       crtc,
> -				       LUT_MASK);
> -			igt_wait_for_vblank_count(crtc,
> -						  1);
> -			data->pipe_crc = igt_crtc_crc_new(crtc,
> -							  IGT_PIPE_CRC_SOURCE_AUTO);
> -			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> -
> -			igt_create_color_fb(data->drm_fd, 256, 256,
> -				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -				0.0, 0.0, 1.0,
> -				&fb_ref);
> -
> -			igt_plane_set_fb(primary, &fb_ref);
> -			rval = igt_display_try_commit_atomic(&data->display,
> -						     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -						     NULL);
> +	crtc = igt_first_crtc_with_single_output(display, &output);
> +	igt_require_f(crtc, "No suitable output/crtc pair found\n");
>   
> -			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> -			set_legacy_lut(data,
> -				       crtc,
> -				       0xffff);
> +	igt_dynamic("nv12-odd-width")
> +		test_nv12_odd_width(data, crtc, output, display_ver);
>   
> -			igt_pipe_crc_free(data->pipe_crc);
> -			data->pipe_crc = NULL;
> +	igt_dynamic("nv12-odd-height")
> +		test_nv12_odd_height(data, crtc, output, display_ver);
>   
> -			igt_remove_fb(data->drm_fd, &fb_ref);
> -			igt_assert_crc_equal(&crc_ref, &crc);
> -		}
> +	igt_dynamic("nv12-odd-horizontal-pan")
> +		test_nv12_odd_horizontal_pan(data, crtc, output, display_ver);
>   
> -		igt_remove_fb(data->drm_fd, &fb);
> -		igt_assert_f(rval == expected_rval, "Odd vertical pan P016 framebuffer\n");
> -	} else {
> -		igt_debug("Odd vertical pan P016 framebuffer test skipped\n");
> -	}
> +	igt_dynamic("p016-odd-vertical-pan")
> +		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
>   }
>   
>   static bool is_pipe_limit_reached(int count)
> @@ -1621,8 +1670,9 @@ run_tests_for_pipe_plane(data_t *data)
>   		run_test(data, dynamic_test_handler);
>   	}
>   
> -	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
> -	igt_subtest_f("planar-pixel-format-settings")
> +	igt_describe("verify planar pixel format settings are accepted or rejected correctly"
> +		     " on Intel hardware");
> +	igt_subtest_with_dynamic_f("planar-pixel-format-settings")
>   		test_planar_settings(data);
>   }
>   
--------------r33hE0rhdtdEes0RxZr9tbpE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP,<br>
      <br>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">The
        review comments were mistakenly replied to in revision 1. The
        same comments apply to revision 2.</div>
    </p>
    <div class="moz-cite-prefix">On 5/7/2026 12:19 AM, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260506184936.76492-2-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">Separate different planar pixel format tests onto their own dynamic subtests
to make it easier for debugging. All tests here are only testing Intel
hw related restrictions hence it make zero sense to run this on vkms or
other drivers. I added back the original limitation to make these Intel only.

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
Tested-by: Vidya Srinivas <a class="moz-txt-link-rfc2396E" href="mailto:vidya.srinivas@intel.com">&lt;vidya.srinivas@intel.com&gt;</a>
---
 tests/kms_plane.c | 322 ++++++++++++++++++++++++++--------------------
 1 file changed, 186 insertions(+), 136 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 7962c733a..6c08f1de8 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -41,8 +41,25 @@
 #include &quot;xe/xe_query.h&quot;
 
 /**
- * SUBTEST: planar-pixel-format-settings
- * Description: verify planar settings for pixel format are handled correctly
+ * SUBTEST: planar-pixel-format-settings@nv12-odd-width
+ * Description: Verify odd-width (257px) NV12 framebuffer is rejected by the
+ *              kernel on Intel hardware (display ver &lt; 20 expects -EINVAL).
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: planar-pixel-format-settings@nv12-odd-height
+ * Description: Verify odd-height (257px) NV12 framebuffer is rejected by the
+ *              kernel on Intel hardware (display ver &lt; 20 or &gt;= 35 expects -EINVAL).
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
+ * Description: Verify odd horizontal pan on NV12 framebuffer is rejected by
+ *              the kernel on Intel hardware (display ver <a class="moz-txt-link-rfc2396E" href="mailto:35expects-EINVAL).+*Driverrequirement:i915,xe+*+*SUBTEST:planar-pixel-format-settings@p016-odd-vertical-pan+*Description:VerifyoddverticalpanonP016framebufferandcheckCRC+*matchesareferenceXRGB8888bluefillonIntelhardware.+*Driverrequirement:i915,xe**SUBTEST:plane-position-%s*Description:Verifyplanepositionusingtwoplanestocreatea%arg[1]@@-1354,165+1371,197@@test_pixel_formats(data_t*data,igt_crtc_t*crtc)igt_remove_fb(data-">&lt; 35 expects -EINVAL).
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan
+ * Description: Verify odd vertical pan on P016 framebuffer and check CRC
+ *              matches a reference XRGB8888 blue fill on Intel hardware.
+ * Driver requirement: i915, xe
  *
  * SUBTEST: plane-position-%s
  * Description: Verify plane position using two planes to create a %arg[1]
@@ -1354,165 +1371,197 @@ test_pixel_formats(data_t *data, igt_crtc_t *crtc)
 	igt_remove_fb(data-&gt;</a>drm_fd, &amp;primary_fb);
 }
 
-static void test_planar_settings(data_t *data)
+static igt_plane_t *
+planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &amp;data-&gt;display;
-	igt_crtc_t *crtc;
-	igt_output_t *output;
-	igt_fb_t fb, fb_ref;
-	igt_plane_t *primary;
-	igt_crc_t crc, crc_ref;
-	int devid;
-	int display_ver = -1;
+	igt_display_reset(&amp;data-&gt;display);
+	igt_output_set_crtc(output, crtc);
+	igt_display_commit_atomic(&amp;data-&gt;display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+}
+
+static void
+test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		    int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb;
+	int expected_rval = display_ver &gt;= 20 ? 0 : -EINVAL;
 	int rval;
-	bool is_vkms = false;
 
-	/*
-	 * If here is added non-intel tests below require will need to be
-	 * changed to if(..)
-	 */
-	igt_require_f(data-&gt;display.is_atomic, &quot;Atomic mode-set not supported\n&quot;);
-	if (is_intel_device(data-&gt;drm_fd)) {
-		igt_require_intel(data-&gt;drm_fd);
-		devid = intel_get_drm_devid(data-&gt;drm_fd);
-		igt_require(intel_display_ver(devid) &gt;= 9);
-		display_ver = intel_display_ver(devid);
-		igt_require(display_ver &gt;= 9);
-	} else if (is_vkms_device(data-&gt;drm_fd)) {
-		is_vkms = true;
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug(&quot;Odd width NV12 test skipped - format/mod not supported\n&quot;);
+		return;
 	}
 
-	crtc = igt_first_crtc_with_single_output(display, &amp;output);
+	igt_create_fb(data-&gt;drm_fd, 257, 256,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
+	igt_plane_set_fb(primary, &amp;fb);
+	rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET |
+					     DRM_MODE_ATOMIC_TEST_ONLY,
+					     NULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data-&gt;drm_fd, &amp;fb);
+	igt_assert_f(rval == expected_rval,
+		     &quot;Odd width NV12 framebuffer: got %d, expected %d\n&quot;,
+		     rval, expected_rval);
+}
 
-	igt_output_set_crtc(output, crtc);
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+static void
+test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		     int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb;
+	int expected_rval = (display_ver &gt;= 20 &amp;&amp; display_ver &lt; 35) ? 0 : -EINVAL;
+	int rval;
 
-	igt_display_commit_atomic(&amp;data-&gt;display,
-				  DRM_MODE_ATOMIC_ALLOW_MODESET,
-				  NULL);
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
-
-		if (display_ver &gt;= 20 || is_vkms)
-			expected_rval = 0;
-
-		igt_create_fb(data-&gt;drm_fd, 257, 256,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
-		igt_plane_set_fb(primary, &amp;fb);
-		rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET |
-						     DRM_MODE_ATOMIC_TEST_ONLY,
-						     NULL);
-		igt_remove_fb(data-&gt;drm_fd, &amp;fb);
-		igt_assert_f(rval == expected_rval, &quot;Odd width NV12 framebuffer\n&quot;);
-	} else {
-		igt_debug(&quot;Odd width NV12 framebuffer test skipped\n&quot;);
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug(&quot;Odd height NV12 test skipped - format/mod not supported\n&quot;);
+		return;
+	}
+
+	igt_create_fb(data-&gt;drm_fd, 256, 257,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
+	igt_plane_set_fb(primary, &amp;fb);
+	rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET |
+					     DRM_MODE_ATOMIC_TEST_ONLY,
+					     NULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data-&gt;drm_fd, &amp;fb);
+	igt_assert_f(rval == expected_rval,
+		     &quot;Odd height NV12 framebuffer: got %d, expected %d\n&quot;,
+		     rval, expected_rval);
+}
+
+static void
+test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
+			     igt_output_t *output, int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb;
+	int expected_rval = display_ver &gt;= 35 ? 0 : -EINVAL;
+	int rval;
+
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug(&quot;Odd h-pan NV12 test skipped - format/mod not supported\n&quot;);
+		return;
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
+	igt_create_fb(data-&gt;drm_fd, 810, 590,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
+	igt_plane_set_fb(primary, &amp;fb);
+	igt_plane_set_size(primary, 810, 590);
+	igt_plane_set_position(primary, -501, 200);
+	rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET |
+					     DRM_MODE_ATOMIC_TEST_ONLY,
+					     NULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data-&gt;drm_fd, &amp;fb);
+	igt_assert_f(rval == expected_rval,
+		     &quot;Odd horizontal pan NV12 framebuffer: got %d, expected %d\n&quot;,
+		     rval, expected_rval);
+}
 
-		if ((display_ver &gt;= 20 &amp;&amp; display_ver &lt; 35) || is_vkms)
-			expected_rval = 0;
+static void
+test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
+			   igt_output_t *output, int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb, fb_ref;
+	igt_crc_t crc, crc_ref;
+	int expected_rval = (display_ver &gt;= 20 &amp;&amp; display_ver &lt; 35) ? 0 : -EINVAL;
+	int rval;
 
-		igt_create_fb(data-&gt;drm_fd, 256, 257,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
-		igt_plane_set_fb(primary, &amp;fb);
-		rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET |
-						     DRM_MODE_ATOMIC_TEST_ONLY,
-						     NULL);
-		igt_remove_fb(data-&gt;drm_fd, &amp;fb);
-		igt_assert_f(rval == expected_rval, &quot;Odd height NV12 framebuffer\n&quot;);
-	} else {
-		igt_debug(&quot;Odd height NV12 framebuffer test skipped\n&quot;);
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug(&quot;Odd v-pan P016 test skipped - format/mod not supported\n&quot;);
+		return;
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
+	igt_create_color_fb(data-&gt;drm_fd, 256, 260,
+			    DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 1.0, &amp;fb);
 
-		if (display_ver &gt;= 35 || is_vkms)
-			expected_rval = 0;
+	igt_plane_set_fb(primary, &amp;fb);
+	igt_plane_set_position(primary, 1, 1);
+	igt_plane_set_size(primary, 256, 256);
+	igt_fb_set_position(&amp;fb, primary, 0, 3);
+	igt_fb_set_size(&amp;fb, primary, 256, 256);
+
+	rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET,
+					     NULL);
+	if (rval == 0) {
+		set_legacy_lut(data, crtc, LUT_MASK);
+		igt_wait_for_vblank_count(crtc, 1);
+
+		data-&gt;pipe_crc = igt_crtc_crc_new(crtc,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc);
+
+		/* reference: plain blue XRGB8888 of the same visible size */
+		igt_create_color_fb(data-&gt;drm_fd, 256, 256,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    0.0, 0.0, 1.0, &amp;fb_ref);
+		igt_plane_set_fb(primary, &amp;fb_ref);
+		rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     NULL);
 
-		igt_create_fb(data-&gt;drm_fd, 810, 590,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &amp;fb);
-		igt_plane_set_fb(primary, &amp;fb);
-		igt_plane_set_size(primary, 810, 590);
-		igt_plane_set_position(primary, -501, 200);
-		rval = igt_display_try_commit_atomic(&amp;data-&gt;display, DRM_MODE_ATOMIC_ALLOW_MODESET |
-						     DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_ref);
+		set_legacy_lut(data, crtc, 0xffff);
+		igt_pipe_crc_free(data-&gt;pipe_crc);
+		data-&gt;pipe_crc = NULL;
 
-		igt_remove_fb(data-&gt;drm_fd, &amp;fb);
-		igt_assert_f(rval == expected_rval, &quot;Odd horizontal pan NV12 framebuffer\n&quot;);
+		igt_plane_set_fb(primary, NULL);
+		igt_remove_fb(data-&gt;drm_fd, &amp;fb_ref);
+		igt_assert_crc_equal(&amp;crc_ref, &amp;crc);
 	} else {
-		igt_debug(&quot;Odd horizontal pan NV12 framebuffer test skipped\n&quot;);
+		igt_plane_set_fb(primary, NULL);
 	}
 
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
-					    DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
+	igt_remove_fb(data-&gt;drm_fd, &amp;fb);
+	igt_assert_f(rval == expected_rval,
+		     &quot;Odd vertical pan P016 framebuffer: got %d, expected %d\n&quot;,
+		     rval, expected_rval);
+}
 
-		if ((display_ver &gt;= 20 &amp;&amp; display_ver &lt; 35) || is_vkms)
-			expected_rval = 0;
+static void test_planar_settings(data_t *data)
+{
+	igt_display_t *display = &amp;data-&gt;display;
+	igt_crtc_t *crtc;
+	igt_output_t *output;
+	int display_ver;
 
-		igt_create_color_fb(data-&gt;drm_fd, 256, 260,
-			      DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
-			      0.0, 0.0, 1.0,
-			      &amp;fb);
+	igt_require(display-&gt;is_atomic);
 
-		igt_plane_set_fb(primary, &amp;fb);
-		igt_plane_set_position(primary, 1, 1);
-		igt_plane_set_size(primary, 256, 256);
+	/* All sub-tests below are Intel-specific. */
+	igt_require_intel(data-&gt;drm_fd);
+	display_ver = intel_display_ver(intel_get_drm_devid(data-&gt;drm_fd));
+	igt_require(display_ver &gt;= 9);
 
-		/* set odd v pan and check with crc fb didn't break */
-		igt_fb_set_position(&amp;fb, primary, 0, 3);
-		igt_fb_set_size(&amp;fb, primary, 256, 256);
-		rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
-						     NULL);
-		if (rval == 0) {
-			set_legacy_lut(data,
-				       crtc,
-				       LUT_MASK);
-			igt_wait_for_vblank_count(crtc,
-						  1);
-			data-&gt;pipe_crc = igt_crtc_crc_new(crtc,
-							  IGT_PIPE_CRC_SOURCE_AUTO);
-			igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc);
-
-			igt_create_color_fb(data-&gt;drm_fd, 256, 256,
-				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-				0.0, 0.0, 1.0,
-				&amp;fb_ref);
-
-			igt_plane_set_fb(primary, &amp;fb_ref);
-			rval = igt_display_try_commit_atomic(&amp;data-&gt;display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
-						     NULL);
+	crtc = igt_first_crtc_with_single_output(display, &amp;output);
+	igt_require_f(crtc, &quot;No suitable output/crtc pair found\n&quot;);
 
-			igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_ref);
-			set_legacy_lut(data,
-				       crtc,
-				       0xffff);
+	igt_dynamic(&quot;nv12-odd-width&quot;)
+		test_nv12_odd_width(data, crtc, output, display_ver);
 
-			igt_pipe_crc_free(data-&gt;pipe_crc);
-			data-&gt;pipe_crc = NULL;
+	igt_dynamic(&quot;nv12-odd-height&quot;)
+		test_nv12_odd_height(data, crtc, output, display_ver);
 
-			igt_remove_fb(data-&gt;drm_fd, &amp;fb_ref);
-			igt_assert_crc_equal(&amp;crc_ref, &amp;crc);
-		}
+	igt_dynamic(&quot;nv12-odd-horizontal-pan&quot;)
+		test_nv12_odd_horizontal_pan(data, crtc, output, display_ver);
 
-		igt_remove_fb(data-&gt;drm_fd, &amp;fb);
-		igt_assert_f(rval == expected_rval, &quot;Odd vertical pan P016 framebuffer\n&quot;);
-	} else {
-		igt_debug(&quot;Odd vertical pan P016 framebuffer test skipped\n&quot;);
-	}
+	igt_dynamic(&quot;p016-odd-vertical-pan&quot;)
+		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
 }
 
 static bool is_pipe_limit_reached(int count)
@@ -1621,8 +1670,9 @@ run_tests_for_pipe_plane(data_t *data)
 		run_test(data, dynamic_test_handler);
 	}
 
-	igt_describe(&quot;verify planar settings for pixel format are accepted or rejected correctly&quot;);
-	igt_subtest_f(&quot;planar-pixel-format-settings&quot;)
+	igt_describe(&quot;verify planar pixel format settings are accepted or rejected correctly&quot;
+		     &quot; on Intel hardware&quot;);
+	igt_subtest_with_dynamic_f(&quot;planar-pixel-format-settings&quot;)
 		test_planar_settings(data);
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------r33hE0rhdtdEes0RxZr9tbpE--
