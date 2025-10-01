Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE045CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF6310E34D;
	Wed,  1 Oct 2025 11:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDIa5pDB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CD610E34D
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319189; x=1790855189;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=J3c79b4tm2Zm6wu0Tdiho9yAsw0jNuV/GHpQBvsKS4c=;
 b=RDIa5pDB2WhrUZvHltEHTVr/ldxCookacNgvMwBUMK57P69RD3nRluwN
 BOvSbPvCsL4Lj2KGO6uZDOLbWnbUwg3zcFYpFYVTx4Hb2E0mZ6YKi0LgS
 3rs3mesNwzmcc9e2+iDl+yhqSRVwbtHkLEV5bJHfRTqM3eee7XVWzKzfn
 GSEWlffgI+j738BYtbVj0LEFfPTFX8RyfUQXjv2gZnKa+a1xQqDAz7oH6
 yQ5ryHPN5XBTymLA/gtWpXv6FWIcq0aE8+liGs9BcXZKvhBSBJh+06cIc
 q28nbT0G8Dzie7CiQvoPLHxVYESjEDQpEK/9tQQ5ZTR8KRymT2R0AnrUO w==;
X-CSE-ConnectionGUID: nHKE9znKSz2bZpDPbUVung==
X-CSE-MsgGUID: 2bYwSU/AT96KpMYsDfP4jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60626337"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60626337"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:46:29 -0700
X-CSE-ConnectionGUID: zYm5h0B6Q9uhoyToNJhv2g==
X-CSE-MsgGUID: fgq92sPPQ2KNewjaHTu++g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="182793082"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:46:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 04:46:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 04:46:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 04:46:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3m2onfn7tyFBv2VSkS/MFhXcU3lcJabyoIQz+yA9zeiBFqEpVGOK9cu7X+mGT121dnD6rohrwbfme4aKr1xdF/+RDnUelCYNIkxPvcVOLKIua/i7/k5Fbszlu/HoSl2AL172LNN8OMEtNoG1oIRYXJFuFcWBczvihQQa49gYBmRvbX6jkhNyAAY/DfS1Uenvo6VronsSGKCtu/coDTZHGQW40oNLVQ61Uj/6Li6Ormn4TIuJXv/5VfZ23r5QfR/Z8mlCVqUbTnXcno3UV+cMGoJGA/bYCwznsrzqWXI33r07PEmwri6frjjGfmP0e4QOSXqWoqhHoypJzpKNiWoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmTpKpRvwHFYKYq79eszxsyDKK1WfYMIfUbwiZC577g=;
 b=dOlCO7ZBhxcVyjt4OSa5Orlnp9mk8qCDeU+1J/STszktc+JX2X0VlWbWBkS333c6uRRMB/a8qS5j0dkgz8QqW3CETB6RjDptip52hAVrmMwTNy9Lx3CknBEmvgFvFX51I38OMi9kM9YM2YqkYn6Bkr2IIlAcWHM72+YfeDXaKZV573G+Fz+WMuyyis9sg7HCfCwJOo42VPximEhluhLjdfEhIew6diuuXq23sXL7Uy2RT0C5xP+HZ9OdbbeYpHVCAzESlRwn8aOLsX7bLuBsszoZdOWp+KXNLEGrPLGYB4Fa5QVXbrFzXVVwZwZLQQQFqJNs3m5yk5l37sGi0azYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 11:46:25 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 11:46:25 +0000
Message-ID: <521cc99c-a53b-485e-a688-71ca9b90a54b@intel.com>
Date: Wed, 1 Oct 2025 17:16:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] tests/intel/xe_exec_reset: Add
 long-spin-comp-reuse-many-preempt-threads
