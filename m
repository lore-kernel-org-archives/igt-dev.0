Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15422C282E3
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 09:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA55E10E70E;
	Wed,  5 Mar 2025 09:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5YYGQBF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0F10E70E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741166999; x=1772702999;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=afUsJLDgyXVfmMrb8uFOLNVtmlSAXj11lUqCLrheEKY=;
 b=A5YYGQBF4zXoVjCBPiXs8f22CJUip3idbHF526bANkgrs2baW02qyhbn
 yCiaYwyVw3EF1NO/lBkcLnjDL0BEjMB6uYIz5fDEdQNbojxZAJhUmUu8q
 CP+NvscTVwaRMdv2PW756uN+MWTo5+2cLL98P3J4KPK9KgMVy70IUeIeO
 4kpsVU3BVYYg6Qj0x/GHYMMr4/fDUUjYNZiCYRWgNjOPZDjalrXUJDek1
 qtIkEFBGv3XaomIOQFa0M4D6wqWTCYU1zh97f8IHR2ww6l0uLcPdJ9BHW
 4ukNJ1X+0zvxer5bRW5sIgdhy+9fAAAVGgnrBQzfX30H+rMEwTOrNE/h7 A==;
X-CSE-ConnectionGUID: u1/M3H94RMGOxHq8uNI/BA==
X-CSE-MsgGUID: H0QptEy+QA289k0q9ri5kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42009522"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42009522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:29:59 -0800
X-CSE-ConnectionGUID: wHQjzAi/RcqH8xcbykiz2w==
X-CSE-MsgGUID: ZJFBvqCEQI+7Jlz1yGg03g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123234955"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:29:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 01:29:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 01:29:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 01:29:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnwmuCPN/A7+2QNHjoxKw5Ot3mv2qJFW7Im4DjFe/LiyhLLUuW3obB711rXIX7/ihwvakev6RoEjFTdcjm/kRZ1xSNxOMKKb6am0JDusLb4xN0qqq/17fS45a5COitDD7Xqhl9qnCQ1nILgtnepAOPOkRJy+GRfyv57RKx4X4/CL0DQPBnMCVp1Ff/6YWw+RPEKo0AEhiWu99bCFJUexrI47XA8aZ8s+WK878VOwsj6JoTRgAEO8HXTGGjWU+vvwsxYCcZqqbwNHKb6412OcYCh+fMPRbzUHs5GLjiNwDhUkxE/S0NtQgikCCIw2UiycAzca3bPTb7sFPek2LCW1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGlR2YbMUfb18M+5RkuZCjWUWu4sCf1HynNRN4clP6A=;
 b=EQ0V7t+qkcIN+jMEdcZIp7TStOf8615H8n/dmy1DR1q7a636F1Yqe7a/p3gaIhWgZ/OF+grtNnBzDvRvS/xoPDotqOAxqo0Q7P+YpHIA1/a0/7RgTJVKzAQWcz7EYnnERxX7Da9xeFGcA2TTllcfBiqV8AHD9VKNK3p7+bHagX6z/ZNNM+5ZbpCgmEgE03BjpLHSdEQXzB/G2ErAveIr8pesonEGlMrUwfRJPzIyKJZSMRhYtkvBAKpI8fJ9Sprpi48c0R8Qwlm1MlV0YR+gvQnSxSpqbb+2+WfTC5xMv/Hm2ZhcCFWz5628Y6Ngcog7lQ6RjqquMbpIV1cuNif6/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 09:29:28 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 09:29:27 +0000
