Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916E0C7EE32
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 09:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4664F10E842;
	Thu, 26 Jun 2025 09:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvyNlgZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D63710E842
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750930268; x=1782466268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0+Cx10gB7OhxdaYlHwdcey0YuZIRjktQfKwIbTVcVZM=;
 b=hvyNlgZ0FW0K6QqlNggEIsZOm+Bt4ajJBlSXiZEH5AmLmFt/BAynkBfK
 0XZGI9eX3mnUxbRDbLx4DnWNGSTZ6iKA1vdNXEk8liQ969DUIIyn/nhGS
 ygs/KSd/mLBq3lic5jqM9ApNsfEPgGn84tn0f9KTO08WYHi2UD4yiYHcv
 q49DzRDh0lxo0FH86UPHy/sCBFlID6aZriMWo5xQgnKn5k/CTgmAXLgpw
 YprCPNOeStV9duIxzO6iQyylcVQ/azSU1ZFmqiTj0P4B0OXd2bVWJdtMI
 PyZa6lHI6yANMQSuuc0PEvz45HhjzWDOqnBEbeSu2RP8/etg1AUxUJtHo A==;
X-CSE-ConnectionGUID: /vZdyS/lQdG9sU33fS7ZeA==
X-CSE-MsgGUID: H8hFczU0QH61+lzrvKUTAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53351521"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53351521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:31:07 -0700
X-CSE-ConnectionGUID: 5v9/AgnNSxGI1FfC6DZZqg==
X-CSE-MsgGUID: wjWoxFOqQ9SsdSRl3PTyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152587090"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:31:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 02:31:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 02:31:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 02:31:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlmDN8uPssaX0/NLaFAcoESljK/rOX1jCnrTKeioHotM3a+q0F0pSr3zleQIJ0WOx0flIemOnXBVhdxi8AIEdib2wd4xfPfCH4hMmotEDfcUxKUj+PAAloBCH1v8teCp5LmTDHdlDgds+7LJZBAfQWNIBxXekK5+v6MTKggnLWyHTyuIKRfv/qcIEaUeb6F+cS32eYLWufj30WHE6bH5lq9paoFwAFT/2tAw5ymQj1Z/RUJhQOEna22LRs+UUraEq8SJJYDtD+92y/rsKnoaO0m2NPPv49oykBM13ZDEL92WT83zXU8VxpjU4gdKlvNVDfy8XAH6lq/+uFAKqz5C1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+bhtXusmn2nm0HlFGSX+Y1LLdak4+I/pms2butnNpc=;
 b=GC8PyAK/tukfRPWkhMncioXgS+fcHv97vqJstJ/5jpZoYNbIAR7vjSA7K1hzwJJ/f3ujcVi2m3wDI5RnymOjkRd2tacwfFVSNfucOn4p5G0frN9VpEym1zrFlm/hpZE0XglJSloXC6waR53Ao17nkQpihc57NiVN/tZcgpRHFriEJuXTGtE8I3f/h1uaQsXP5oxtupWMlGZyFcTSlDX9Dordp9mtg1M7TCF6626khQqF4huXbkabAfbRNYh+6p/QrxX+YSCLg7c9UBea5sXoCQffROWWwhVJOLp6OHtXlLK2aPgU6Kk3fZnkYnsDSXYSKC/GVIEoanNlkhHh7vV4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Thu, 26 Jun 2025 09:31:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 09:31:03 +0000
Message-ID: <64aa5697-8535-4876-a3e7-2f17fd538dec@intel.com>
Date: Thu, 26 Jun 2025 15:00:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/5] tools/gputop/xe_gputop: Add gputop support for xe
 specific devices
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>,
 <umesh.nerlige.ramappa@intel.com>
