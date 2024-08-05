Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B817C52D71
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 06:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D35010E126;
	Mon,  5 Aug 2024 06:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WA8LAZ5e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB1B10E126
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 06:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722839496; x=1754375496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VWKL/7p7EcfYRnktB5MhOgNdGchjQOixum5OTcMYVfk=;
 b=WA8LAZ5ec/rFiKX8DJKeRnQAznsxkvEX/ENMmvTrKvlnWOdEGqNF9EHY
 6FYGGxrMh0Qz5LvVLheef2VkKy0mcBCYOXeIvfV9ehBQrFEClXULPQ7U0
 thmkC0gFCoRQ4cUoauhqv4TFOZu9tGlB9QJXcD4xzEVjdXyYGWhBt0kR4
 4inOb/xryFOy4nN1Or1fsuqnDWjrBdCDZEUqbkJ5j+eVX6PMfiWzfCTis
 dfN9blHbtheB/7jQ0KzDIDkCXMDdugvkv/7tITcogwKQAFQw2AzrwEYtp
 EvsIn/b2CfnjPWGICU5Pc2GqRyx0pN0vDRfwPHe6hCEg9wZQ1Rer1WHOi A==;
X-CSE-ConnectionGUID: oaWp7RisSeGu4hT3gHlXCg==
X-CSE-MsgGUID: bL8v34noTtWogDII597iqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20663208"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="20663208"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:31:35 -0700
X-CSE-ConnectionGUID: QXxx7NptRwK5xnvm0pRxQA==
X-CSE-MsgGUID: Bo18JwTMT+mBwMQcUYF9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="56144453"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 23:31:36 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:31:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 23:31:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 23:31:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOg9KHrT0/dhgQls2sh67aDSShId4ki8z0A0zpw2aquhr/5BKTPgvb+OUsWR1owOSr5zhV/A3XYCcsnKEXNLEM5h1MFJqnRQSzFhGGphZ0r4/R8FOjfTC0ecWOHlDFjswBSiKC5sE43KKxWO5sfySl0dIw3/17G73xp8jrsJOwLChmmlhyYUGjGPQqzyDlWjsLhQKi0Is+GZloOStv/Nciyfzo+xNdZKbRXJjZ+lKxU/DW1IUfg5hwzKkGDoYzFaP0asi46+l4da0irkSjQUYZ2fdUBsKPVVdcsaqAaIM4+y1mxlMcnkEf1cGvXCWtPPxnB7e1daPQ+dzTODmMG0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4QaOa4sb38S9Hmb4Mt58MSbQWg09zfIduMrg/ClAV4=;
 b=RZjssEq3sXgJ5J56B9VdvJsvXOOJZzSKRR0ULvhkPirWS2R9kEjY6uRcDRBctdPKPvkQTIiSqo7trvTFLkHA1d3NYDNQiqIXUIkMzraQgGSUZm1JdhnhQYyKw5FJTG7WakglM8t+AN1mKy3HaBj7oVoyjl9nkHuRm0MSstrg8uKPXqX96riQW0pYpQ2QleBR/HWTdmaBTQd8I+ay9xuXWDB4jIEtXXxfuqR4FbArz01te0tOcT6SJm95FofsD+ad+RpJBW3Zff1iMzJDbVtE4T04cphsond2RS9e0FnrGkUl77Lz9B0oDSbTleCQ2Nw8yJL1YgAp1xitwbJrhM9PyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DS7PR11MB5965.namprd11.prod.outlook.com (2603:10b6:8:70::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Mon, 5 Aug 2024 06:30:58 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 06:30:58 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 54/66] tests/xe_eudebug_online: Add support for
 dynamic debugger sysfs toggle
Thread-Topic: [PATCH i-g-t v2 54/66] tests/xe_eudebug_online: Add support for
 dynamic debugger sysfs toggle