Message-ID: <9b6d0e75-5754-4389-89c5-d6062bd530ac@intel.com>
Date: Wed, 5 Mar 2025 14:59:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_multiple: Add dual display subtest
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20250219061224.116374-1-karthik.b.s@intel.com>
 <DM4PR11MB6312283D0336DDB9BD79403790C02@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB6312283D0336DDB9BD79403790C02@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CO1PR11MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ae6ec6-2084-42c5-e163-08dd5bc83949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2lheEZPb0U0cVkvYnhwc2l5YkVwMG00Q1Y2NzZvaVU3Snd0R3BiTzVtT25p?=
 =?utf-8?B?bWhuY1dwSWNrdzVsMlpwcVZ0VTNxZkNuZzlYMkxVQVJtY1hJOTBBbHB6eERI?=
 =?utf-8?B?Kzc5MXJHM0NmN2QvbEl1NmEwNTFEZm5VdDUzOGtNd25CK2FsSE1CVFBVUzNU?=
 =?utf-8?B?cU96MDZCNkpRN0U3RFJGRmVVZkpYOUw0czl6WkNJbEdWK1pwMEI0NXBhVEZQ?=
 =?utf-8?B?blpPUHNHQ1Y4SjZ6ajlLZGNCRkU5Q1MzK3M1TEZFZ1ZjUTkxbDkxZWNJZUt2?=
 =?utf-8?B?OU5KenlTZUMrSGxoa3RmSmhPZGtXbnJFaHBFRGpNMTdKYlhKekw1Rm5xaWRh?=
 =?utf-8?B?c0ptTHRPaCs2a0pXRjN0U1pqSnp2NkU2T1ovSFczb2hSLy9oSHhoSE1jVGU5?=
 =?utf-8?B?eWN0MFlibXk5R2dMaEl2ZmNPcEFrejFsTm9ZNUlTTVptQzJ3ZVNpYm93UVNz?=
 =?utf-8?B?TzZ6Y2lISXNZZS8yVyswU2EzeW5hQlQrNzN3QmlwTEFDamQyZmkvTjBtWnpP?=
 =?utf-8?B?c3BWYUdNUVJsQnNlM1Z2RjdaeHNlSlVkS2hpNTA2bE1iOGJRT1Q5dHFlSTcv?=
 =?utf-8?B?WDR0TDlhU21DQWxaRmFBUUkyWVdDRU9yVnd5VExpd0R4UWkvNWlCRzBYM0tE?=
 =?utf-8?B?WHd4Q3J6Rlk3UVAvQTNqbmE3cUd4cVlZVWovTnJCaWxPWXJpRDVPc01HWkdz?=
 =?utf-8?B?NXNhREVnTEhldFZaSk4yaklvVEtCZHM1VVc0S0dxL25LM3NXdDVXa3Eyc2pr?=
 =?utf-8?B?dURFbCtpZDRkODhOSHZjVE1CV3E4WGhHZFc0RXp4VWM1QmdrUGpCakd0ektQ?=
 =?utf-8?B?d0MvN2RwbTZMdllGRy8rZnVhTVF0UmVmdWRvQkNPTmdYQWJvQkJrbHhkd09Q?=
 =?utf-8?B?R3F5YVF6V29QUWI5cDZlMmFEYVdWMUhSZ0p1dy9VNTNoL05qMFZ6bThIazQy?=
 =?utf-8?B?V2NKWUYydmNlV1ptY3Q2aXBUS3kxZW85OTBUYlJwZ1RzTVZBSWtFT0FkeDFu?=
 =?utf-8?B?R3pwakhETGVFVDJoWEhmMjkzUEh5Z3U1dWVVNUw2bSswS0VldDNzbWFoZVpu?=
 =?utf-8?B?WEIwL09nckc5YWhIZmhlUWJ5WG1XRjFRcTRrSFVJWUFhL1lHUHdpQUJPR0JE?=
 =?utf-8?B?cFdPZFdZZXNIajJucXhOL00wVGpoQ1J2dnVoUlUvR0R1K2RjV1FOTnVGVE5G?=
 =?utf-8?B?ZVFHT3BnY250S0JRQWlDNXovdTJmZ3puQk9uUmdmWTRJSW0vWkd1ekN5M0Fj?=
 =?utf-8?B?UVhpWnkzb1hpYUs1UGQ2MmQ0SGxhSEpBTFd6cGdtVml1TFh1LzhwL3NjNUM3?=
 =?utf-8?B?aEptWURVWkQ5anBWb2V4Z3RFV2NmRHgyMEZrVkpkeFpqYjZ0c3UwYmdWUHpz?=
 =?utf-8?B?QUlucHc5QWZBYXhpK3MyTVR3QUhPSnVva0RUUU1SK25ZdGpRblpDZjBWSDJ3?=
 =?utf-8?B?UnhNSXhRcW10Qm9JYis5cjhnQmZxUWVVRm1LekF6cGVpY1FvQ3RJb2NxOWdY?=
 =?utf-8?B?cnVHZU51cHNtTFNFR25nOWJFeVg1RE84SHp1TnNwU0llQ3d5TTMramw5Uk9v?=
 =?utf-8?B?VlVtcEJndkJ2Um41ODl6SDRNWWxFckJpeGtQOWtMa0x5a1cwL25GWVJnUFNG?=
 =?utf-8?B?YmhsNmVXUkdZdTdNNHJVZzRVdjNrMkY0eHkzZFRjRFZDK2pnNUZiZ01XcWZX?=
 =?utf-8?B?cmN6SW9zL2w4SFcvVjFac0EzTEozenJJWVMwRCtPOW1tQnp1ZlpuOHdvN1R1?=
 =?utf-8?B?alZoQlFSeTA0TGhtUUFQSHEzOEFlS1pXbitUbmU5NmZ2RG5ZTm10K3l5NWUx?=
 =?utf-8?B?SGZ0VjB2Z1FyZ0dJTDdIMnhFVVYyRUtiR3UrS3JlTnc5am1uZUZzbno4N2Rs?=
 =?utf-8?Q?4mWR2RlnElCN/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGNsNk9RaUtiSWFLUFJHWUVyOEd2QnoxQlFKRHlud3c5YzNXZVE0Y1I0Y0gz?=
 =?utf-8?B?dW1TV2NDTUZ6WXB2OVFJQnhWL2o2NGVydGFFSVg5K0JDYStkTzdqZzZpRFpq?=
 =?utf-8?B?NUFMYmFBZlpXMmNMQkovaWlaYVJhbXhGMUZpNUVuam10Y1ZWWXN4cmduYkUv?=
 =?utf-8?B?Q2tmSEtPRUlITS9oYmxKUXI1OTdNcFVMSUNnSUUvTklGN0xlRk5JeW40Ty8v?=
 =?utf-8?B?MitwWVNyZWtOdGIzdUg5K2hna00xOEo0T0xmT0t6ejFaZkhweUhIR1VJSStK?=
 =?utf-8?B?czNjOHBRck5qNm12TC9Na1RKMmFzNFp4eEtLUXJvNjBzVFRjVlZrTGdvVUNM?=
 =?utf-8?B?aWRDbEN1dk1BOVVjYndpQVIzeEV6YS8wdEYzYkhiU2tJYlhmcTlQeVRjbmFL?=
 =?utf-8?B?TWZjcWlnYnJNZXdjRXJCdzhreHZ5QllvaFdaZElsZDlmUEJ1c01EKzVMcjJT?=
 =?utf-8?B?MGhCN2ZuQXJGUnlqVTNqMFNtU2EvTXg4Z0RaWTBnNEhpUnpwUzlCdjlPZW9l?=
 =?utf-8?B?YVF5cDlBdVBIekZ2eE1YTzVhak5DQjNPV0hnZkhVQ0NFbFFFMTlNVkNXaVpQ?=
 =?utf-8?B?WFpRMklTWGtPZkNsZ0kxSW5BaStxeU4rdm5hM3k4OHJ4dGRoeHJDMFp3U3Yw?=
 =?utf-8?B?Y0lCQlI4RVd0STV1aVBQbHZ2K0J0RzhSQU5pMTM0TkZvaEZXMVZxRlBZd25F?=
 =?utf-8?B?V1o1bmtkUFJneDVMdXp5eU9EWlh2dEx4ZmtnTStBTkNsZm50T0lQbFg3NUhD?=
 =?utf-8?B?UUFaR0tONGUzcUk5M1B5NlVYdUQ4c3g2c2JTcDRVSjFjaSsrYXhjQlh5TzNG?=
 =?utf-8?B?VGZ6TS9pcHBucjVVQ1BRd2crc0F4OFY0YklRVXY3MElzYTRFM3hhbFVkdWty?=
 =?utf-8?B?REhTbEkxb1lPSkNPR0h5TXhwVjhQdDRZdUlTcHlJdjFhNEdwa2wzN3IvVmx3?=
 =?utf-8?B?WGpHQy9uaEFkaCt3VlhJSnFQbkxFT3p6bEwyV0JPWSsxclQvOE54WUNSa3RO?=
 =?utf-8?B?Yjk5SU4vYkdkd0I1cnphajRxN3A4RjJQRUpxeUtkVkdCcC9tejFSdWVZSGR2?=
 =?utf-8?B?NzRwQ0tLS2EwcSt6emlXL1FVY053LzBtYVZTc251dzV5MTBmYkZxdTJqMTJD?=
 =?utf-8?B?TnlIMndVM1hpdWk3UEFOU3NhODB6K3p3SlNJa1dSZkE5RDN4VWxUejVodDd4?=
 =?utf-8?B?S1VYYUc5VytWaFF5SlljeldXQUw0c09JbE1hTVJ6NHowNmhxTTZkRU5OY1VL?=
 =?utf-8?B?L1o3cUpYN0JKQ3EzTzNHeFg5ZGd0T0RQVGRqamV3bHVDVzdoZG50bG8vVVZJ?=
 =?utf-8?B?REphcUlQQURDWmRGS0duanZzSXRUNG1MTVhUNFFkcERoN2YxajR4NFBOWGd1?=
 =?utf-8?B?TWdvWFlmZG0zUS9XZnlVRFA4QjhFWWVyMCtRa01FU0laSUlFSmdUVUxJckRn?=
 =?utf-8?B?YUNneHZzVUV2ZGhDc1pvRmR3WHZrREY3SGxQL2lLQXBrNFNHbzFLQ3BLMUpJ?=
 =?utf-8?B?OXd4MUYreGZEZWIzbHdSWkJnbVVuRlhtb0N0blVCY083OW1INW9kN2g1cjFC?=
 =?utf-8?B?TzEzOUl4dGhRcjBPUlpQenVjOW9WR09EQlFHSjlnRmkzL2pwOEVqdzhUSkZV?=
 =?utf-8?B?NklnU0Q3YTNWcm9qYitNODdOTzlzYXY2KzRjS1kxb09NbnZjQ0Y1UnMwSnM0?=
 =?utf-8?B?d3BVRUpMeGIxNTZLaWdqK21FZjhwVDMwOTFJWGx1U1l6UmR0NDlQRytwQzhq?=
 =?utf-8?B?MVM0THc4c0Juc1Y2NGhhVjJRWDUvZ25Yck8zc0lyY0tQMG53bStMcllSS0F5?=
 =?utf-8?B?QWZvWW1TSzkzUTJLeVpYaU1sdUlCZ3lITmdJVVdoN0t2ek1rOXVaRHdXZGlW?=
 =?utf-8?B?d21KQ2ZJUEE1Ym5iN1JsQk1RQmM4cW1sUzlBV0NGWDYxT0kzZGFLOHN6dHlz?=
 =?utf-8?B?RXgzRnluUHRSNnZIQVhqdVhtUEYxK21QKzFZRjZpUEMwQnNHSU9ZdlZRMFdD?=
 =?utf-8?B?cnl5WGtVTitHV2d4U0RkQUo3Q3JTME45eW9IZFN5Z0k2aFdmT2phVG8wTzVE?=
 =?utf-8?B?MHFsVm5KKzgvZU5EYUF1WDFqcFZaVXpjSDh3L08wL1B2Ulh2YUNnakRkS0JN?=
 =?utf-8?Q?tfJepYK7VzgA/SW2pX6GcnEUU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ae6ec6-2084-42c5-e163-08dd5bc83949
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:29:27.3084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOllaGA14Y7d/Z0Zydj4z0x17obzFirliDq1To9R51i3FcMaeORK4qcVazGtX+rUMTJfYQVl4PMcQk4NC1We6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
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

