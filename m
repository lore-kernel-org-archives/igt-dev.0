Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DDDD3569F
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 10:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E4310E651;
	Wed, 28 Jan 2026 10:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJ5Una0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2EC10E645
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769596687; x=1801132687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=R+XVRw5ypZYe058FJTzhTazcgSL/82jg7spdOwyAu9c=;
 b=mJ5Una0FMMcnxB+1pkOsJ6MbDH9xNiphAZnTbTnMMa41KDuAjZbNYMqy
 NyHoXbqcWvFC/fZIjS4Q80rzpd22khZwTnQzJgA5TYJSdNLOn2YfQ4Y3b
 Bw5surJVVbV/c+7TBeraqL7eiT2O/ReJMYLHp6QHhZrNRrnQsRMwlrs85
 cbXO2PAH2gXqWHNPDnitBmt5e7R91ECejS2ZYvFES8Ha5rOJd/wwqtwvd
 2NryyuTI8Cek739+S/fqpzryNrU2gumoX/eJ1w1EjskyDuYb2rNlX1rOQ
 K284SQGJ0thLItS1ZnW/gkxgjpYo7UI2rH8dzG4oX9IXJoNo9BEUdGAYI Q==;
X-CSE-ConnectionGUID: 3f81ktfBT9yKLLvSP87d4w==
X-CSE-MsgGUID: Vg3SWBlcTMyjDDUJf/z8ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70860800"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208,217";a="70860800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 02:38:07 -0800
X-CSE-ConnectionGUID: j7OgyXu0QHGUIqR1lSO4Zw==
X-CSE-MsgGUID: 0+hd7K45TAmpWRXxOVFWtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
 d="scan'208,217";a="213202006"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 02:38:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 02:38:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 02:38:05 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 02:38:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooxoMVZYQ1o1ZSx9zwqWrC9ZANg3jkEcyfEFMEfHjvhI+rbuHrzXQ4XqAPK+xBZcCrlPEXegBYFS7x+iaAof4H8OUBcKrPcBlis3euFf2b1Q26nU7D2iJ9q8tv7qsDNkWj9NG0Sl17g0bI04BQnvpUGEuf+S7JX4Q7TX5Yhd1pV30/GEwDcCDNIL/fWsXUa9R4XKOTvG1zGuiIm06uUopabS1QyYQN80RsRZSg6uAFrIQOYoE5rPaDCBaIF3I5IIbl7mzbGAIj/MnNOjetrvZ4ZIIuqwSqO/flDbbkHvhOoh939EWn7yamofGYsNdZnEvnNJ6axK68x+BqX20EzhxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlWmAyMP/yFt77JWnaLnxQnhO6dcF54tFfmaCydi9gY=;
 b=i94moWGQGmdisQdJbDnhXbWFXCva4Hv53FMxdUnJnK1zeNHsP4mG10OJB7Ps9b7+4DwQvGfJbwW2VRekkbQOBQOpJiinXBYId8VyrzgHGN1oaOkVLiXrbKW845f2rZw8i8sRN9FEKsTqIx3hYsAiDWQDGu28T2JpXEgg2yKcvVhOqESbLfWtf5ZaJ2DGzPiYFldbTkMVOfpQh35tbIZF1svKwOBo7n9fHYac2MVvp7DadnalchUyaqnCs3Bs1A4hXKJionPbVG9cehplcXphDEG/KBEWDIwL7EIQFzaZYZqWmYmyGzlu1mohrxZO9OO6IXWnJKq9tskmGgBW0KaUtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 10:37:58 +0000
Received: from CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671]) by CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671%3]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 10:37:58 +0000
Content-Type: multipart/alternative;
 boundary="------------L1KNAWSmYCj6VWH0aEVWm90x"
