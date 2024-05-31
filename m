Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46169C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 07:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA19011BF7B;
	Fri, 31 May 2024 07:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFYTaLvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D0811BF7B
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717139213; x=1748675213;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=0r+SJEoU1l9O7+BXDlF8FDB7VsCdYh6zEKvTz0BHRUY=;
 b=UFYTaLviFPuWoXZyrCrGcymlrnqLVyvsQbT22vdex2JUx/176w5KuZbm
 D5ey+QfS7NHmEY3wbHrDrhDxHiWpbUFdImInK6ItRFsPNIZhJDzFVngma
 E8V3vjCUVovgPnyu8q4jb0vcfpvsRE4yBIXLsGxat2smy5r3Gz8PdNX5C
 xe+CynqLmIDrtqC36LXzDh3dt+ilFv1j+z2P5shNXxqfjMjyfYKpImrJ3
 1zNBbZtrQBmbW7YX3T3DFp6pgyXvMCZefgv/aW0YRxyI/VKxloev5tJfw
 I/Wv3pf/azPIi8lfcsRNwawK8L6flxtiEVd1g9TU1N4IKj0cS0P+DXo6e w==;
X-CSE-ConnectionGUID: Fa4X8gptQd2VThcXFWmoow==
X-CSE-MsgGUID: OdpL7muTSoS60JoRgjncjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13838191"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13838191"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 00:06:53 -0700
X-CSE-ConnectionGUID: /5t3VcagRaWPv1Y/ziqK+w==
X-CSE-MsgGUID: wV9QE+HhTlSzxGgmpRQgWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36028765"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 00:06:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 00:06:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 00:06:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 00:06:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 00:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfWuaLrYboSmOwXjcoI9UO/E5KMxaF0E+CSZx/axOYKQcaNqN/7pv0/FyAXeG5ZgBKdZuhPAsyC/qjSWgtfXZDyi/yNC9D+YplXP8weeuTDMuUrcXehnutYLS6RwS1TTruXXA9KhH42Ek+EBt205kx28uwk8tWbN/qKUM0fWRQ9Kcjyt8epXZHb6QmBDNaJgZdLTUIzoXWdDwx9RVFVqbXQj5XmXIXSd35yoIcortfWdA3pqPir0jhV7GfLRR3j9wIdFL1RO4lHoqBzWDt92RZZ6juEdbZE+Rjyk7yYekXcJDnD8ugvqw/+NgbT1BQyeOms5rCugNJwQnJvqj5VBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r+SJEoU1l9O7+BXDlF8FDB7VsCdYh6zEKvTz0BHRUY=;
 b=PCIywJgMO1W5UPLM1XdsbTCQFabgFXPq4W30zQ8hkRGn0wtMdYD76n+mdzvszWh1r3tHUoPCxyhT1uxchF7FyLRFaAg/Lm+H+B6Aup4EBa3vb5Rek2DiNvW+fZDy7tmktPz8yuMf5LwYCfgigGWbkdmlp0xV2BDa1wpXtNETDlo+apc3CilzrqUUuJzP/bEFV7ZMTO2k6O2M1hBKr+LC6rZY+Ddw0PuNbDg/Ob18+K9Uh75q7CY1LtyLC9yhjafWB1NOkuWnM7Th6NxTu4NMCL2nrhfldKqh5/yJ+gcob2kqjjtgY4RLCsceIv27U551zEl3u7eO9AJf/EjVk1usiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BY1PR11MB8032.namprd11.prod.outlook.com (2603:10b6:a03:524::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.29; Fri, 31 May 2024 07:06:40 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 07:06:40 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Thread-Index: AQHaqpkWkC0eMJgcK0qeG6yOv2w8y7Gw/PiA
Date: Fri, 31 May 2024 07:06:40 +0000
Message-ID: <37719af6b9201dbd20c8c87c6d5f6293689ebe27.camel@intel.com>
References: <20240520094620.3713972-1-jeevan.b@intel.com>
 <20240520094620.3713972-3-jeevan.b@intel.com>
In-Reply-To: <20240520094620.3713972-3-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|BY1PR11MB8032:EE_
x-ms-office365-filtering-correlation-id: 426c9823-fa59-4c7f-5404-08dc81403894
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?NG5BSDRpbnA4Rk43Q2E2M2dnaWxheHNySzd6ZGJzWThaMGhmZnl0cCs3a2Ra?=
 =?utf-8?B?UUl1UkY0SWNxNjdTa3ltTXpOWWt0NjNuSndZSExVcEcrU1dYajdVWEJZQlFX?=
 =?utf-8?B?Y3hBSU43T1VIK09RUDdXSVgwTkI1d3ZhbWtzNVRRTm1WY3VwUExNeTBXdmRv?=
 =?utf-8?B?enRvb0JRYm5hT0daanUrd3pUSFJ1aWpYaFR1UU1uVFFweHZqMVJuYS9NZ0FQ?=
 =?utf-8?B?ZENBUnpTSVJXK2VzQTVrekZYNmp2NS9ZVXdMTG81SzluN3RyU2J2MDJFakZz?=
 =?utf-8?B?ZFpUZnV1cStGSW03VGNoU0FEMkdJbHVJQ0I4Z0kzbTIvUzFSZVVGSFRyZmJk?=
 =?utf-8?B?Umt5bkZrNTNwSkFVN1BMeEZFTncxSm8wdzdnSUJldDgwd3VsWHliY2dpbzRx?=
 =?utf-8?B?Uk1GZlkvWmZCdmp2VW54VGE1RjEvcTVNYVJ4M3F0ZHRmUHp4OTdoeFk0YWZZ?=
 =?utf-8?B?eWoyUVRTbW53NFo4SlI4eWZJc1ErbmhRV0c0K0F1YjVPeHFFNFVXcG1Oa1JL?=
 =?utf-8?B?U0FsMWFoZGhkYTJrZDBsN3czUmJkVklvWGhwRDNJdE5LeHZtZXh1NjVkR2hm?=
 =?utf-8?B?NXhhSDkxZkU1cmxiRUhvSm9mc09nbzZUbzJFR1g3cUZRc3dJczhtRFNrYWth?=
 =?utf-8?B?bWUzbk16YWtvSXNEcnJTbGtpczVEZFdyV3lJZ1dOOHBuUFBwMTRZM2gzbzhF?=
 =?utf-8?B?eWo3NFJLTGtKM24zTGNMUWlXTllNcmVWQkVHN2dnemhscE1YSkZyNmxkU21r?=
 =?utf-8?B?dVlqZ1FKemp1eTNSMjI1cGhoVU1iQW00STVFOHpjcklvZ1EySm1hQXFoRmRI?=
 =?utf-8?B?MVZUeGlZVTJsY3JpckxZaHFhMlBZMXRwaEQ5QTM3ZStqcTZlZ1R6ZHV4bWpj?=
 =?utf-8?B?SlVpNjBBZEVhNXQ3NDVHSHc0dW12YlltRkdFZDNiYVhOdmtFZXFnOHd5RGty?=
 =?utf-8?B?RS9HL1pybVNSSFpheFgwY3pDbWZndzJEanl1UEdYMzV4U1lQdEthR2tva0F2?=
 =?utf-8?B?L3dsZ3g5T1N4QnZ3TzlJNkJIV1Z2RlJ1VzJURzBESWdTSjZ3VzlqeVZJU0g1?=
 =?utf-8?B?Mkw3dG5RZVBMZHh3dDhIbVNXUFl6SVU0a1ZEOHdETzJYRUZqVlo1TXVRYkNS?=
 =?utf-8?B?dmZFdGZJejFMOFZGNTFnQVc4UlVFQXRmcVVDRDJaYnFMSWc5eFpxSVo4YzNG?=
 =?utf-8?B?NlcvTTY1ak0zOW5JSmZsaWpDa2ppMDE4elNmSHhSeFVUQWF6TnNBKzJaV1da?=
 =?utf-8?B?SzhncVhLTHlrWll6NHZWVlVOTDNpRUZ1cENJMEVSc1dDdVd1UnV1dnV1VXZs?=
 =?utf-8?B?azJjUGI2MWxYdEt6dnpMYlRJZnJFdzdIckVqZ1A0ZDRvd2VvU0xwZUVuMHdM?=
 =?utf-8?B?WUZFaENld0VjTElER0htQVdVT2gzVkF2ZThjTm9lRVF2Y3ZXYnJyMlQ1Wkoz?=
 =?utf-8?B?UWVDZENrZkM4SENVLzljVW8xMVJSa1VNSWZ6a2hEMURjMHFnWXFqaW5aQjFB?=
 =?utf-8?B?TWZBV3VuSHU1ek5oaGp0OEN2eVZhN2JDNklKWVl6MlR6SDJwRzc0UHVSMGpC?=
 =?utf-8?B?dWVFckloVmJYeE1hc29jT3J5Tm1pT0Y3QlhMSm55VzNyT1NqcjBOL0dFN200?=
 =?utf-8?B?bi9wL1dJcUVzVmo4bjFHb3RlUHhnRHR3bGl0bkNHQ2xaK2RaeTVBQ2JFTVRk?=
 =?utf-8?B?YkprWk5tQmdLYnFXZEwxV1pTenh0MUxzSmNycTd0UnYzLys2bmpjR25WLzh4?=
 =?utf-8?B?ZUpvdkExd3Y1M1hESUg3ZWFIbmozSUNkeEFmQVdYZEc1ajN0dE1VZk9IQXVy?=
 =?utf-8?B?REp1TnlIaDZPalI5OHpvdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nms5UW4zcTZrSjREaGhzSW9GeFk1RE02MVpDOXpBaUdEVTRwdEwyN29UTGVa?=
 =?utf-8?B?VWhhd2U2QmFxRi83ZnRhSTZIbnlEWEZGeG1TQXVUM0NqMnN5Z1k1YnJpRUgv?=
 =?utf-8?B?TUpyZVVVdm5PSXBIUEd3S3JpUDh2eW9EMHhRdDdQNGx6Rjd4RWkwUTdsNG05?=
 =?utf-8?B?SlA2VFRuSjVHdlhBRjdlZTBnU1B5Q3h5Zjg4dFJ5NHd6ZDRGeDJlRDJBSHlh?=
 =?utf-8?B?UmRMTzRtbEk1MDE5cWVDQk16ajF2Q21XNVZFSi9zM2JWNHBYU3VGR3BFLzNG?=
 =?utf-8?B?YnlRV1JvV2JibC9SNnp1UGlSOGhZM1Y2SzNPSTBpR1l3dzlJVXJXSVdhbm5k?=
 =?utf-8?B?YjVyZTNiYkNlek9TUEJiaWJabnJCdmFHZ05xSWFRUVM3UjRYNTE3U2sxNWRM?=
 =?utf-8?B?dzY5TmpuR3poOEFMYnpILy9EWkFvQXhBcThkYURIZ0U3UFFQODdYbXlmdDI4?=
 =?utf-8?B?RVRjdi9waG1HRlpHdjF4NHpPcHU1OG94VTNKR3NPL25lVUNTRDh1TXlkeE11?=
 =?utf-8?B?d2VGYXBSTFI1M1ZCaTBYbDVpWUZrRW9xWExKRlpiQ05FU2lmVXU0ZUJ5QnZL?=
 =?utf-8?B?QVVwaDFTZ2xlOVg1NGxWVkZGV0FONElDTmJjNXRTL09sT2JBZVc0Sm04NkVn?=
 =?utf-8?B?dmtnQlMySmJaajFnbTR0R2JwRE1GdC9rMGxwK2htSjI2YXQ4bDVmU29OM0w3?=
 =?utf-8?B?dUQrWXByaUF3SXBmRmNUMUt1cTFTNmJ5MGhqdjlWdi9kcmFOb1ZJY0RuelFH?=
 =?utf-8?B?ZUFVQVJySEgrenlmMmRzU1daQTVGVDdBNk95aDU5NENqdnYyVVErbWFFdU5s?=
 =?utf-8?B?NlJBKzVJaDBkbHhhc0E5M0xNdllkYzUzSndRR25LVjMwMG1KYnJtbzludHFs?=
 =?utf-8?B?cnBLaDh2MnhCZFYxS2h0SEdvQ2MyRnEzUVdNbDB5SklGRURqNnBTdEpKcS80?=
 =?utf-8?B?dTlBL012NnNlVVdjNVR2YjM4U21iemJVNk1jZlhsT3p6SFBueHdVWUJkL3JO?=
 =?utf-8?B?VVhwZ21rVldBUTE3dExpbC9qdXZOV3lsL0t3QkprRThGU3hwQ2FkVHYzMDBY?=
 =?utf-8?B?ZTc5MGJDRUw2TUpOaUZMTWlxcG0yTjJnZUFsNkpQVlpUSmtmMEJQL2FTUkJp?=
 =?utf-8?B?SG9iTlNHRURSNmtPWWZoUFhwM3pXZ016NkNxRWRsSmlMRDBlSWRNUDlwU1px?=
 =?utf-8?B?cnRDNFhVMGM3b1hqeVRVNk5lSUlwaFdLMTJNWEMwL3ozUUlTS2tIM1lCekhY?=
 =?utf-8?B?QVlOWTN2dksxdzVORlFOY2lsK2FKaUZ5TW9yd3F5Q3phUjFlRGJmQTlKbGJj?=
 =?utf-8?B?elM2bmdienN2UjRxVHNOU2VsYVdIR05OeWdTYmNVRG5IdHI2SjYwWG1KZ0kz?=
 =?utf-8?B?S0Z6bFFSQXU3dEdXYkRWYWdFRmVrR2VmdldxZXF4U2ZtTnB6Q3FMVXE2S2sw?=
 =?utf-8?B?bC9GdWp4d2hyUmgxZWVpMGo0YVF1TW1kM0VqbUhFckNwTFhCZFlEMzNHa2Z0?=
 =?utf-8?B?UDBqVFhqTXMrbit0OCs4NzZaVGFGemdNUDZ1T2VyYVVCb29kZzd0UXgvcVhy?=
 =?utf-8?B?NjArTS9LenpZTXZyMmM5YWtXdENpZGx6TXNoT01nYWR4aUM5VitONjdFanpY?=
 =?utf-8?B?cUZyRE1WMFpra3M5Uk9aZzdtQk03MithWXMzRk9xMFIyWDEvRnB4MXB6TWI0?=
 =?utf-8?B?RkN1aHloL1VOQmFjNUs5UGJuZ2tybnVoZFZ6K1V2bXE5RFVETWZMMHdKREtz?=
 =?utf-8?B?aHRjTm1EZEw2bndhcWlkbWQycVQvZXhHSXVEdDMyRHEvV3ZSbnNZOFZzS0l2?=
 =?utf-8?B?ODR4VlF5RktUeVVBQkd4dEdkSDlFc3R6NEFOQWhhMHVCRWFQZWNVZjdQbVp2?=
 =?utf-8?B?clBWMWh4SmdxUEt4dkRVeVR1bTgvUjJabmoxSXNycE11ZGkydDhSTWR4TGtJ?=
 =?utf-8?B?OXFzcVNGc1JZbDdKZ2JpSmN4VEdaVXB0RjlENEdrNCtUUUwrQXcvVUlwVFRk?=
 =?utf-8?B?NmFuajNkVEtsZDJoL2J6VWwvZEdlWTV4R3ptejFpNkJsTnFTQXR5R0c4MU8x?=
 =?utf-8?B?V0t0cnpiVzJqTmNKczZlMStCUjdDaVFCbjJWNGEwbWZzTE9XZ3gyZHRnZXJo?=
 =?utf-8?B?NW5YNzh0dXQ2b05HUk1DQi8zeVl3amJpdVdTdnNvdEoxS3BMRnBLZWUrclcv?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01E6EBDF3612BE4F9CBD08D9108CA055@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426c9823-fa59-4c7f-5404-08dc81403894
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 07:06:40.6373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b7ND62FDO7JSDQ4aDhatDclTj9u7+MKG9sevR8Xqekjyn7MBU9LPVyEVxX+PXwa8dsqoQRAmEyVQkt2/GO5b+bnNuPc8blkvfD6XiJjZwZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8032
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

T24gTW9uLCAyMDI0LTA1LTIwIGF0IDE1OjE2ICswNTMwLCBKZWV2YW4gQiB3cm90ZToKPiBBZGQg
Y2hlY2tzIHdlYXRoZXIgZWFybHkgdHJhbnNwb3J0IGlmIHN1cHBvcnRlZCB0aGVuCj4gd2UgY2hl
Y2sgaWYgZWFybHkgdHJhc3BvcnQgaXMgd29ya2luZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKZWV2
YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPgo+IC0tLQo+IMKgdGVzdHMvaW50ZWwva21zX3BzcjJf
c2YuYyB8IDMgKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMgYi90ZXN0cy9pbnRlbC9rbXNfcHNy
Ml9zZi5jCj4gaW5kZXggNGMzZTM0YWEwLi40OTA4ZjI0NDQgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMv
aW50ZWwva21zX3BzcjJfc2YuYwo+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMKPiBA
QCAtOTE2LDYgKzkxNiw5IEBAIHN0YXRpYyB2b2lkIHJ1bihkYXRhX3QgKmRhdGEpCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2YoaW50ZWxfZmJjX3dhaXRfdW50
aWxfZW5hYmxlZChkYXRhLQo+ID5kcm1fZmQsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEtCj4gPnBpcGUpLAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiRkJDIHN0
aWxsCj4gZGlzYWJsZWRcbiIpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChwc3Jfc2lua19zdXBwb3J0
KGRhdGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwgRVRfTU9ERSwKPiBOVUxMKSkKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydF9mKHBzcjJfZWFybHlfdHJhbnNw
b3J0X2NoZWNrKGRhdGEtCj4gPmRlYnVnZnNfZmQpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlBTUjIgZWFybHkgdHJhbnNwb3J0IG5v
dCBlbmFibGVkXG4iKTsKCllvdSBhcmUgYWRkaW5nIG5ldyBtb2RlIChFVF9NT0RFKSBpbiBwcmV2
aW91cyBwYXRjaC4gWW91IHNob3VsZCBjYXJyeQppdCBpbiBkYXRhLT5wc3JfbW9kZSBhbmQgbW9k
aWZ5IHNldF9zZWxfZmV0Y2hfbW9kZV9mb3Jfb3V0cHV0CmFjY29yZGluZ2x5LiBUaGlzIHdheSB5
b3UgY291bGQganVzdCByZWx5IG9uIGN1cnJlbnQgY2hlY2tzLiBZb3UgbmVlZAp0byBpbXBsZW1l
bnQgcHNyX2FjdGl2ZV9jaGVjayBmb3IgdGhpcyBuZXcgbW9kZSBpbiBwYXRjaCAwMS8wMi4KCkJS
LAoKSm91bmkgSMO2Z2FuZGVyCgo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGRhdGEtPnNjcmVlbl9j
aGFuZ2VzID0gMDsKPiDCoAoK