References: <20250626091626.3760324-1-soham.purkait@intel.com>
 <20250626091626.3760324-5-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250626091626.3760324-5-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: 48dde0d0-65fd-4f1c-4d71-08ddb4942b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmFnOXFlbWZ3YS9PWUd6K2NhTGRCZlJld2MwZnc0SnBhM3VOZkswOHNHZzkr?=
 =?utf-8?B?aS9ublNnN0x1dDhUVXFhOFZKV0Y0QjRoVkxLMXMwUG9HcU9yeWhrcEpodkFa?=
 =?utf-8?B?bVNFRC9uVlNPTkVieHR1dkdPcmdiSjdCdC9WdEUwWWFYL2lqOEdHTlE2bE9Z?=
 =?utf-8?B?dGFqZUV3d2xsRnkwYVdHZzdoZEQ3eDBnM1MwODlxaDErN3JWS0hBTVQ0ckFh?=
 =?utf-8?B?dXlYenc5dWdyeVE2WDR6ZW5rSy9MdnF2SFc5WnN5bHYwSk00YnZ5UVRFNzJJ?=
 =?utf-8?B?cjNPZzRtU3FLaDlrK1pKbWRVeXBiWkdBTkxMR204TWFLZ3pCRDlocTJobTho?=
 =?utf-8?B?VjNobXpqWkFGam8wdWFZeHdDSG1LL2RXbzdOL3BNK25Da01OSmJ2c0FSRm9w?=
 =?utf-8?B?bGdwbm9rQ05lUlhwaXlnb0dwbTREUVo2U1JtRHNLRVNTTGlENkpnR05BS0dB?=
 =?utf-8?B?dnJXeVEvejBDTEJxWVFaR2ZWRzU1eFZUUE5aMCtWUWVLYUVMYURwbmRWNGlN?=
 =?utf-8?B?OEF1MjB3dWM0MUhad20xZjlZa2d5WDV3VWJoKzczbUZaRWlyL2JYendsLzZs?=
 =?utf-8?B?UUlJTmxjcFR3VllQZW1QekM5aGhmRzloZWZ3eFhRUW1HRlBSMVZ4MURvaFlU?=
 =?utf-8?B?L0hSOVNQTkRMVXFkVlRpVFh6YjZhVmtHb0E2T0FNQ3lKekhNT0ErYUNSOXdW?=
 =?utf-8?B?bk1ldjkzNEw0bkdVVmRnaTdGQlllMGhQMS9rSzU2WG1GVWo4OHdhODN3R1J0?=
 =?utf-8?B?Z296bWowQ3JHaUczZk0yVmt5bTB2T1hEUzI2bmhtSHF6cEJWdkZFa1pWRUVu?=
 =?utf-8?B?WTlMV1dvNWwvb3luTm91cnB4S0pBQ21oREVhNDJ3cUJETktzMGUyeWUwQWJC?=
 =?utf-8?B?WHNlN0tmd0pSR1hGbnJHMDNHTTNVTUphRkduRE96SnJrcDVTWURSWDA1WEdO?=
 =?utf-8?B?eHNtMnVsdWVZamZkemhrV0pZc1RpSEFsYjY0OHZZV2dwT1kwa0thcU0vMk5l?=
 =?utf-8?B?TkdLbWF2V0puMXZPZGdCQ3p2Y1psZVVUWk1EYWhHVk51WmdWSSt4RnhTYkYz?=
 =?utf-8?B?STNBRlIvN0VDWFM1Rmg1VEhKb2pFSkNMNUE4bVhpL21CeTZrUGR6a24vbUo3?=
 =?utf-8?B?U2lYcDhPd3krWlhLVld4UXlqcFJwNklRRUs3bFNQbFRrb3U3a3FDSlhaQU5Z?=
 =?utf-8?B?Q0oxNmpjd2tXU0RBT0xhcnJNK2c5VTNRdWxFV1dGZWxqOXdkM21zamVXTThn?=
 =?utf-8?B?QWJOcHVqY3JtNUxldTA0ZFdxLzZXaE1lQjg2dlJLaS9IQXRRK0ZEZmFLa0dY?=
 =?utf-8?B?dVd1THNRN2xRMUVvUE03TC8yQUZlN1RwbnpvR3c2RVlXNEZ4U2crbTJ1dEF2?=
 =?utf-8?B?ZTlRNGx2Ry9DVGh0Slh3Zy94UlZYUEw4eGlDREpmZnR3WEZxeDdqS1RBTHhk?=
 =?utf-8?B?MVdNZ1pabEVWcm0wR1FwTHk3Rkg0Y084WkRkQVp5U29KRS94Ni9rdDZnTERl?=
 =?utf-8?B?akJKY2dLNjBsaldUcVRMN0tVZDlXM0k1ckovVEpqUTlhSzdXeXdyK1VNZ1R3?=
 =?utf-8?B?TXVnNnZ0dllQNXJvODF3ejhNc2R6RGtyLzhOMHdWUkowQ0swNnMvOE5Tblg4?=
 =?utf-8?B?Yk9RSmZGVUZzdFljelhTR0Fueis3dS9TZ2VmMjhRbFVRY3F5TlNteVJodUxT?=
 =?utf-8?B?enRST3VjT0ZPaHF6T0drR2hxdnZEaGtaanU4N2grQklhdmZTT2NiYk9aUXBl?=
 =?utf-8?B?eThRYzRVZ1pjcld5WXJTTUhUek9Wd0FZdnNUVmhUb0xvNS9iSDVlMnlJVEJi?=
 =?utf-8?B?Z0ZXTFloUXhzTll6ZUFoWkswYmZnMFI0eWZJS3FNVFJOM1ZwWjhuYy9GY2RI?=
 =?utf-8?B?SVR3MjRYN244VnN1cjhlVmg1UWZwTk5CcDNrZWUzUzJCSHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmJkWEwwVnJPQ1dJUzlXQjArNDR5Y1hWRHp4c1VLS2pKYkN6N1kzcmFqUDNT?=
 =?utf-8?B?T2ZacDBVUjRZOFltejJwUmV2dUhqTnRFeTlQVmxITnhBZitkdTdpKzhuYk5B?=
 =?utf-8?B?dE9hODhXc2FJdWZmNTNqR0hvODc1Z082dzhlNE43VWFhZ25iekVvbU11LzdX?=
 =?utf-8?B?OXNmWUFkSGFVYTUxY2RFZmRENU9GVmM5SUkxcmx1MGErSE5jTEkxSzFrTEZM?=
 =?utf-8?B?V09wSmtRa1htWDk1VFVwRnR6dHBlT3hrc29jMFpJRHdNQ1VOVVVrY3R4dWQ1?=
 =?utf-8?B?c0lJVCtVNkZ2NkNlcWlPa2c0WXd6alRFcjQ2QmIrbUkrSmUrZU9jVkNwOFo5?=
 =?utf-8?B?Q0p6RGROeEx2amtNQjRYWGJIU2VWWjZaTEpJR1RodmxLaElMT3Voa2JpUEZh?=
 =?utf-8?B?ZUNyNHZibTdCY2FOVmJWb3l5VkgyYXlNVy80S2JWaTg5ODlWVUxVZWpNU1RT?=
 =?utf-8?B?ZHRHekhIY0REUXNUM1NmWVpZeGFOalp0eEl2dmhxMlhCemZFZC9SSjB4dVdB?=
 =?utf-8?B?WGM2ZENuNVZ2YlIza3A5QVNGaVAxL24xNXhLWEFoZUhsc2I2RVNNeE83MXNQ?=
 =?utf-8?B?Rk1rQnE2NUpmTWJWbFZrRjNESHltWnZJK1JYSFVGbUdvLzJRL0lHT3dZZHoy?=
 =?utf-8?B?NUVxanZjSUxBck8zcU9oODlBVFlONFB4anh3WlpqUlNNUUhHTzYrbXYvNnU0?=
 =?utf-8?B?WVdaZElMSHE3QXlXZS9OZ0VDZFlTTGtaWWlDY1VUUUlFaGlaQytWSEVLMkFQ?=
 =?utf-8?B?NUFGQzdHNWVPWXZpOEJsNW5DL0gzZ2dYcmx0ZmlXRzdGQ1MyTGpaU0RldGpi?=
 =?utf-8?B?RGNHazYzb1dWdDFrYlVZMFRYOFl2eldPWjFUdGJzWVpWSlRSTWllK0dsQmZm?=
 =?utf-8?B?OVlaamVoWUpjYUo4T3MxWXUxVzQ2UWRiVnlYbWl6eXFESURudXZDYTJSVWpn?=
 =?utf-8?B?MGN0RDZ5cmJnNlNldml4TG8rNFhCaUxieEFLWFBra3hLMTVUZ1BEYWxtOGIx?=
 =?utf-8?B?YjBBRW9nN3dRRmM4blZudVFZM01KbkhLNXIyVmd1d3FNMUtsMkl2MjhhaE5W?=
 =?utf-8?B?NUl4RzU1M29DRk1NUVo0WDVYQjJxTGo3ZUxicUNZdjI2ZWFEZWJPYU1QQ3Jy?=
 =?utf-8?B?eFBPUjA4T2craStGYnlFUlZlc05aM0RzVm1KbiswUnVJZHNpTnptOHkxUTVv?=
 =?utf-8?B?MHJKSjcvbjU0WGxjYWRrKzl6QnN3V1AyQmQ5Njgva2pnKzNobXF0eVJzaWxh?=
 =?utf-8?B?ODJXVk5RaldXemFpMEx5a2NtTzFLOXBVSVU4eElNTHd3K2RZRC91QkJ5REsv?=
 =?utf-8?B?ajl6ZXF5bUtWYzVmYzlHNWxsbmwweVdHTWJScUFobWhWNERMTG5SbktYSjhM?=
 =?utf-8?B?dVMrTGgxSkpIZDdOdm1VREJLUy9Gd2hDY2h1QXI5cmQreGJIVGgrSzUrYURF?=
 =?utf-8?B?SUIvRTFvbUtaQUhQZzl2Tk5MV1l5RGhzQW1xZHZRT01CWTFPVHRBVlhlN1pr?=
 =?utf-8?B?NlhKMkRaUUZGcG54a0cxK1RUUGFxaDlvK3dqeXJDTHVYd0N5WWd6Vk5SMERQ?=
 =?utf-8?B?c0d3dGhuOFAxSnBybTRqUUZXd0RCY0YxanhTOWJkd011SEZCWnBjVE15cStk?=
 =?utf-8?B?SWc4RDJYZ0ViMjVGMSt4U2hRMUY2NkZRRFVMQ1JSUmozbThZMkJmWmcyZUcr?=
 =?utf-8?B?NU1QaUdLQWVBeE10SThrZkdlSEtCanZGSE9KYnNRQllBTGV2Z0JmK0V5UUpD?=
 =?utf-8?B?UEhYei9Yd3NGejUreDFDVEhxbkczcVlFS3JsbSt4cjN3aG9icG9RY1FPTDZk?=
 =?utf-8?B?ZWJSZ2loK3NNUHNxMkZvWEFPR1hwY1RUV3czRFJpcG56TDBSYnVhTDNQRk5B?=
 =?utf-8?B?eEJSR1lNMW1xWXQxYVpMQzBuZEk4a1BsazJvZ1JKSWdORmRVU2h4OVdmZFo4?=
 =?utf-8?B?QkJ6VlhPTGh5blBOTnkya0FzWGdpY0k0dmFVY1k4VTdCSDE1L1BSeWpwWEpk?=
 =?utf-8?B?b3BiOEp4OEtFV1JCeFdZWDY4eWZZVEtlRG5SMmI4elk0eWkvTHF0b1pqanZG?=
 =?utf-8?B?MlZ6NnpPTkxTaGJQWWVBelN6OVB0djZkWHBrOUtDWDZGcW9XZmVBWnJHRnh0?=
 =?utf-8?Q?8XML9m31L3fs9XA85aY4p1hSF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dde0d0-65fd-4f1c-4d71-08ddb4942b0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 09:31:02.8893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCyqnrisiI/TjnqqDuGESqC9sZuPaIX95UbYEErYYVrD8rkC27MiL8EQEkhwyR8u5CTyTQDaK/eHQgVhRU6mDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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