Message-ID: <ca032654-19e4-4f22-a775-b0906aa852f8@intel.com>
Date: Wed, 28 Jan 2026 16:07:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/hwmon: Check temperature limit in
 hwmon-read
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <raag.jadav@intel.com>
References: <20260123183556.1649959-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260123183556.1649959-1-karthik.poosa@intel.com>
X-ClientProxiedBy: MA5PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::13) To CY5PR11MB6209.namprd11.prod.outlook.com
 (2603:10b6:930:27::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6209:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d070bc-c198-491a-0c44-08de5e594dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDBlL2w4ZlJ2WXhDdUFYVEdUcUp4aEZqWmp6U21WV0VYYUc0R0JQVGpzRWZK?=
 =?utf-8?B?bXpYamV4bG4zOFY4b2d0anpLcjRuMnY2dnNHVmpVT1Evc0x2WTZ0QVhpZTdi?=
 =?utf-8?B?ZU85MDBaZlh3MEdaa1laOVNtZ2J3SGU5NVRvM3grbFVtTmtIV1A2ajJOdkRG?=
 =?utf-8?B?d2JleThTNXNlNDhnWkpoNEVCRFRZbS8xMnM2VDJuMC9lVkJDN09pZEpMVHpZ?=
 =?utf-8?B?OXpPNElvTGFpb1dhNGUrZFYxNkpZdnp5TUlUVk1SRGRoTlV1K0ZXOTVaQ2VG?=
 =?utf-8?B?cXB2eEMzZXBCa0hnZXp0OVZ6S0JHWmp6c3pVcUtOUkhUNGh2MU1YK3QyaVQx?=
 =?utf-8?B?MTBTWXZ4V1prdTlnUmIwdTVMNmV4cUdrMEdtd2Jkb2FhQTlXUDFFaHVJdUE2?=
 =?utf-8?B?UjM0cUQyWERlTWx3MThWL1JZcklrVEpPRDVRSDRhcml4bW41Y2dqQ2RtaUdk?=
 =?utf-8?B?QWFCVHVYanIxRkQ5TXhMaTd5T2dTWWhLVjlQbldESTYrcm1tZGs3N2s3WEQz?=
 =?utf-8?B?STF1ZkNweko1VkhyWlBMb3JBaWwyK1h6ejg1b28zcUlJNmlvcWp4WnBoR0ly?=
 =?utf-8?B?dExCR3RaU2xrRC8vMHl0czVlZkpQZThzNW9RL2RVb1djNFZTR29KN24rUEw1?=
 =?utf-8?B?WVZxU1RETFV2N2xUblZFY3czQ0w5QzRqclVoK2ZrUnEwaHQ3Sk1XbmRXMnFE?=
 =?utf-8?B?N3lNSWNia1NDMXVySkFpOWozK0VWUHdORVNiVG9tQndIVkpiaCtDYkMzTUVm?=
 =?utf-8?B?SHM5VjF5ejEzT2M0MHhMdW9GdHVRWUlTUlRUeVBlY212NlE5azIvTzl1SHFy?=
 =?utf-8?B?Ri9TVTVXa3RvT2hrWENRNnFnZHZVUnFIZm9JUzc5YWQ5MkRpZCs2ZW02UnBq?=
 =?utf-8?B?R3R4Z1pIOU9mSzFNVlAyNzJxV0M4VU1sSWhQc2FWTnA5eVhmR2dONGhqejVO?=
 =?utf-8?B?ckp0ODZPL0YydlZubXhpS25JVE9jUCtlRXh3c3FacDk3dGpkSzhBY0V1WWVS?=
 =?utf-8?B?LzBxSU9NcnFYTUN3WGdhYjRzL0ovblZwZnBKaC9Rc3lDdGNNa09lMjlLY2w4?=
 =?utf-8?B?dEdhZEZyVkNjWEQwU3ZxZWZPOXJFNi90ZzFlZzgwSkhjZmd0bWErbGQ2Y0xM?=
 =?utf-8?B?blZ2Mk91Q3kzOFY1OWNxSVZGMU5HL1lJVFRYT3BQbjJpYkZtT2JpeTI2NFY5?=
 =?utf-8?B?V3oyVkpSbGJNekUyeGxZRVdER3Z6V3pxekhqMUdXTVIxaXZXZk93UUZvQVd4?=
 =?utf-8?B?MW1XTVREVU0rNlBFeGh4RkRQY2ovZWtFclZ5dU00MzBYUDZVSzJmSDJhOUpo?=
 =?utf-8?B?bnJZMnZyZDBZZW53VzdnZXN2WVpkcUFIUFRhVnRsRlV0bTZtUFFmblNWdlpk?=
 =?utf-8?B?Z05vOGVoN2hiUmZCQlgyUUhZdCt0c082ZXZTY2FYZUdRZXNJUkFuOUkwZ1Jk?=
 =?utf-8?B?YStvY1dub01oelNvOUlVV0Z2ZmNQVE1EaEUvdHoydmppUmY2dUpqYmgzWlVE?=
 =?utf-8?B?Q3BJQmt4MmpwK1dBNUZ0WVNhOW5UNWY3R09Rb0dZUlRCWVFScmg5bmFSNEs5?=
 =?utf-8?B?U1ZOZXpiNFBGa2FIN1hrSDJuNU1qUEhIVW50Z1hyaFcwbWMrcHhKLzVFcFNP?=
 =?utf-8?B?SUdVdEl6bGRvN0VnTXM4ZGhmTGl6NEgwOXZtRmN1QVAyT2t4VS9Mb2ZUYitB?=
 =?utf-8?B?Y1R5ZVlaVzVLMjFBRFVxS3ZjZlgwOTA0Rlp1am9sU2J4dDFJL2lJUkhzMDlK?=
 =?utf-8?B?YlAwL1JyUlBMSkJCUytPVXM1UWhzekRxU2lSdXJyWnc0aldCRCt2N0g1MWg0?=
 =?utf-8?B?WlB1ZCtpU3h1elE2TFRCanU0aWlhQktSY0ZMNWtsczR4eDhXbXloUGZqcEp5?=
 =?utf-8?B?NTB5bG9uRktnY3l0SE01ajJreEJUdDVTeFNKQTVUN3UzVUxKUlJ6N3A1MzJy?=
 =?utf-8?B?akI5SUZnNlQ3VU9ISVozWlNGTHlUekdmM2VWU05aVngwTEovRG9aaW5Xa2ND?=
 =?utf-8?B?T3JId1pYNXRIMEdjMEY5SzFCTXd5SnFNdTZxdzJJSjBLMnprQlBVdURXMXpr?=
 =?utf-8?B?RlEyQzcrdDlyY2d2RlpoZU5td1VCVVViVGp0TEFuK0VPdW9mMzlPMkpaWWEz?=
 =?utf-8?Q?Xm38=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6209.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2dGdG5WU1pSTThEc3RZRE9yREU5OE5XcGh2NHdJeTMzY2VTRm1UWUxpZXJF?=
 =?utf-8?B?WFlaTmdSU2NIM1ZiL3NMWGszMXdpVjBjT2wvNGhDT3VzeEpycUMwUGJZVnNl?=
 =?utf-8?B?SmJjakhuZ0txY1hJeFpUWE1FTitVZEowbHNJSWdzQ2hCYWJSeXRGOGhCNUxz?=
 =?utf-8?B?MHZVYWFyYy9HVFYwaldaTVR0aXZHbFJySjBwRUVmb2k2MGlhdmRVeVRsL0hJ?=
 =?utf-8?B?dnA5bFo5clpFYjREeTArdmZBR1lmQ3lkQnZLU2xJWTZYMUhxK3VMTkRENFR5?=
 =?utf-8?B?cEN4cmx0YXF0ZUFHQXJoVVhuM1lVS3BFcjBEVXI5dTZPVGxJTE5JSlZnVjg5?=
 =?utf-8?B?K3htRGNXUUFYZSthSWJPYUZ5N2trYVQ0bGlTYkFyQW8rcXAwZTBoRWsvSHVj?=
 =?utf-8?B?cjhBK3RtbStWWldGeGtHeDg5RXRNbWtLNFh4cHhmakVPUWZ3cEw2anUvU1E4?=
 =?utf-8?B?clBtdjhLbVhYenR6eGVhaWJwdkQ2VjY5S0gvQURYbTIyc0pJRUdqcUYwMXpn?=
 =?utf-8?B?dlNQa0RWdEpMb1Y5Ri8yRTJ6V2o1SVVtc2hQdml1dWZRK3FnZ2hGN0UxVHhu?=
 =?utf-8?B?UmlVZWdNWmVpUUF5aHVvbGw0T2VzWlROUzhramVhUzhVb0l0Z0tyc0RwTjhV?=
 =?utf-8?B?WjM2U2xWWUIvTTMvUW8rbE5URHJTUU1BUmNzL1laR212QnVJamlZVEw4YUNt?=
 =?utf-8?B?TGFudkErOGV0bTlvK0F3ZnpqK1JTdUdoZVBIZmIwY2I1cFEwZTMvNVFEUjJi?=
 =?utf-8?B?MDdtdnVCK3VXWHlpQTNwd1U4NllyL1NETlFzeHQwOW9jSnZwWFZQRmtVOHRS?=
 =?utf-8?B?bXp5WkZpcThBSjZ2d3RNNHllZnBobktZMXI1QldGTHpWVWp3WjBmcldJNThI?=
 =?utf-8?B?OS9FRHV2aDd4aFlKdUFDdmFsdE9ZSUhzak5rdTdDczFrQ1dpVmFWdCtoc2Y1?=
 =?utf-8?B?eHQ3eEh4UEVrOUU2V2VPeHozV1VqTjZ0MUR6Q3RxYlQzSlJZQlBtbUw3NnJq?=
 =?utf-8?B?aFYvOXVOQkFXQU9WQXp2ZUVDd21xZFhrMWN3YnRpbit5Q3pXVG9zYTZCWDhD?=
 =?utf-8?B?TEtaaXNPb0hBM1hiUURrdHpuWXZDMjVQK05MRWh0OXRzbWZubE9IT1lGTVFQ?=
 =?utf-8?B?NElZaE5IQ1RJZFVZbURGVlhBeEtMYTlhc2xhZXJsNUNRVWtacUhjSWlCR2cv?=
 =?utf-8?B?TWtWMDZLcEo4QkxCcTI0Q1Q1VjZyK3A5dWlqdGVBM0JtZWp5RXJiRDhOQWsz?=
 =?utf-8?B?MUdUK20vWlZUdG1uL1NDR3F5MUpaL1MrR2JSUVNubzQwbHAxL1BJcmZpQmFv?=
 =?utf-8?B?TVV1aHlXUmN5NTBCSC9IY3E0YUFIYnlQRDl1ZVpwS3hWQWUvMy9wUnQzZkhy?=
 =?utf-8?B?OFpjZ2Q3N3J6RVlqS0ZmN2pvSEM2QWhiazVpNHExQXFCa3dXNkZQdzFGSDli?=
 =?utf-8?B?RTJqaVoxWDZJbk50QTlKc2NCdzJCek8yYmlicnlpOGh4ZGJoL3Y3TjExUnhl?=
 =?utf-8?B?UUY4U0lscSswUytKalFxWEZVQUN6ZGlyQmpvMDUrVXRTd2JMREhyMzQwbHZL?=
 =?utf-8?B?aGVaNEVaOVduM3FUMFY5T3BVUnB2cDJjTW9HV0F0N3cxSEM1SFRCSUhFT2hQ?=
 =?utf-8?B?Ty9rRnhEVUZobWVRL3hzWFhWbDJhWm04VmdEOU5JcXlia1hveEt0QXA5aEdv?=
 =?utf-8?B?SFVrb3F6enpCcDFHRDI2NllBYVVvQ01qb3ozNit6ZEljekNEWUxNL2dra2Uz?=
 =?utf-8?B?Wk1lblQvZ1YycWdtS2ZpZnVjM3IraTFtY2lmamNTTytiMzhrMHNpTVFVanB2?=
 =?utf-8?B?blVoNVVlZkFKZkJRMXorZlhRM3V0ZHU4ZHRkTzR4cCtIalZVN1pDbUpmNGpX?=
 =?utf-8?B?clRoU1ZkTG1RREQzMEZJeVpnRnUyUWl3R1c3WERpakFxLzJEOGNBbFF2UUJm?=
 =?utf-8?B?b2tlbkdHSkVkRXU4VzJKdEppM1NpL3VPMFRFQ2tRbFltbFJsSDlxYVZNejV6?=
 =?utf-8?B?WjZaTUdoZnd3eFRucE5yUXRXbnRTb3BSM3RHTlVPeUFsZ0g1Z0F5dkdMbUl3?=
 =?utf-8?B?YVhKZ2NBeVl5N2pLdENqRm5QU2RiUVRnQUFId0l4UTExQmlGbVVOd3BQRjdn?=
 =?utf-8?B?VnV3ZUhGeUt3ejdUYzN2U2t5Ty9XR1kxZWtNc054cnFneTJpV21reGNPYVg2?=
 =?utf-8?B?TjRQTFR4VjVXNmlzK29pR3JCK0FPZkVZWVlkRE83cE0vazdNejhyY3ZCUVd2?=
 =?utf-8?B?Q0xhRXRlQm5hUUpQTjJiejNRNUxNdDNIU3oxSExhc3ptQk1EeUtua3k5WVBX?=
 =?utf-8?B?TWcvSWNVc3dDTHNrdllFM2wyQUI4QitkTWgzNnVMTklCSGhiY0RzVkJ5SVFY?=
 =?utf-8?Q?6BgZfoBKwdfv0ZqY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d070bc-c198-491a-0c44-08de5e594dcc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6209.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 10:37:58.6955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGIcHx9O4p8spbBOMM2doL8bpSgqUTULeYmaUH6TDQCmsQCEzM5uZ+cwG9Schg8YgkGzMeYR34/3CwMDss7GBxwWzpdZlkiTxyBJSiZZuNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

--------------L1KNAWSmYCj6VWH0aEVWm90x
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 24-01-2026 12:05 am, Karthik Poosa wrote:
> Improve hwmon-read test to check if current temperature
> is above critical temperature limit in hwmon-read test.
> This will help identify any thermal issues with the
> setups during test runs.
>
> v2:
>   - Address review comments. (Mallesh)
>   - Call check_temp_is_valid() only for temperature hwmon entries.
Please change check_if_temp_valid() function name
>
> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
> ---
>   tests/intel/intel_hwmon.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
> index 103ae69cd..9deb48a00 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -26,6 +26,28 @@
>   
>   IGT_TEST_DESCRIPTION("Tests for intel hwmon");
>   
> +static void check_if_temp_valid(int hwm, char *sysfs_name)
> +{
> +	char str[32] = {0};
> +	uint32_t cur_temp = 0;
> +	uint8_t ch = 0;
> +	s32 limit = 0;
> +
> +	/* Get the channel number and sysfs entry suffix. */
> +	igt_assert(sscanf(sysfs_name, "temp%hhu_%s", &ch, str) == 2);

Buffer overflow when string length more than 31, we can use 
"temp%hhu_%31s" as defensive.

Thanks,

-/Mallesh

> +
> +	/* If entry is tempX_input, check if it exceeds tempX_crit. */
> +	if (!strncmp("input", str, 5)) {
> +		sprintf(str, "temp%hhu_crit", ch);
> +		if (!faccessat(hwm, str, R_OK, 0)) {
> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, "%d", &cur_temp));
> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, "%d", &limit));
> +			igt_debug("current temp = %d limit = %d\n", cur_temp, limit);
> +			igt_assert_f(cur_temp <= limit, "current temperature exceeds limit!\n");
> +		}
> +	}
> +}
> +
>   static void hwmon_read(int hwm)
>   {
>   	struct dirent *de;
> @@ -43,6 +65,9 @@ static void hwmon_read(int hwm)
>   		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
>   		igt_debug("'%s': %s\n", de->d_name, val);
>   
> +		if (!strncmp(de->d_name, "temp", 4))
> +			check_if_temp_valid(hwm, de->d_name);
> +
>   	}
>   	closedir(dir);
>   }
--------------L1KNAWSmYCj6VWH0aEVWm90x
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-01-2026 12:05 am, Karthik Poosa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260123183556.1649959-1-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">Improve hwmon-read test to check if current temperature
is above critical temperature limit in hwmon-read test.
This will help identify any thermal issues with the
setups during test runs.

