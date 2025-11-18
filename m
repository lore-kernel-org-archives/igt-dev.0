Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47720CED24E
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 09:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB60410E45C;
	Tue, 18 Nov 2025 09:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ep+zAAk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC9110E45C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763457892; x=1794993892;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=tS0Qc6mHm5Z6ua8lxqI0t50WUbwEPntMUTY4EagHtjI=;
 b=Ep+zAAk+6rnd323JzcO2Vm2wnvqpwwl8Do8EIntE8leKRzH3hvsI0nwc
 mY96/dZ1EaO+O1ZlgrrK+NITGQ99UBE1HzNSBkbtOCrnjo6mzQVfMf+p5
 X6ews5JiBwi9FeZ0gGNFdmYpZtmoGi5hqMx36jpIYpXg0d7pGc1f6PrYl
 CnDr0/uxpu1Vwz2d5NLEp2U5GkN7VhPpa7omW+dJUdbqK+SbLR8EU04Ft
 TJQOD6cd27J8hlnfCwQy/HyHH5gWcgnh8h6jfEMEOR5qoKyZ9hQK6Pm1H
 RVfENU880WKCyPADidLHEM93rE3bvf18kebww4JoWPCFqMmG1VL+eRwes w==;
X-CSE-ConnectionGUID: HjBmRWueTdq9Uh7MdT4Psg==
X-CSE-MsgGUID: BYMQbMrqRm6j0o5Npw/puA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65631630"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65631630"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:24:52 -0800
X-CSE-ConnectionGUID: Wx53kSSpTyy+Lsf/T2jxMA==
X-CSE-MsgGUID: PKK8y2E+Q2mvRNEibBqteg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190503398"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:24:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 01:24:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 01:24:51 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 01:24:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pi3hJnfDvuuJvgxYXQzCLPIx63e27/SBEK+ZAvdcVCjkhlNpdUZNrZDl1IjfT1XvXZXGigXOfoaTRubmtqSRuyL37U9uUMkHKoigShDgeb+7PfPfwxkq5FMxJNeUKLShwxTSQYKySAh+INGaOgh60JfLscakKPtH6+Sqb1ZXZoWqVzBKTyDDhXuSsmmwNhrc3ojeiN0v7DidKs5Zd8tjoPVnYaExvwJbpyfmQk8qR0/Nxwdj7dW0XDElmfWDOxgf7afzinGexkKbBdLAiJOSjI/5z3AYn1w86t2PaQL6kKBPniyGtOUDbS1sAIFWJ8GcpdHTLxwAb2MX39zuYyPJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tS0Qc6mHm5Z6ua8lxqI0t50WUbwEPntMUTY4EagHtjI=;
 b=jBeXkJulzKAMHPn7/eHR8HG9YSNNout4ZMwcK08Uo+DKi9VfwF3CZnftXNPiF9JbxdiDF2DH4LGdLOSuxCZY5BcZKYsUBL9di6yRpd8fYfq3BOHpmyBmAphjuvJ42lWHiORaADWdzIh+6T6Qjx7JOHF1BcEqIU1haj2sk6VSmbtPzWlErs3TzRaM9ZKOjAUyl6y21wUvWZpty0fn5wTsgmIXDaAfTCejM/f3dXg0rvVA6TqjOwj/s7H33vM8EfIGC0wpeiIbeLSKls5hjdBHd1ewiVM4hKhQAOqYHvzSBdO4oZUfOtLEFJDnv/evp3+mEx3jklhr923Nj5YI0vo2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM3PPF818092190.namprd11.prod.outlook.com (2603:10b6:f:fc00::f34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 09:24:49 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 09:24:49 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 03/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU cross-GPU memory access test
Thread-Topic: [PATCH i-g-t v7 03/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU cross-GPU memory access test
Thread-Index: AQHcVLs7PXB6Ut9aKk662V3pJBhG5rT22roAgAAvN4CAASb2AA==
Date: Tue, 18 Nov 2025 09:24:48 +0000
Message-ID: <24379fec72875ef8de719c148aa0be1f7645798c.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-4-nishit.sharma@intel.com>
 <63c6659ae13e5d46c9ed65dbdc9cfbed1d26c363.camel@intel.com>
 <3f2239f2-1608-4343-808e-3acd60cd7545@intel.com>
In-Reply-To: <3f2239f2-1608-4343-808e-3acd60cd7545@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM3PPF818092190:EE_
x-ms-office365-filtering-correlation-id: 784ca8a8-4002-40a6-9a6a-08de2684523c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?cXo4eG8xTklSOVRMU1FGbVlmNFlHZXFnY1hOcTc3RnZWL3h0TkQybTdZNStr?=
 =?utf-8?B?aGIxcHFnUHJjMnp3djdJZkZPczZ5STJYVjRhU2wwdmZhZTJWNXdxVHIyVk96?=
 =?utf-8?B?K2FRSVhNWk42Titubmlad0svMTM4VEVvOEVtTVFzUWJoQ2IxNmMwVCt3Ylov?=
 =?utf-8?B?VktmYVE1U2V6UWZsTzh1UXNVREhOYXVOTnZYTHliSVp3b0hzcEIvZ1VEZWNP?=
 =?utf-8?B?OHNIZ3h4cDQvSWFBSkZ4R2phdVd1bXkxVnZsSUVjM1ErOGR5N3FJcVpKaG5l?=
 =?utf-8?B?eDlKNDZyNW82SFhBUXNvS2R1YnZGMTIzWnMrdXhsMTF3ZlFMM0MyTGhXTWlh?=
 =?utf-8?B?eTJ2Y1lvWFdPdjhKTlNnQ05MQW8wYVkyRks4TUpsc2ovY3N0L3hwczhQdElq?=
 =?utf-8?B?Si9xb2pXUzdaNm1tV3NOdVZmc3lvQU9DMWY4L2kvRnN0RHFpVmpwcThDS3px?=
 =?utf-8?B?RmFyVUk1Q1VQcWRUL2l0VW5hWGlBTTlvVWs3czV0aVZKRWdKWTI2eTEwb0Zh?=
 =?utf-8?B?b251NTN0NUhjQ2x3SGIwV1o1UHBYa0szN21SSkFaVjdSY2RtQzdpVG1oZitQ?=
 =?utf-8?B?a2tDK21OOU5SYUVqaWVzU1QrN1BJWHZOd2xGdnBHaGVQVHNQcXZSRE11dkNK?=
 =?utf-8?B?dGZpMEFhODV3SGF3NVc0MzUxcmtINWorYmRrU0xtMGtTYWMrd2ZVTytPeFZx?=
 =?utf-8?B?OHBNVnlwNmpvLytJSzcvMXYrQTh1V3ZKeXlKd3JtWVN6Vit6RlIzdVFIM2tk?=
 =?utf-8?B?aXZaYVJScmhZbUZYelJjdG5zajlIbEN3N2hHdDh1bHhubXFrV0VwMURqaTlY?=
 =?utf-8?B?NEdaM1pnNlhMa2F0emplN01TYjg4K2FiK2lOWHJxeEFBL05OTVJXcDc5VG41?=
 =?utf-8?B?a0tNdWtGeFJHaHhwTjFjY3FpRk5MQ2lYdVVLbEdFeHVIeXNzeENBZ3l2Sms3?=
 =?utf-8?B?Rk8ybG12bmRybm5WRzZjVHN2MjljendKUk5yd3BCZjZDZ2ZxSkZNZ294WU9K?=
 =?utf-8?B?WldidWpvdWNrS1AvdEdFRGlwNjkwaS91YlVTZFdLQVI1QithWFUreE01NGM5?=
 =?utf-8?B?Ykg0WXJzL0xZOGg1eVQvQkY3L1g1aFU5VFUyN2tVVzhNREpLSE1YeWQ2NDZK?=
 =?utf-8?B?dnltaGdLTnVlTjk3b0lnTU5MNnR2L0VIbFlsTExDd0owamxYYVhzTGYwVTJD?=
 =?utf-8?B?NDhFS0dCdlMvSS9FbGRyR2tUejRhYVpuVkhBTEZBT0JGZ1ROSllmdGtqK2M4?=
 =?utf-8?B?QnpjWnI4UFdhb3lIbnMrckt2d1RQR2hTWVNrTWdjcTJFTlBRZFRaQi9rZFRr?=
 =?utf-8?B?Z2dDTmFUZkV0TW9wa2p4V1hxNjY1U0pWVEhacTZVOTJ6dC9yN3ZRNEx6cW1U?=
 =?utf-8?B?TkswTW9kY0xxZnFQanNvYjgxZk1yYUZseTB2d0pmZHJnbjlnRjhoQ24vaEpa?=
 =?utf-8?B?WUtmVDcxcVNZWVlFSHo4UEFIRHV2c3gxN2k0bXhuTlBmRG01SU1ZQU04TXFS?=
 =?utf-8?B?OWh1K21DRWNnV3YzdXhXcHBxL1hKcGk1LzllWGNzSEd5N2V5cHRweWNrMDFF?=
 =?utf-8?B?MS9YQzdMdlUvNTZKSi90U2JScmc3WGczYzJkZ2ZHdFNCdkhZa2YrTGlFdHRp?=
 =?utf-8?B?V2ZYSW5Lb0tHWDl5cDZhQ1FpMDAyZjhiUlYzRUdsNGl0UlVNRTBDUERVdjFm?=
 =?utf-8?B?cHlYRkpkWnFVbVQ4THl3RmdUbnliSTY0SjZSNzQrRTNtcGEycHlnSlh0QlBH?=
 =?utf-8?B?UEh5NW9wSXh1Mm5UZHhlWEVVU2FVdEt3dklyam1qdllTTUNkcnBCYXBKbVZ3?=
 =?utf-8?B?UzFERUpTZTNra3pSZE12dnhubTIwQktkN0RmZzQ0bmcra2QvYmNKU0t3RHhI?=
 =?utf-8?B?WHI0eE9qYTRwOHFpTDl3VFROc21NQVR1Nm9NMkJaMjV4UVFxSDJna0J3YWdv?=
 =?utf-8?B?UFM1NXE2RGcwS2tzTUUraGJuY2ltTm9LQmNlbmw4cE1Lb1pFR3piaVpvUkpI?=
 =?utf-8?B?eXh0OXU1U05TdXJ0QjlpMEFRbDg4NG13TkhQQklxSDh6NUdaRE0vaTd2Q2FF?=
 =?utf-8?Q?pgJ+BM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1hOY3RaZmg5NWlMVFFxdnorRXdsMFkrUHlGam9WWloxYmtGck52dGpYYXl5?=
 =?utf-8?B?TlYvNjc0emYwajFTQTQ0Unhsdm8yQTg4YTg2OGhJYm9jeHFtbUJ3eXdRbUxO?=
 =?utf-8?B?clhNSFZHVE1jMm5uTk5NVW9oekhpQjBHOC9USS9aYmVxMUFGT09ub1o3aENH?=
 =?utf-8?B?NXZTZzFiUUMyVnpDdFVxL2pBeUY3RTcrRFpBanUzL0EzS0JtNWMzb1pTU1Ft?=
 =?utf-8?B?ZnFTNE5ObERSS2FmcVJzRkZYSEJZRythaE9heUJTc0VpMzliN3QxeTNVS3Vk?=
 =?utf-8?B?eU5zSllLcnFyRjFTT2xjK0pzZ0VmN2FCcWV0a3VjNEdra3NpbDErWkE1UFMr?=
 =?utf-8?B?cHpBM3ZFajZzRy9LUUVqTkYrSEdsM0tuQ2VrLzdBK3o3a0lrcS9zdDVIMVI5?=
 =?utf-8?B?cXNDTHl3VlIzTktLdGJDbDJwb25VYXVVN3AvSE40MjlnZnRvSjhycmVvMlF2?=
 =?utf-8?B?Rm5qZzhJU1gxQWN0ZHdWcjNTNm1uWVNSVGJOUXRVV0ZEV0dkR28wNnpQL0Zw?=
 =?utf-8?B?YmRJU040RUNHczc0YTB2aWIya2ZoTmdVZm1PYlh3a1BJM3N0bGFBK1BPZEYr?=
 =?utf-8?B?NlpubmpwV2VNQjhoQUZsQTFQOWxMeGpGVlk0NEI3TDdpTm5iYnV2b2QyYmZ5?=
 =?utf-8?B?ZUV0Q3NkT05oQ2FnVzA5aE1QYURseitXVk9xLzB6RWlYTDRJVThvbWdCZWpr?=
 =?utf-8?B?Y3UzTkpWaTR0czhVN1pjM1pEa21MNzNIMitPVmZBbkY0a0ticHk3cGZaSUVO?=
 =?utf-8?B?VFZkeXgyVWdoSjg0d281MXRqREhUbklaQWR5Wk5FcmVZYU9YUjV1OXZURmJz?=
 =?utf-8?B?TW1XTjBGRzlOUW5EcnQ4d3BlZEVFbXo1WWEyMHZjeXJPcmwvQlp4VE1TMzFI?=
 =?utf-8?B?dVNFekswOTRpbDFBQ2xtYVhuNzNFSGJWcXVlQVlGai9Kd1doMEVwRmJ5OWk2?=
 =?utf-8?B?MW5Va3dkTTNOc1JQdjVlZGhsTVNpcTdscEdiZlc2Qi9vNk9wSHJLWmQrZ3BB?=
 =?utf-8?B?Sit2OEFvRVZWczB4dDV4bzI3S2Z6eS9VcG9GbCtvNDNUM1JSQzJ2VW0zTkFp?=
 =?utf-8?B?ZTU1SjhZdkZvS3V4N0prdVV6dmFNWWxpVktTQjVETlB1Y3p0d2dwS0tHb1Mx?=
 =?utf-8?B?UUZzcTg4UWlUR01zRWpMRGk2dm5kaW11Y2lYRGo0Ym1Ka2cvM0szUElsZWdE?=
 =?utf-8?B?R05La1c2c0kvY3BUVnNCbkZOSU1RaUdOVmNmKzQzNmMxUHlPaWpOb0txbmMr?=
 =?utf-8?B?ZmRmVzlxTEJaL012akxFUnhoeG1KRlB5b0NjSTFuQWw4dU0yQzVkVmFaVUJQ?=
 =?utf-8?B?ckR2L2YyQUsxZDlZK3hBUTMyRVhLTU5mQmFwbTU0SGxCeE9jRHNlTjNaRFln?=
 =?utf-8?B?ZU9sUlQzWU0yNEloTGdJYitQMzBsRkUxenN6b0ZTZlR1Skl3cWFEalJuTWN5?=
 =?utf-8?B?R1VQV3dtL3VRUFNiS2dhdmllZWNhNEhKRE01M0dOZTBQS3FEVFpHSFJMQTNE?=
 =?utf-8?B?Y1N5K1dWWUJRQ1JmT1o3USs1YzRqN1AybU4wN3RMSDloMWVSTnBrVzlxcWFK?=
 =?utf-8?B?OHhKTFg1RDFpWkovODVWYUVYQXdYZ0NhVkVnM1ZKRjlUTDNrUlhuZFRqK1dL?=
 =?utf-8?B?elNGNmlTczlyc1NxWXkzKzdPZjdKYkNiQ1FYdEJ0a0xpc1VZR2paM0JTZ1pq?=
 =?utf-8?B?RkxmR29aVzh1QlFJd2QzQ285cEdRNUNCMjBvY240bFM4RGU3UytJOWNLU0NX?=
 =?utf-8?B?RllWUDlhTFQrSDdHTnNKSzVZWW1yZUJpNUE1VUxsVWE0M0lzK2JOdW90bElJ?=
 =?utf-8?B?RXlsNGt2TXBlSi9FSlhUN2s3ZGNmdGwvUlVXUXpHRGR2alkvNjVVY1paWW4x?=
 =?utf-8?B?QktadUozMHlKNzRjZmxxYWdzT3pRZTk3R0ljQk5VODBnVnFvL2RWejRyclZC?=
 =?utf-8?B?TStpSUQvS2hkSkZTK1J5bVhnUWpMSWxNVm9SNXl3Sk8xNDJCNDBzQ3FuclpW?=
 =?utf-8?B?a1NuUmNKSlpwNWlxSFhIQ251N3ZmQm5iSnlzSWJSWXAzRFVPcHFMc3lTSzQx?=
 =?utf-8?B?eHpsY1BGM3RNUjRBbWNxTEtUS0l3V0dFLzBkL0l6d2t5bTRzUTE0elA4WXZG?=
 =?utf-8?B?bTFNbWtQcm0xcXgyZWZsREowRU8yM0JidXh6SnJ1cXVkanN5a0cyVVRuNGNG?=
 =?utf-8?Q?ycZjkHTD5XVJ/UrxNviCmln1bKYb3BOVFNjRxjhgjEYn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A800A44ECD491346B0D248D71EAA7CC9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784ca8a8-4002-40a6-9a6a-08de2684523c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 09:24:48.9672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B8GJDhp/9a7q5S7lQlEPJhpTSJ+j9caQyjt3yWwrfV51ouXcONHyajgXSr8rZR5hcWlvlABjO5BNI9ViZqZEvgwuHIJjEyhSycVwbGtm1nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF818092190
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

T24gTW9uLCAyMDI1LTExLTE3IGF0IDIxOjE5ICswNTMwLCBTaGFybWEsIE5pc2hpdCB3cm90ZToN
Cj4gPiANCj4gPiBTbyB3ZSBoYXZlIGNyb3NzLWdwdS1tZW0tYWNjZXNzLSVzIHdoZXJlICVzIGNh
biB0YWtlICJiYXNpYyIgYW5kDQo+ID4gInByZWZldGNoIj8NCj4gVGhvc2UgYWxyZWFkeSBkZWZp
bmVkIHRlc3RzIGFyZSBwYXJ0IG9mIHN0cnVjdCBzZWN0aW9uIHt9LiBMZXQgbWUNCj4gd29yayAN
Cj4gb24gdGhpcyBhbmQgdXBkYXRlLg0KDQpTbyBpZiB5b3UgZW5kIHVwIHdpdGggYmFzZS10ZXN0
IHdpdGggdmFyaWFudHMsIHRoZW4gcGVyaGFwcyB3ZSBjb3VsZA0KYWRkIHRoZSBjb25mbGljdGlu
ZyBtYWR2aXNlcyBhcyB2YXJpYW50cyBhcyB3ZWxsLCBpbmNyZWFzaW5nIHRoZQ0KY292ZXJhZ2U/
DQoNClRoYW5rcywNClRob21hcw0KDQoNCj4gPiANCj4gPiANCj4gPiA+ICsJfQ0KPiA+ID4gKw0K
PiA+ID4gKwlpZ3RfZml4dHVyZSB7DQo+ID4gPiArCQlpbnQgY250Ow0KPiA+ID4gKw0KPiA+ID4g
KwkJZm9yIChjbnQgPSAwOyBjbnQgPCBncHVfY250OyBjbnQrKykNCj4gPiA+ICsJCQlkcm1fY2xv
c2VfZHJpdmVyKGdwdXNbY250XS5mZCk7DQo+ID4gPiArCX0NCj4gPiA+ICt9DQo+ID4gPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQgYi90ZXN0cy9tZXNvbi5idWlsZA0KPiA+ID4gaW5k
ZXggOTczNmYyMzM4Li4xMjA5Zjg0YTQgMTAwNjQ0DQo+ID4gPiAtLS0gYS90ZXN0cy9tZXNvbi5i
dWlsZA0KPiA+ID4gKysrIGIvdGVzdHMvbWVzb24uYnVpbGQNCj4gPiA+IEBAIC0zMTMsNiArMzEz
LDcgQEAgaW50ZWxfeGVfcHJvZ3MgPSBbDQo+ID4gPiDCoMKgCSd4ZV9tZWRpYV9maWxsJywNCj4g
PiA+IMKgwqAJJ3hlX21tYXAnLA0KPiA+ID4gwqDCoAkneGVfbW9kdWxlX2xvYWQnLA0KPiA+ID4g
K8KgwqDCoMKgwqDCoMKgICd4ZV9tdWx0aV9ncHVzdm0nLA0KPiA+ID4gwqDCoAkneGVfbm9leGVj
X3BpbmdfcG9uZycsDQo+ID4gPiDCoMKgCSd4ZV9vYScsDQo+ID4gPiDCoMKgCSd4ZV9wYXQnLA0K
DQo=