To: <igt-dev@lists.freedesktop.org>
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-6-matthew.brost@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250923211333.766147-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::12) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|BL3PR11MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: db8c0519-e32f-4f18-45f3-08de00e02694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d25vTGhCK3dWV05ycHEzT25QMXFDdHNIYlpCd3h3aWF4SVhoUEFNS2RBcjZn?=
 =?utf-8?B?UDFnbmsrK2ZTU3RDR3R4QWtuYkVOWWJuYkl4bnZ5bUZ1WFk2ckhsaCt6Sktu?=
 =?utf-8?B?VUJ1UVlhaXZrU2pHYjBvMzh6d1BOTnVKeTRDemFheElqWDZ0WUpGRmhIMzVa?=
 =?utf-8?B?djh5TTByUWt5UUxMZnlHcGF0UFJYakhvVlBwMnRPaG5ZTk9lTGdPbWI5MUNp?=
 =?utf-8?B?SFBrV25WeWJsWDlBbjYyT1FHNkUyekJMenRTR1ZWR1IzenBmK3dQai9ycEI4?=
 =?utf-8?B?RVlqNndHckFDZ2FSRlorbExBMWM3dFQ0Y0d3czlBYUhpSVRWRERPZSsrNnpr?=
 =?utf-8?B?aVpGTDNpdzZXRnk4ZHRSS1FzMGxVdU92czc4UzdmWmVIYWJKbmZzWTVtd1BF?=
 =?utf-8?B?Y2VBdkdvOStEZ2JtSjZFQjB5bzVmQlI2dHgwT0x5QStPaUU4ckxYVnBSSEhT?=
 =?utf-8?B?bjBmMHFFd0FZQjFXWFZPa3lDdCtCZWhXSUlGZlZhclVnZmxGNUcwYm5oUTMr?=
 =?utf-8?B?TERCRkRqMDhSR2d2OFUxOHhZcXdRTTdySVlFTUhWd0ZSVllIQUt2NnovYm1V?=
 =?utf-8?B?VkJXa0o5L2tRMHNuZGFvUldXMFZWb0E4bTdiUG9od2tzb0NGaFM2V0dIS09M?=
 =?utf-8?B?Z1h0bTBsVFNTUUMyUnRqMmMzWmF2c3hweG1Dak5YM2RUd0YyVjNhRXJzM1Fw?=
 =?utf-8?B?a0pJemwzdWc2WlZGUEE2VTBaY0ZCd0NXWGljVzd1eEUrYjFSTC9MYWNNN2I5?=
 =?utf-8?B?Mml6U1kzeEVESnMwdXA3Ulc5bXM5WHVMTmk0MmlrWUhNR1VCeHcrY0ZxWjli?=
 =?utf-8?B?M2xkVG5LbTJscGt3VDZXbERDRU1XWjA1S3IwZGk4aUZqMDU1ei9lbTZBVkEw?=
 =?utf-8?B?U3N6MWRjYmJxWk5NZDFONm4wVzNMUnVCS0U5VVp4UHFXcm43K3pnb0x0Qy9J?=
 =?utf-8?B?R0MxYXBQVnl2cEM3MjVLU2RZUDJjbnFaaHlkNWc4b2hMUndRR204RWhZWTRj?=
 =?utf-8?B?UWQwVjd6elpxZytST0txVXdiSGxTUURCRnNxNy9IVnlFbnJveXNBMWpsd1NR?=
 =?utf-8?B?c05aN084MTF3YkgzWlB4dzlCZzlFQzZNdnoyN0VVbkF5a0tRUld1ZzJPclpV?=
 =?utf-8?B?ZmZjRnZVek5OckE0WnArbXZ6M1BNZGx0NGlJbWV3NFJhWTJBQ0F5NFh4bUt0?=
 =?utf-8?B?eWFwdUpSb002N2JjVmhkWkp2d0Z3MUVXWTc5M3hSbnJnYlMzQ3NLRUI3ZVRo?=
 =?utf-8?B?NlZCWWd4MU1GTktOTGpZQ2Q4emEwN1N1YUg1MTNrY3JoWTRRR2JwK25lS1dT?=
 =?utf-8?B?VnJ0dFl6MVZZVDUzSmdOK2hMVUI3VU1uNTNISVVWL0ordWYyUnZOM0lUZjRP?=
 =?utf-8?B?RFAvUUFGRkFHK2JFeGFWVFNBWlhiaTVSbmpqSTlCa0FYWlZFRmkyOHVaNW8v?=
 =?utf-8?B?RURzdUdLaGR1K05EbCttOHhwKzIwSU9KdUdhT0QvcWlVT1ZYTkZRRGZ3VGIw?=
 =?utf-8?B?V25BVHR1Sy9aV0dLMXpEeWdyQ3FYS0hlMmh3N0hDdjk1alZtZjVMSEdpNjJm?=
 =?utf-8?B?T2U4ZEJtY3p4Nyswc0lEUWZLQ0VvM3YvaXV1ZU01RzVpTHAzMFpIYmdqU1lq?=
 =?utf-8?B?ajM1aC9Ndmo3V2t1QnIzNEJ1SzIxWVFzSnFZYlExUWFVSit1cFRwN1Y2NlVr?=
 =?utf-8?B?M2xGK0diVkhneGRhR04vYTJtNE0zNGczY1Nzd0NzSlYrNTFFbE9QQVRlMVdq?=
 =?utf-8?B?dWhJNGhqMnpkcUtGUzRIczB2ZnBUYmVjUnJ4QXVyTUpjZ0lENzJENXJUbWND?=
 =?utf-8?B?VENiQnIxelJsZXc1a01GdlVzV1VLUUdaM0Q4d0lRU3o4RlpndUlyMy9kY0ZJ?=
 =?utf-8?B?eHhiVlZzVEV0b0Vtb3JuRG5PcFhCb2Z2b1plYXh6eTdmTnh4anBNRy92ZUFZ?=
 =?utf-8?Q?kgWSM/1+pBW26qe/Yp9aXoGuklRpkFT0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWcwTndDM0F5WDJWdi9kOXpnZ0ZRVEwycXFXOGVocjNranBtaFk1WUJZZWlt?=
 =?utf-8?B?alJuK2pVdUpVb2JZQUZlUzEvVXBsKzRWZUNhWGcrZVB6Uk9XTFZqMlM2RzF2?=
 =?utf-8?B?c2M2cmxKL1FzWFlkTXJpSExVcTlaR3NKSE9ZLzRnU3ozZ29xWWY0Y3pOUFIy?=
 =?utf-8?B?Y0xWVnZrSXpEUnVqQkNiZzdzdE0yM1YzWjhsZysza2I4VmEwMG1FMC9yYzQw?=
 =?utf-8?B?QTd5SzN4Y2pEaGNBVDhTSFZHTURWV2hBaVRFS0xmS0V4VkJTeFNVc3JzUkFz?=
 =?utf-8?B?SnZWaUluaHhlYWlIaW8yOExKYjNQZ2ozSSt3WTJENFZuaUowenBzS0dkbnF6?=
 =?utf-8?B?SG1yeVZqZVJTVUZBckc0anJOODBaWlhvWlJsQ2E3WlNYd1kwOGo5YkYzSVIz?=
 =?utf-8?B?dXlaZUlMbzFiWlVQejhzaURjaytsTm1QTWF5Y1Z5SFhXcmxMa0RsdVR5b1lU?=
 =?utf-8?B?dURYV1R0aVJDbmdHK01ScTFWVWd1QjlTelBqdU1rSkZYeU9TTlEvSjlUMnNu?=
 =?utf-8?B?NXQyelp1UE53S2ZrVDFPTHgwUGw4TTRkTEp5ZlVoMlVKSkVCdHNEREFqdGVU?=
 =?utf-8?B?YWdDQ3hqVEhTMmxBZUpTd1UrWHJ4U1lXL0pNZjVueldVbEJTSFd6a3o3L0I2?=
 =?utf-8?B?K3lEWWk1eFNKdGU4ZFh0T2xqWFEvOXRjclpTVE9QM0JsMHpGV2c1UHNiWk1F?=
 =?utf-8?B?ZUtFZGtaV3B4VkNFNHVjUXVkVGpDNkdWWjFTdnQweFJTZkxzR3JnRnFXR2NP?=
 =?utf-8?B?VTFyb1FCblVmQlNnS0JoR0dLZmNYMTJPSjR5cHdkN3hXOEdvdFVQU1p0SGdC?=
 =?utf-8?B?MDFHVHBKU0RPTHRKdlZaUW1BaWhYLzRPNHZySWlISFIrUWxzbkQ3Z1I4RE01?=
 =?utf-8?B?elVVY2lscktPNTg0bXBCQjcxRzByYjhLa25zTGFLTHNFMjM0NVJCQVdSYUZJ?=
 =?utf-8?B?MktjVTVPTGQ3dE1vNHRRa3lublZkT29zdmk2Y2IvbTUyQkVVa3BQZW5mS21a?=
 =?utf-8?B?TEhCcnVmRUxwMENnTWd5c2JMME1EWGlXSlhDMHVBVHFVVHRFNzJZVm8zWnhr?=
 =?utf-8?B?WHllUEVleHhGTHc0MGFXT1YyMk1RSmRTS25QYmFSN1QySWlpeFpYaXZqM0Fh?=
 =?utf-8?B?TUVSRzlKUmFJSVRZdnJZcTFwYUNkaVpWU3VEalI3MjBiRjN3S0t3NlBDZXhw?=
 =?utf-8?B?TkFTRGxDWFZFL0h1SW9IVXVhempBcFNiRlRzYi9hT1NYdGtidlg3NHd5ZWxt?=
 =?utf-8?B?cUN0OTBrenNBU29WaDlDbkJMbk1BZE5zYkV0ZVBpRnhmbkJWbjRPVXZEaS9r?=
 =?utf-8?B?WEwzT2haWXZIM2JxVld6Qk94TXJPWFRUSVZGT2sxcHRGVVpjZDErUVB1eUh2?=
 =?utf-8?B?YjJQWUFZUHI1TjRzZk8weGh1REdpQUcwM0lHZzdJak44QXNmaFJVQWpNVU9P?=
 =?utf-8?B?RkZmRHlqUWdiZDYwSjdaWWF0TG5Daklod2JOVnQ2bWNMV0FOZkg4aUhVcTNk?=
 =?utf-8?B?YjNiTDJNamxxZ3E3RVp1REdnNE9aSjFETFhLQVM2R2E4djA2czRJV2Y0SzI2?=
 =?utf-8?B?QWo2ZEw4TDFkZytUeXRlRDAwUjN3NEgvNkVWUmx5ZWhrSUV2cjcrWW9MTm5k?=
 =?utf-8?B?STVJYTVpaFg3enVTWlpoNkoyVFZtT2ZTQ1BteHZsNS9haGMrZXg5Q3d3Smtr?=
 =?utf-8?B?am9ndC9LdFdERFd2bVROS3ZkZzA5NVBWN3FJQml1Y1c2d3JPLzlXeUdTZHRB?=
 =?utf-8?B?QTNvSmRTYW5ZempZaVV5cVl0elZBUFc5ejRIUzdGR28zUkU2eTRTOTVheTlM?=
 =?utf-8?B?RXB3MTFCTkRtN3NVdVNQTVhHTlFDVnc0WlVjenVpRm1mMFFHejRjaUExWlRx?=
 =?utf-8?B?MEo2NDlJcWZSYm0ydG1wL05IZndWSkFUT0NIN1d2ZkRHRnorU0dxTU41M0Js?=
 =?utf-8?B?dDNwZ2tFSnlQQzNyb0pRMGZWREMrTkVPcnhUNC9Kc3hoWE5kekcyT2MzTmNV?=
 =?utf-8?B?UkJCTEVQZndWNXp1dW9UMVQ4bHZydWlTR211YlJSVzY5WE1ReTMxcjVWVEZH?=
 =?utf-8?B?ekpFYmwwRzBRZitwY1JzdUdUb2xEZFJZUHdUQ0tucWE1eVQ1d2s5dFhKdEVr?=
 =?utf-8?B?NXQ3eGhtOFZQaGh2N05zRmM0cUtuQVNWZ2d5NERqek42bmJIY1UrQ2pydTho?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db8c0519-e32f-4f18-45f3-08de00e02694
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 11:46:25.4620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gYZLflnjHu/CmxVibNZpzUeG1b3FVFb6LBjqGCCW2bpr3S39LfmSMohd9gRprU7gUvMgS5fR6NOI8tDSw09PUYS7Niepjk1m9ohwGSOO9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
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