Hi Soham

On 6/26/2025 2:46 PM, Soham Purkait wrote:
> Add gputop support for xe-specific devices. Separate driver-specific code
> into respective source files.
> 
> v1:
>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
> v2:
>   - Allocate Engine memory all at once, remove PMU
>     normalization and perform proper resource
>     cleanup (Riana)
> v3:
>   - Add GT number.    (Riana)
>   - Cosmetic changes. (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/gputop/xe_gputop.c | 361 +++++++++++++++++++++++++++++++++++++++
>   tools/gputop/xe_gputop.h |  59 +++++++
>   2 files changed, 420 insertions(+)
>   create mode 100644 tools/gputop/xe_gputop.c
>   create mode 100644 tools/gputop/xe_gputop.h
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> new file mode 100644
> index 000000000..9757369a8
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.c
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gputop.h"
> +
> +#define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
> +
> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +void xe_clean_up(void *obj, int len)
> +{
> +	struct xe_gputop *gputop_dev = (struct xe_gputop *)obj;
> +	struct xe_pmu_counter pmu_counter;
> +	struct xe_engine *eng;
> +
> +	for (int i = 0; i < len; i++) {
> +		if (gputop_dev[i].card)
> +			free(gputop_dev[i].card);
> +		if (gputop_dev[i].pmu_device_obj) {
> +			for (int j = 0;
> +			     j < gputop_dev[i].pmu_device_obj->num_engines;
> +			     j++) {
> +				eng = engine_ptr(gputop_dev[i].pmu_device_obj,
> +						 j);
> +				if (eng->display_name)
> +					free(eng->display_name);
> +
> +				pmu_counter = eng->engine_active_ticks;
> +				if (pmu_counter.present)
> +					close(pmu_counter.fd);
> +
> +				pmu_counter = eng->engine_total_ticks;
> +				if (pmu_counter.present)
> +					close(pmu_counter.fd);
> +			}
> +			if (gputop_dev[i].pmu_device_obj->device)
> +				free(gputop_dev[i].pmu_device_obj->device);
> +			free(gputop_dev->pmu_device_obj);
> +		}
> +	}
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct xe_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;
> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
> +		pmu->fd = fd__;
> +	}
> +
> +	return fd__;
> +}
> +
> +void xe_gputop_init(void *ptr, int index,
> +		    struct igt_device_card *card)
> +{
> +	struct xe_gputop *obj;
> +
> +	obj = ((struct xe_gputop *)ptr) + index;
> +	obj->card = card;
> +}
> +
> +static int pmu_format_shift(int xe, const char *name)
> +{
> +	uint32_t start;
> +	int format;
> +	char device[80];
> +
> +	format = perf_event_format(xe_perf_device(xe, device, sizeof(device)),
> +				   name, &start);
> +	if (format)
> +		return 0;
> +
> +	return start;
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct xe_engine *a = (struct xe_engine *)__a;
> +	const struct xe_engine *b = (struct xe_engine *)__b;
> +
> +	if (a->drm_xe_engine.gt_id != b->drm_xe_engine.gt_id)
> +		return a->drm_xe_engine.gt_id - b->drm_xe_engine.gt_id;
> +	else if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
> +		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
> +	else
> +		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
> +}
> +
> +void *xe_populate_engines(const void *obj, int index)
> +{
> +	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
> +	struct igt_device_card *card = ptr->card;
> +	uint64_t engine_active_config, engine_total_config;
> +	uint64_t engine_class, engine_instance, gt_shift;
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct xe_pmu_device *engines;
> +	char device[30];
> +	int ret = 0;
> +	int card_fd;
> +
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +		return NULL;
> +
> +	if (strlen(card->card)) {
> +		card_fd = igt_open_card(card);
> +	} else if (strlen(card->render)) {
> +		card_fd = igt_open_render(card);
> +	} else {
> +		fprintf(stderr, "Failed to detect device!\n");
> +		return NULL;
> +	}
> +	xe_device_get(card_fd);
> +	engines = malloc(sizeof(struct xe_pmu_device) +
> +			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(struct xe_pmu_device) +
> +	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +
> +	engines->num_engines = 0;
> +	gt_shift = pmu_format_shift(card_fd, "gt");
> +	engine_class = pmu_format_shift(card_fd, "engine_class");
> +	engine_instance = pmu_format_shift(card_fd, "engine_instance");
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	engines->device = strdup(device);
> +	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
> +	if (ret < 0)
> +		return NULL;
> +
> +	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
> +	if (ret < 0)
> +		return NULL;
> +
> +	xe_for_each_engine(card_fd, hwe) {
> +		uint64_t  param_config;
> +		struct xe_engine *engine;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> +			| hwe->engine_instance << engine_instance;
> +		engine->drm_xe_engine = *hwe;
> +		engine->engine_active_ticks.config = engine_active_config | param_config;
> +		engine->engine_total_ticks.config = engine_total_config | param_config;
> +
> +		if (engine->engine_active_ticks.config == -1 ||
> +		    engine->engine_total_ticks.config == -1) {
> +			ret = ENOENT;
> +			break;
> +		}
> +
> +		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
> +			       hwe->gt_id,
> +			       class_display_name(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);

unnecessary redirection.
use hwe->engine_class and instance here.

Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engines->num_engines++;
> +	}
> +
> +	if (!ret) {
> +		errno = ret;
> +		return NULL;
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct xe_engine), engine_cmp);
> +
> +	ptr->pmu_device_obj = engines;
> +
> +	return engines;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +void xe_pmu_sample(const void *obj, int index)
> +{
> +	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
> +	struct xe_pmu_device *engines = ptr->pmu_device_obj;
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->engine_active_ticks, val);
> +		update_sample(&engine->engine_total_ticks, val);
> +	}
> +}
> +
> +int xe_pmu_init(const void *obj, int index)
> +{
> +	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
> +	struct xe_pmu_device *engines = ptr->pmu_device_obj;
> +	struct xe_engine *engine;
> +	unsigned int i;
> +	uint64_t type;
> +	int fd;
> +
> +	type = igt_perf_type_id(engines->device);
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
> +			       &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +static double pmu_active_percentage(struct xe_engine *engine)
> +{
> +	double pmu_active_ticks = engine->engine_active_ticks.val.cur -
> +				  engine->engine_active_ticks.val.prev;
> +	double pmu_total_ticks = engine->engine_total_ticks.val.cur -
> +				 engine->engine_total_ticks.val.prev;
> +	double percentage;
> +
> +	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
> +	return percentage;
> +}
> +
> +static int
> +print_device_description(const void *obj, int lines, int w, int h)
> +{
> +	char *desc;
> +	int len;
> +
> +	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
> +		       ((struct xe_gputop *)obj)->card->driver,
> +		       ((struct xe_gputop *)obj)->card->pci_slot_name);
> +
> +	printf("\033[7m%s%*s\033[0m\n",
> +	       desc,
> +	       (int)(w - len), " ");
> +	lines++;
> +	free(desc);
> +	return lines;
> +}
> +
> +static int
> +print_engines_header(struct xe_pmu_device *engines,
> +		     int lines, int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   ACTIVITY  ";
> +
> +		printf("\033[7m%s%*s\033[0m\n",
> +		       a,
> +		       (int)(con_w - strlen(a)), " ");
> +		lines++;
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct xe_pmu_device *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct xe_engine *engine = engine_ptr(engines, i);
> +	double percentage = pmu_active_percentage(engine);
> +
> +	printf("%*s", (int)(strlen("            ENGINES")), engine->display_name);
> +	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int xe_print_engines(const void *obj, int index, int lines, int w, int h)
> +{
> +	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
> +	struct xe_pmu_device *show = ptr->pmu_device_obj;
> +
> +	lines = print_device_description(ptr, lines, w, h);
> +	lines = print_engines_header(show, lines, w,  h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> +
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> new file mode 100644
> index 000000000..1e3856071
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_GPUTOP_H__
> +#define __XE_GPUTOP_H__
> +
> +#include <dirent.h>
> +
> +#include "igt_device_scan.h"
> +#include "igt_perf.h"
> +#include "utils.h"
> +#include "xe/xe_query.h"
> +
> +struct xe_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct xe_pmu_counter {
> +	uint64_t type;
> +	uint64_t config;
> +	unsigned int idx;
> +	struct xe_pmu_pair val;
> +	int fd;
> +	bool present;
> +};
> +
> +struct xe_engine {
> +	const char *name;
> +	char *display_name;
> +	struct drm_xe_engine_class_instance drm_xe_engine;
> +	unsigned int num_counters;
> +	struct xe_pmu_counter engine_active_ticks;
> +	struct xe_pmu_counter engine_total_ticks;
> +};
> +
> +struct xe_pmu_device {
> +	unsigned int num_engines;
> +	unsigned int num_counters;
> +	int fd;
> +	char *device;
> +	struct xe_engine engine;
> +};
> +
> +struct xe_gputop {
> +	struct igt_device_card *card;
> +	struct xe_pmu_device *pmu_device_obj;
> +};
> +
> +void xe_gputop_init(void *ptr, int index, struct igt_device_card *card);
> +void *xe_populate_engines(const void *obj, int index);
> +int xe_pmu_init(const void *obj, int index);
> +void xe_pmu_sample(const void *obj, int index);
> +int xe_print_engines(const void *obj, int index, int lines, int w, int h);
> +void xe_clean_up(void *obj, int len);
> +
> +#endif /* __XE_GPUTOP_H__ */