Thread-Index: AQHa4naJmBXP/CNpzUWGEjRj87X1IbIYPRfQ
Date: Mon, 5 Aug 2024 06:30:57 +0000
Message-ID: <DS0PR11MB72644FA8F193FA67DF85DE02D9BE2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-55-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-55-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DS7PR11MB5965:EE_
x-ms-office365-filtering-correlation-id: 8b4e1431-fb2a-4d53-c489-08dcb5182aad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?4JvoOxcyWjzozF/IMkICpFvysmIQ7ST7P4wkRyyE/5BpDkTjTGvWVkX+Cw?=
 =?iso-8859-2?Q?Wp09Hblf/mAmyeLABw0ch/9EImhWxB8uQ44lE5Kr0VnAaEqecaJWJ2s6p4?=
 =?iso-8859-2?Q?lgar0MVHk0EJ6CR6I/gpkocGRk0FhbmE26JQNJXCHl95hp0IbuAWTr2LDQ?=
 =?iso-8859-2?Q?8o1TfMcQZL4FMgpczFCSbEMrDMGWSXdEpEVPbqZokUC623JldFArCCkBRS?=
 =?iso-8859-2?Q?u9tnR9SADuM5X7qv+101JOuo9G62JqcofWUdGITjoZ+8RclJ3ceHy9LGEU?=
 =?iso-8859-2?Q?4JQlgdAJoDiWr0wwSJvuILaiCw33fY9AD/ex7iw38s8NuaCgq2EGNkAGUf?=
 =?iso-8859-2?Q?g4CXvZ7K8e10+5xjpbs8MhuxXgE3vXb6WENDR/tV4OzxZJ36aBGSZ4U10k?=
 =?iso-8859-2?Q?HCm/51BpeBUwE4tHk7kwJjyDc7lNHJFzFSFnWrZHcqDl+bwX8VGIGn6CME?=
 =?iso-8859-2?Q?RpGr9sXz65OLTDMUqq4HKas7HN/aftNiTQn4eLAvm1nBqEju7RJn+n6POE?=
 =?iso-8859-2?Q?qrfOfJHho+11rHF0SqydVpV1eGpWHxbCV8K3hDes0b7q2jNnoF35C8cD/D?=
 =?iso-8859-2?Q?QbpUTJuNbxkk6XkCnWQm9vV5t8YrIb4FoW+ff4s5hEnDz3opb5mYZzVrt+?=
 =?iso-8859-2?Q?RF4Vh2JrM0EX1CHsqAo5Pu+1GlCX00reMQb2ztVpd18EAVZnmjEcVpxl+x?=
 =?iso-8859-2?Q?iqboKNXLQO0WEW1W6uV99HbKxtpnWeHuZ47JgJCE91d/ed9idVFa/nBoOm?=
 =?iso-8859-2?Q?bbc1i86URrizfLwJP7ORHlkiYFrvfyXwXzoBz5h9B3F/uJPT0YtWK1kZlk?=
 =?iso-8859-2?Q?q/ORYk6DsIvAAjqyjt2n2R1sPot2jMf0lmIOQ1E6VSY57aBSMzlruDdy3x?=
 =?iso-8859-2?Q?xwyKDpqFi1xxiI6ToSBOEHw9kTA1bOxdVQpy5fCP7sO4ZHVEuM8RVf1mHH?=
 =?iso-8859-2?Q?WWpWG++1wJaBQyRBa3jMR+z+XOceotC9k/i/RnFCkyM7/LWlLLvp3akVkj?=
 =?iso-8859-2?Q?aOr2Nmr82qASxgn6VgIyWkbWpGD1w5KBkuwfZ6E6sz7lLoEoFMUCRksjnH?=
 =?iso-8859-2?Q?OvQ1SMNN4rH+AcdguDQ0eIhS5zX/kCrQXZ6F6H7QodieQHfHJBhBMwrywq?=
 =?iso-8859-2?Q?PyBksNSWzLe09Lela1mhDmCTzU9Q+r6JPLXujILj9Cul7M9+0KJQQbLROE?=
 =?iso-8859-2?Q?6lTwwnuyTlvPI6TDio5EN5gkOdZfohO16ML1LEzh0jc/29bemLTg/UiAKl?=
 =?iso-8859-2?Q?FcAZg3rD4Wk+NmD/u/lB1+fj5Muqv2sC6sS54K6+cwLM7A5VJV4FRI5uv0?=
 =?iso-8859-2?Q?JIqOs4H9HYOxZ6E1UN1lBEWbwQY0S6h/Vo7eVz3BFu1xKKFnVoWMTc4cdr?=
 =?iso-8859-2?Q?V7jxpqvlQb46xwNvf0S2f0RFKZsOVwbAvcGDm04ZGBc6GCJru85Usl3Tr0?=
 =?iso-8859-2?Q?fQRHHQx+PdDk35RF1q9/PQbBmN8DtiFcdjPUZw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?rdNubLYD1/4j/nK/MdihbzQD1CAIpyo8XdpK56n0E8aGf8GuVYmw0GSxJs?=
 =?iso-8859-2?Q?ZM38x7wE63hl0wNXBr0cOBU48U6eEG1KvoWx3zoG19/Z6XpYB1v1IpGauJ?=
 =?iso-8859-2?Q?g6phpNtEajpfvXRF9bKVjX7QjJKvxFxuBTnNK76SWimrwOD0V7WYz8EDJb?=
 =?iso-8859-2?Q?wlYyISoh36gLGL9aIGyWQjkKFU+rl9UD9ifDNxq0thMVzcfiD6uiJ5Rmzo?=
 =?iso-8859-2?Q?1oL4NJa+vrV+MpSqhcue5EYg7ZmD53+lg3wMasM3JzIQI8AXLxfCFifQr/?=
 =?iso-8859-2?Q?ZAZkwVtZmFkNmPQ6ti2hTGArqv+5+tEBcBNdjKIN/4ORL8Z9Hf+6FthtN6?=
 =?iso-8859-2?Q?n3dTBrqGBrWrrNa+ljcVREO8mWVUWEM3fDbinjzqNILW3k5Lf8vCZKMoLD?=
 =?iso-8859-2?Q?FEkQwF2kPuZPHrsKayc56UPJ05hTuN5fhvpRFMwpX+mYBeiH3KZlbfN8FR?=
 =?iso-8859-2?Q?2pygH4TeWsLY2bwFAtrn6XwUBlHsCr13CAOc+WGM0mgYC0AmZvOMP/Lq/D?=
 =?iso-8859-2?Q?g0WeEIXA9UBx8lzATXVor95DrxZgpgEIbVqjJfhoiORpqVnM4tzXzBqUqo?=
 =?iso-8859-2?Q?VLGXgCzDAjGjkWf/t4BReDq97ZrhnMr2rl7KgK+KVJ0/4udSDJU9MSnHbV?=
 =?iso-8859-2?Q?6RWALi1iJkpgwPcAS3/2x+YEde247hQjaxGIvqp/2dSphceINFpv0hkhPD?=
 =?iso-8859-2?Q?/8yg2TTO9xuZTvlnfziRPOqDs2+o+FdKbqCiLMdR1/GMLWu6xq8x5MVW6p?=
 =?iso-8859-2?Q?wkds7+s/254K6hUWLBn9nyO0QBSjk9f0HT8fdhkVfaTZYz26ZU4CwQsqB1?=
 =?iso-8859-2?Q?cTr1RV7yI5vmSKUR4NRiCn1N4lSW60RNZL5qOLLnWFT8eYd/Dc3sd9VrWO?=
 =?iso-8859-2?Q?e1/tjRnAtOVHaLDXr0VhscXVVdZMUza6afbSFqr6mQoQeZcN1ROC59nABp?=
 =?iso-8859-2?Q?OBLKGV0XnXuRM73nUEvjaMFHgzwPIHUu71LZWjPr5nLqZWunza3JjxhWyT?=
 =?iso-8859-2?Q?iehSMeUNFfX8vGVQ4oPilYEDXNEjVG1XepCK5GA1PgX8chB/lWPACP50Lw?=
 =?iso-8859-2?Q?IYceQihC+2eZtSyS8OWDcvRIojQnLzwI1fgD59SbstUpFMxMxZjACb/uoR?=
 =?iso-8859-2?Q?RtmMbzsxlh9apCscYSoEN+UpvpQg7ZRBlkLXcsG13soIYGEu/fU8m6nJZM?=
 =?iso-8859-2?Q?fhlMHKb2+LXXOLCRQY3pRnkvtkv+P5mcgqtEupbOpOk3bv+hd5HT9D5D1E?=
 =?iso-8859-2?Q?LTwf+u7hFJ0R8Cr0SreZXVq0lC0QcAcGEgjgJcPu5Fs2+zTx4gq/m9DpxN?=
 =?iso-8859-2?Q?KICaq4EYEGOmXcVbcCLd70KsYcf8sUxWgy4gfe9vdf6d+9pLOBbLKBBrrC?=
 =?iso-8859-2?Q?EaVUErke43qgr9whGVJFf0IEQ4ZGLSfid1CidGzlnXBtIRCdUfWY+nLGjD?=
 =?iso-8859-2?Q?d72q27s1VBZQCKGtEBEXsOMEGEkmtU02t2lpJ1hzuTiwlWWLAn3gCQjQrV?=
 =?iso-8859-2?Q?q+EYaWgWTemDR0xlr0g7PbDrg69QQden7BWQki7JJJP25XJ/XrcygzlAO5?=
 =?iso-8859-2?Q?66yS5dggvQV9bAWX25XECGF+/s1EaOMulka+x9w6UEVQHtTuWlDoGMloZc?=
 =?iso-8859-2?Q?3opze5S+LJnUv85wirZ/KAtxlo03U3WGIiWXhDcIQoUnMhMapAQHwfAg?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4e1431-fb2a-4d53-c489-08dcb5182aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 06:30:57.9052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fetv2kDCeuf4e3z5ejsI4Sw0KBIL/UnHZX1BKJfI6MTpMRls4P0H/O3fPw5qu/FQ7Ixy5nsGO3GEan9z3M/71EtoyoUjbH9G45SyeLR7W+yDEbNh0qwUrRJg2ewMcbMT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5965
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 54/66] tests/xe_eudebug_online: Add support for
> dynamic debugger sysfs toggle
>=20
> From now on the debugger is disabled by default so it is required to enab=
le the
> debugger before using it. This change addresses that fact by calling nece=
ssary
> library functions within test fixtures.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index 5bb165fef..12edd0eb5 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1023,12 +1023,14 @@ static struct drm_xe_engine_class_instance
> *pick_compute(int fd, int gt)  igt_main  {
>  	struct drm_xe_engine_class_instance *hwe;
> +	bool was_enabled;
>  	int fd;
>=20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		intel_allocator_multiprocess_start();
>  		igt_srandom();
> +		was_enabled =3D xe_eudebug_enable(fd, true);
>  	}
>=20
>  	test_gt_render_or_compute("basic-breakpoint", fd, hwe) @@ -
> 1050,6 +1052,8 @@ igt_main
>  		test_interrupt_all(fd, hwe, SHADER_LOOP |
> TRIGGER_RESUME_SET_BP);
>=20
>  	igt_fixture {
> +		xe_eudebug_enable(fd, was_enabled);
> +
>  		intel_allocator_multiprocess_stop();
>  		drm_close_driver(fd);
>  	}
> --
> 2.34.1