v2:
 - Address review comments. (Mallesh)
 - Call check_temp_is_valid() only for temperature hwmon entries.</pre>
    </blockquote>
    Please change&nbsp;<span style="white-space: pre-wrap">check_if_temp_valid() function name</span>
    <blockquote type="cite" cite="mid:20260123183556.1649959-1-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
 tests/intel/intel_hwmon.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index 103ae69cd..9deb48a00 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -26,6 +26,28 @@
 
 IGT_TEST_DESCRIPTION(&quot;Tests for intel hwmon&quot;);
 
+static void check_if_temp_valid(int hwm, char *sysfs_name)
+{
+	char str[32] = {0};
+	uint32_t cur_temp = 0;
+	uint8_t ch = 0;
+	s32 limit = 0;
+
+	/* Get the channel number and sysfs entry suffix. */
+	igt_assert(sscanf(sysfs_name, &quot;temp%hhu_%s&quot;, &amp;ch, str) == 2);</pre>
    </blockquote>
    <p>Buffer overflow when string length more than 31, we can use&nbsp;<span style="white-space: pre-wrap">&quot;temp%hhu_%31s&quot; as defensive. </span></p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260123183556.1649959-1-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	/* If entry is tempX_input, check if it exceeds tempX_crit. */
+	if (!strncmp(&quot;input&quot;, str, 5)) {
+		sprintf(str, &quot;temp%hhu_crit&quot;, ch);
+		if (!faccessat(hwm, str, R_OK, 0)) {
+			igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, &quot;%d&quot;, &amp;cur_temp));
+			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, &quot;%d&quot;, &amp;limit));
+			igt_debug(&quot;current temp = %d limit = %d\n&quot;, cur_temp, limit);
+			igt_assert_f(cur_temp &lt;= limit, &quot;current temperature exceeds limit!\n&quot;);
+		}
+	}
+}
+
 static void hwmon_read(int hwm)
 {
 	struct dirent *de;
@@ -43,6 +65,9 @@ static void hwmon_read(int hwm)
 		igt_assert(igt_sysfs_scanf(hwm, de-&gt;d_name, &quot;%127s&quot;, val) == 1);
 		igt_debug(&quot;'%s': %s\n&quot;, de-&gt;d_name, val);
 
+		if (!strncmp(de-&gt;d_name, &quot;temp&quot;, 4))
+			check_if_temp_valid(hwm, de-&gt;d_name);
+
 	}
 	closedir(dir);
 }
</pre>
    </blockquote>
  </body>
</html>

--------------L1KNAWSmYCj6VWH0aEVWm90x--