On 24-09-2025 02:43, Matthew Brost wrote:
> Add long-spin-comp-reuse-many-preempt-threads which verifies compressed
> memory can be used during this test. Useful to test VF migration.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   lib/xe/xe_legacy.c          | 38 +++++++++++++++++++++++++++++--------
>   tests/intel/xe_exec_reset.c |  8 ++++++++
>   2 files changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index cb53a8cfc8..74432a4b3a 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -9,9 +9,11 @@
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_legacy.h"
>   #include "xe/xe_spin.h"
> +#include "intel_pat.h"
>   
>   /* Batch buffer element count, in number of dwords(u32) */
>   #define BATCH_DW_COUNT			16
> +#define COMPRESSION			(0x1 << 13)
>   #define SYSTEM				(0x1 << 12)
>   #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
>   #define LONG_SPIN			(0x1 << 8)
> @@ -72,6 +74,9 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   
>   	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>   
> +	if (flags & COMPRESSION)
> +		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
> +
>   	if (flags & CLOSE_FD)
>   		fd = drm_open_driver(DRIVER_XE);
>   
> @@ -79,11 +84,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	bo_size = sizeof(*data) * (n_execs + extra_execs);
>   	bo_size = xe_bb_size(fd, bo_size);
>   
> -	bo = xe_bo_create(fd, vm, bo_size,
> -			  flags & SYSTEM ?
> -			  system_memory(fd) :
> -			  vram_if_possible(fd, eci->gt_id),
> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	if (flags & COMPRESSION) {
> +		bo = xe_bo_create_caching(fd, vm, bo_size,
> +					  flags & SYSTEM ?
> +					  system_memory(fd) :
> +					  vram_if_possible(fd, eci->gt_id),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
This limits BO creation for VRAM right. So, the compression case will 
not work for IGPU?
-Satya.> +					  DRM_XE_GEM_CPU_CACHING_WC);
> +	} else {
> +		bo = xe_bo_create(fd, vm, bo_size,
> +				  flags & SYSTEM ?
> +				  system_memory(fd) :
> +				  vram_if_possible(fd, eci->gt_id),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	}
>   	data = xe_bo_map(fd, bo, bo_size);
>   
>   	for (i = 0; i < n_exec_queues; i++) {
> @@ -94,7 +108,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	sync[0].handle = syncobj_create(fd, 0);
>   
>   	/* Binding mechanism based on use_capture_mode */
> -	if (use_capture_mode) {
> +	if (flags & COMPRESSION) {
> +		int ret;
> +
> +		ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, bo_size,
> +				   DRM_XE_VM_BIND_OP_MAP, 0, sync, 1, 0,
> +				   intel_get_pat_idx_uc_comp(fd), 0);
> +		igt_assert(!ret);
> +	} else if (use_capture_mode) {
>   		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
>   				    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
>   	} else {
> @@ -141,7 +162,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   
>   		xe_exec(fd, &exec);
>   
> -		if (!i && !(flags & CAT_ERROR) && !use_capture_mode)
> +		if (!i && !(flags & CAT_ERROR) && !use_capture_mode &&
> +		    !(flags & COMPRESSION))
>   			xe_spin_wait_started(&data[i].spin);
>   	}
>   
> @@ -202,7 +224,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>   	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>   
> -	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
> +	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
>   		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
>   		     i < n_execs + extra_execs; i++)
>   			igt_assert_eq(data[i].data, 0xc0ffee);
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 113ceb2178..f5db1ff8ba 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -123,6 +123,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>   #define GT1				(0x1 << 10)
>   #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
>   #define SYSTEM				(0x1 << 12)
> +#define COMPRESSION			(0x1 << 13)
>   
>   /**
>    * SUBTEST: %s-cat-error
> @@ -702,6 +703,9 @@ static void *thread(void *data)
>    * SUBTEST: long-spin-sys-reuse-many-preempt-threads
>    * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use system memory
>    *
> + * SUBTEST: long-spin-comp-reuse-many-preempt-threads
> + * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use compressed memory
> + *
>    * SUBTEST: long-spin-reuse-many-preempt-gt0-threads
>    * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, primary GT
>    *
> @@ -878,6 +882,10 @@ igt_main
>   		threads(fd, 2, 16, SYSTEM | LONG_SPIN | PREEMPT |
>   			LONG_SPIN_REUSE_QUEUE);
>   
> +	igt_subtest("long-spin-comp-reuse-many-preempt-threads")
> +		threads(fd, 2, 16, COMPRESSION | LONG_SPIN | PREEMPT |
> +			LONG_SPIN_REUSE_QUEUE);
> +
>   	igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
>   		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
>   			LONG_SPIN_REUSE_QUEUE);