Hi,

On 2/24/2025 11:54 AM, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthik B S
>> Sent: Wednesday, February 19, 2025 11:42 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t] tests/kms_plane_multiple: Add dual display subtest
>>
>> Add 2x subtest to verify MPO use case simulataneously on two display
>> configurations.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_plane_multiple.c | 216 ++++++++++++++++++++++++++++---------
>>   1 file changed, 167 insertions(+), 49 deletions(-)
>>
>> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c index
>> b7922c357..993162640 100644
>> --- a/tests/kms_plane_multiple.c
>> +++ b/tests/kms_plane_multiple.c
>> @@ -58,6 +58,10 @@
>>    * @x:           x-tiling
>>    * @y:           y-tiling
>>    * @yf:          yf-tiling
>> + *
>> + * SUBTEST: 2x
>> + * Description: Check that the kernel handles atomic updates of multiple planes
>> + *		simultaneously committed on 2 displays.
>>    */
>>
>>   IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes."); @@
>> -76,10 +80,10 @@ typedef struct {  typedef struct {
>>   	int drm_fd;
>>   	igt_display_t display;
>> -	igt_crc_t ref_crc;
>> -	igt_pipe_crc_t *pipe_crc;
>> -	igt_plane_t **plane;
>> -	struct igt_fb *fb;
>> +	igt_crc_t ref_crc1, ref_crc2;
>> +	igt_pipe_crc_t *pipe_crc1, *pipe_crc2;
>> +	igt_plane_t **plane1, **plane2;
>> +	struct igt_fb *fb1, *fb2;
>>   } data_t;
>>
>>   /* Command line parameters. */
>> @@ -98,14 +102,14 @@ struct {
>>    */
>>   static void test_init(data_t *data, enum pipe pipe, int n_planes)  {
>> -	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
>> +	data->pipe_crc1 = igt_pipe_crc_new(data->drm_fd, pipe,
>>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>>
>> -	data->plane = calloc(n_planes, sizeof(*data->plane));
>> -	igt_assert_f(data->plane != NULL, "Failed to allocate memory for
>> planes\n");
>> +	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
>> +	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for
>> +planes\n");
>>
>> -	data->fb = calloc(n_planes, sizeof(struct igt_fb));
>> -	igt_assert_f(data->fb != NULL, "Failed to allocate memory for FBs\n");
>> +	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
>> +	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for
>> +FBs\n");
>>   }
>>
>>   static void test_fini(data_t *data, igt_output_t *output, int n_planes) @@ -
>> 113,21 +117,21 @@ static void test_fini(data_t *data, igt_output_t *output, int
>> n_planes)
>>   	/* reset the constraint on the pipe */
>>   	igt_output_set_pipe(output, PIPE_ANY);
>>
>> -	igt_pipe_crc_free(data->pipe_crc);
>> -	data->pipe_crc = NULL;
>> +	igt_pipe_crc_free(data->pipe_crc1);
>> +	data->pipe_crc1 = NULL;
>>
>> -	free(data->plane);
>> -	data->plane = NULL;
>> +	free(data->plane1);
>> +	data->plane1 = NULL;
>>
>> -	free(data->fb);
>> -	data->fb = NULL;
>> +	free(data->fb1);
>> +	data->fb1 = NULL;
>>
>>   	igt_display_reset(&data->display);
>>   }
>>
>>   static void
>> -get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
>> -	      color_t *color, uint64_t modifier)
>> +get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
>> igt_pipe_crc_t *pipe_crc,
>> +	      color_t *color, igt_plane_t **plane, uint64_t modifier,
>> +igt_crc_t *ref_crc)
>>   {
>>   	drmModeModeInfo *mode;
>>   	igt_plane_t *primary;
>> @@ -137,7 +141,7 @@ get_reference_crc(data_t *data, igt_output_t *output,
>> enum pipe pipe,
>>   	igt_output_set_pipe(output, pipe);
>>
>>   	primary = igt_output_get_plane_type(output,
>> DRM_PLANE_TYPE_PRIMARY);
>> -	data->plane[primary->index] = primary;
>> +	plane[primary->index] = primary;
>>
>>   	mode = igt_output_get_mode(output);
>>
>> @@ -145,21 +149,21 @@ get_reference_crc(data_t *data, igt_output_t *output,
>> enum pipe pipe,
>>   			    DRM_FORMAT_XRGB8888,
>>   			    modifier,
>>   			    color->red, color->green, color->blue,
>> -			    &data->fb[primary->index]);
>> +			    &data->fb1[primary->index]);
>>
>> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
>>> index]);
>> +	igt_plane_set_fb(plane[primary->index], &data->fb1[primary->index]);
>>
>>   	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>   	igt_skip_on(ret != 0);
>>
>> -	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
>> +	igt_pipe_crc_collect_crc(pipe_crc, ref_crc);
>>   }
>>
>>   static void
>>   create_fb_for_mode_position(data_t *data, igt_output_t *output,
>> drmModeModeInfo *mode,
>>   			    color_t *color, int *rect_x, int *rect_y,
>>   			    int *rect_w, int *rect_h, uint64_t modifier,
>> -			    int max_planes)
>> +			    int max_planes, igt_fb_t *fb)
>>   {
>>   	unsigned int fb_id;
>>   	cairo_t *cr;
>> @@ -171,16 +175,16 @@ create_fb_for_mode_position(data_t *data,
>> igt_output_t *output, drmModeModeInfo
>>   			      mode->hdisplay, mode->vdisplay,
>>   			      DRM_FORMAT_XRGB8888,
>>   			      modifier,
>> -			      &data->fb[primary->index]);
>> +			      &fb[primary->index]);
>>   	igt_assert(fb_id);
>>
>> -	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[primary->index]);
>> +	cr = igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
>>   	igt_paint_color(cr, rect_x[0], rect_y[0],
>>   			mode->hdisplay, mode->vdisplay,
>>   			color->red, color->green, color->blue);
>>
>>   	for (int i = 0; i < max_planes; i++) {
>> -		if (data->plane[i]->type == DRM_PLANE_TYPE_PRIMARY)
>> +		if (data->plane1[i]->type == DRM_PLANE_TYPE_PRIMARY)
>>   			continue;
>>   		igt_paint_color(cr, rect_x[i], rect_y[i],
>>   				rect_w[i], rect_h[i], 0.0, 0.0, 0.0); @@ -191,8
>> +195,8 @@ create_fb_for_mode_position(data_t *data, igt_output_t *output,
>> drmModeModeInfo
>>
>>
>>   static void
>> -prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
>> -	       uint64_t modifier, int max_planes, igt_output_t *output)
>> +prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t
>> **plane,
>> +	       uint64_t modifier, int max_planes, igt_output_t *output,
>> +igt_fb_t *fb)
>>   {
>>   	drmModeModeInfo *mode;
>>   	igt_pipe_t *pipe;
>> @@ -252,15 +256,14 @@ prepare_planes(data_t *data, enum pipe pipe_id,
>> color_t *color,
>>   		 * Here is made assumption primary plane will have
>>   		 * index zero.
>>   		 */
>> -		igt_plane_t *plane = igt_output_get_plane(output, suffle[i]);
>>   		uint32_t plane_format;
>>   		uint64_t plane_modifier;
>>
>> -		data->plane[i] = plane;
>> +		plane[i] = igt_output_get_plane(output, suffle[i]);
>>
>> -		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>> +		if (plane[i]->type == DRM_PLANE_TYPE_PRIMARY)
>>   			continue;
>> -		else if (plane->type == DRM_PLANE_TYPE_CURSOR)
>> +		else if (plane[i]->type == DRM_PLANE_TYPE_CURSOR)
>>   			size[i] = SIZE_CURSOR;
>>   		else
>>   			size[i] = SIZE_PLANE;
>> @@ -268,10 +271,10 @@ prepare_planes(data_t *data, enum pipe pipe_id,
>> color_t *color,
>>   		x[i] = rand() % (mode->hdisplay - size[i]);
>>   		y[i] = rand() % (mode->vdisplay - size[i]);
>>
>> -		plane_format = data->plane[i]->type ==
>> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 :
>> DRM_FORMAT_XRGB8888;
>> -		plane_modifier = data->plane[i]->type ==
>> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : modifier;
>> +		plane_format = plane[i]->type == DRM_PLANE_TYPE_CURSOR ?
>> DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
>> +		plane_modifier = plane[i]->type == DRM_PLANE_TYPE_CURSOR
>> ?
>> +DRM_FORMAT_MOD_LINEAR : modifier;
>>
> line length exceeds 100 for the above 2 please fix if possible.

Thank you for the review.

This is a change I just made in the existing line of code and even by 
fixing this I see a lot of other lines still being too long. IMHO, all 
those changes can be made in a separate patch. Would that be fine?

>
>> -		igt_skip_on(!igt_plane_has_format_mod(plane, plane_format,
>> +		igt_skip_on(!igt_plane_has_format_mod(plane[i], plane_format,
>>   						      plane_modifier));
>>
>>   		igt_create_color_fb(data->drm_fd,
>> @@ -279,17 +282,17 @@ prepare_planes(data_t *data, enum pipe pipe_id,
>> color_t *color,
>>   				    plane_format,
>>   				    plane_modifier,
>>   				    color->red, color->green, color->blue,
>> -				    &data->fb[i]);
>> +				    &fb[i]);
>>
>> -		igt_plane_set_position(data->plane[i], x[i], y[i]);
>> -		igt_plane_set_fb(data->plane[i], &data->fb[i]);
>> +		igt_plane_set_position(plane[i], x[i], y[i]);
>> +		igt_plane_set_fb(plane[i], &fb[i]);
>>   	}
>>
>>   	/* primary plane */
>> -	data->plane[primary->index] = primary;
>> +	plane[primary->index] = primary;
>>   	create_fb_for_mode_position(data, output, mode, color, x, y,
>> -				    size, size, modifier, max_planes);
>> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
>>> index]);
>> +				    size, size, modifier, max_planes, &fb[primary-
>>> index]);
>> +	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
>>   	free((void*)x);
>>   	free((void*)y);
>>   	free((void*)size);
>> @@ -335,12 +338,13 @@ test_plane_position_with_output(data_t *data, enum
>> pipe pipe,
>>
>>   	test_init(data, pipe, n_planes);
>>
>> -	get_reference_crc(data, output, pipe, &blue, modifier);
>> +	get_reference_crc(data, output, pipe, data->pipe_crc1, &blue,
>> +			  data->plane1, modifier, &data->ref_crc1);
>>
>>   	/* Find out how many planes are allowed simultaneously */
>>   	do {
>>   		c++;
>> -		prepare_planes(data, pipe, &blue, modifier, c, output);
>> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
>> output,
>> +data->fb1);
>>   		err = igt_display_try_commit2(&data->display,
>> COMMIT_ATOMIC);
>>
>>   		for_each_plane_on_pipe(&data->display, pipe, plane) @@ -
>> 350,7 +354,7 @@ test_plane_position_with_output(data_t *data, enum pipe
>> pipe,
>>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>>   		for (int x = 0; x < c; x++)
>> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
>> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>>   	} while (!err && c < n_planes);
>>
>>   	if (err)
>> @@ -364,14 +368,14 @@ test_plane_position_with_output(data_t *data, enum
>> pipe pipe,
>>   	while (i < iterations || loop_forever) {
>>
>>   		/* randomize planes and set up the holes */
>> -		prepare_planes(data, pipe, &blue, modifier, c, output);
>> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
>> output,
>> +data->fb1);
>>
>>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> -		igt_pipe_crc_start(data->pipe_crc);
>> +		igt_pipe_crc_start(data->pipe_crc1);
>>
>> -		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc,
>> &crc);
>> -		igt_assert_crc_equal(&data->ref_crc, &crc);
>> -		igt_pipe_crc_stop(data->pipe_crc);
>> +		igt_pipe_crc_get_current(data->display.drm_fd, data-
>>> pipe_crc1, &crc);
>> +		igt_assert_crc_equal(&data->ref_crc1, &crc);
>> +		igt_pipe_crc_stop(data->pipe_crc1);
>>
>>   		for_each_plane_on_pipe(&data->display, pipe, plane)
>>   			igt_plane_set_fb(plane, NULL);
>> @@ -380,7 +384,7 @@ test_plane_position_with_output(data_t *data, enum
>> pipe pipe,
>>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>>   		for (int x = 0; x < c; x++)
>> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
>> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>>
>>   		i++;
>>   	}
>> @@ -403,6 +407,108 @@ test_plane_position(data_t *data, enum pipe pipe,
>> igt_output_t *output, uint64_t
>>   					n_planes, modifier);
>>   }
>>
>> +static void test_init_2_display(data_t *data, enum pipe pipe1, enum
>> +pipe pipe2) {
>> +	data->pipe_crc1 = igt_pipe_crc_new(data->drm_fd, pipe1,
>> +					   IGT_PIPE_CRC_SOURCE_AUTO);
>> +	data->pipe_crc2 = igt_pipe_crc_new(data->drm_fd, pipe2,
>> +					   IGT_PIPE_CRC_SOURCE_AUTO);
>> +
>> +	data->plane1 = calloc(2, sizeof(*data->plane1));
>> +	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for
>> +planes\n");
>> +
>> +	data->plane2 = calloc(2, sizeof(*data->plane2));
>> +	igt_assert_f(data->plane2 != NULL, "Failed to allocate memory for
>> +planes\n");
>> +
>> +	data->fb1 = calloc(2, sizeof(struct igt_fb));
>> +	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for
>> +FBs\n");
>> +
>> +	data->fb2 = calloc(2, sizeof(struct igt_fb));
>> +	igt_assert_f(data->fb2 != NULL, "Failed to allocate memory for
>> +FBs\n"); }
>> +
>> +static void test_fini_2_display(data_t *data) {
>> +	igt_pipe_crc_stop(data->pipe_crc1);
>> +	igt_pipe_crc_stop(data->pipe_crc2);
>> +
>> +	igt_display_reset(&data->display);
>> +}
>> +
>> +static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum
>> pipe pipe2,
>> +					  igt_output_t *output1, igt_output_t
>> *output2) {
>> +	color_t blue  = { 0.0f, 0.0f, 1.0f };
>> +	igt_crc_t crc1, crc2;
>> +
>> +	test_init_2_display(data, pipe1, pipe2);
>> +	get_reference_crc(data, output1, pipe1, data->pipe_crc1, &blue,
>> +			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data-
>>> ref_crc1);
>> +	get_reference_crc(data, output2, pipe2, data->pipe_crc2, &blue,
>> +			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data-
>>> ref_crc2);
>> +
>> +	prepare_planes(data, pipe1, &blue, data->plane1,
>> DRM_FORMAT_MOD_LINEAR, 2, output1, data->fb1);
>> +	prepare_planes(data, pipe2, &blue, data->plane2,
>> +DRM_FORMAT_MOD_LINEAR, 2, output2, data->fb2);
> Line exceeds here also.
Will update this.
> Can we target for all formats/modifiers like single display ??

Sure, will update this.

Thanks,
Karthik.B.S
>
>> +
>> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +	igt_pipe_crc_start(data->pipe_crc1);
>> +	igt_pipe_crc_start(data->pipe_crc2);
>> +
>> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1, &crc1);
>> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc2,
>> +&crc2);
>> +
>> +	igt_assert_crc_equal(&data->ref_crc1, &crc1);
>> +	igt_assert_crc_equal(&data->ref_crc2, &crc2); }
>> +
>> +#define for_each_connected_output_local(display, output)		\
>> +	for (int j__ = 0;  assert(igt_can_fail()), j__ < (display)->n_outputs; j__++)
>> 	\
>> +		for_each_if((((output) = &(display)->outputs[j__]), \
>> +			      igt_output_is_connected((output))))
>> +
>> +#define for_each_valid_output_on_pipe_local(display, pipe, output) \
>> +	for_each_connected_output_local((display), (output)) \
>> +		for_each_if(igt_pipe_connector_valid((pipe), (output)))
>> +
>> +static void run_2_display_test(data_t *data) {
>> +	enum pipe pipe1, pipe2;
>> +	igt_output_t *output1, *output2;
>> +	igt_display_t *display = &data->display;
>> +
>> +	igt_display_reset(display);
>> +
>> +	for_each_pipe(display, pipe1) {
>> +		for_each_valid_output_on_pipe(display, pipe1, output1) {
>> +			for_each_pipe(display, pipe2) {
>> +				if (pipe1 == pipe2)
>> +					continue;
>> +
>> +				for_each_valid_output_on_pipe_local(display,
>> pipe2, output2) {
>> +					if (output1 == output2)
>> +						continue;
>> +
>> +					igt_display_reset(display);
>> +
>> +					igt_output_set_pipe(output1, pipe1);
>> +					igt_output_set_pipe(output2, pipe2);
>> +
>> +					if
>> (!intel_pipe_output_combo_valid(display))
>> +						continue;
>> +
>> +					igt_dynamic_f("pipe-%s-%s-pipe-%s-
>> %s",
>> +
>> kmstest_pipe_name(pipe1), output1->name,
>> +
>> kmstest_pipe_name(pipe2), output2->name)
>> +
>> 	test_plane_position_2_display(data, pipe1, pipe2,
>> +
>> output1, output2);
>> +
>> +					test_fini_2_display(data);
>> +				}
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>   static void run_test(data_t *data, uint64_t modifier)  {
>>   	enum pipe pipe;
>> @@ -506,6 +612,18 @@ igt_main_args("", long_options, help_str, opt_handler,
>> NULL)
>>   			run_test(&data, subtests[i].modifier);
>>   	}
>>
>> +	igt_subtest_with_dynamic("2x") {
>> +		int valid_outputs = 0;
>> +		igt_output_t *output;
>> +
>> +		for_each_connected_output(&data.display, output)
>> +			valid_outputs++;
>> +
>> +		igt_require(valid_outputs > 1);
>> +
>> +		run_2_display_test(&data);
>> +	}
>> +
>>   	igt_fixture {
>>   		igt_display_fini(&data.display);
>>   		drm_close_driver(data.drm_fd);
>> --
>> 2.43.0
