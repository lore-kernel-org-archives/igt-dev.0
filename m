Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78056CCF9EE
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 05:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4C10E18A;
	Fri, 31 Oct 2025 05:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HW2Pp5DX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F95A10E18A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 05:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761888363; x=1793424363;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZiDp+iGAfIk9DkbUnWBLBMue3Is226oXTaXGKDr8llA=;
 b=HW2Pp5DXtUZx5dooncUvjpbh77pgX/Vyp6v5i5tR3A+qDg03Wk32WjTP
 B/y8JtMc3uT20ljb1X8y/1afWwDpbJJwSKFiJa2X/KwVbWeu7gWjwYHHq
 BpVonbRlx17E49KnI60Od1VFZb5QtBtTHtojTrUl20pazx9eM+VKTnJTT
 24o0jgF20c1x8FXNLvd39Wf9C4rvfZL3w1wMcFOrP7IucW0FzT3eiCaKN
 Rz/+zdd8Z6HYG34B+/zP+j1eBkJmVXULAzr+1pU2uoW8PzqYhI5b2ZckD
 BwGV9ml8JjmP4RR0W+8gVGiZqbJmKOK+P1zztLCBdIODybKozlvsLdgwj Q==;
X-CSE-ConnectionGUID: wMuRxUUCST+5J0wPw4UQJg==
X-CSE-MsgGUID: xvcFnrQZRSiljPLgIYhtfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64192422"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="64192422"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 22:26:02 -0700
X-CSE-ConnectionGUID: 3h+ju3mJRCuzeeAZ5exjfA==
X-CSE-MsgGUID: J1ePz+uaQd+Bh3AlOmBvPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186081806"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 22:26:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 22:26:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 22:26:01 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 22:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/3rWEqqoZ/wVYKE3VtF+PbnkbvJAc104fpAx41L/SdE6uQY8mS+k8fIPoddlZf7Ekykl0DYkYqeIJ1lvlFhmrN+XaY6NzRDT3wTEVRbPPY6rEXdEt21tBjv934Tv3XkwodY9hDEq3VNSqfM+8srNS+AuhKVQK83xEgKjHpi+twTTG0fhgz72af+Hw7x6gJ+eSDBT7oHzyHwndc4uxainWHfELa9BNfybm9gDMLKPeplBGRWg9aXL9VIjrwLIIq6Axos4sMYJPr0F6H91We8CFyFYzA4j02qM7lvErGBSe/yqK0Zf5rWblhXVMi9MstfDh03GgcMFZsuOEqJ9Inl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiDp+iGAfIk9DkbUnWBLBMue3Is226oXTaXGKDr8llA=;
 b=SKWQ/p8r6ZcnMZNcaXww3NRZQLyZiYpT2c0TjPQiowBRuODdDZibjD78o6C8rKAqoweAtSXZSoaFIAO99iEl0Hl9qYhSIXdQbK5CejtDxYOI4xBmlXzARLTUvohg6ulbgnEzSw9dXY1lxt0GZsggKFA5Dej+IDSSoVhLHPW7IYd6Z68XrMBAW3aIoge3nkSpyQKEzYu14XbQbw30it7ChN4xF5VU4esqrlKGAyqNfBY7rVJP9yEFaajDIdAhK87H/goqJydcfuD0dWkeWIRMZ9ZJq7ltS6FY8dOlsnSZSnFQKWF/W59v5g7BdPWnK3Jp4PM3Eol1BNUWDz+7ja0MIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 05:25:59 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 05:25:59 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Topic: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Thread-Index: AQHcQhcWMr9ujNAHOEOqsV24rN8bJbTbObwAgACMDgA=
Date: Fri, 31 Oct 2025 05:25:59 +0000
Message-ID: <SA3PR11MB80460D3EC48F6FE8384579D686F8A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-3-x.wang@intel.com>
 <6636a57ddbc6cd74848b3dfac6ecc1576f0a65a6.camel@intel.com>
In-Reply-To: <6636a57ddbc6cd74848b3dfac6ecc1576f0a65a6.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|DS4PPF07B018B9F:EE_
x-ms-office365-filtering-correlation-id: fccc2522-0209-48cd-0090-08de183df981
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|10070799003|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?UmVQbXo2QnFZRVZnVStPRjM1eTVNNEViNTY0aFNKSzY3MEgxMjNqM3AxNDRi?=
 =?utf-8?B?bEl4Ti9VWDJwQWRscWpHUW50M0hqQlhmNTJ0VFVjMklwcytGM1ROR3ZVOGM5?=
 =?utf-8?B?Z241RDdFVmFiRG5jRHQ1YStpcHhPVCtxNGFKNkdTMUZ2SGtxTGNUeGljVVBB?=
 =?utf-8?B?VEx5YVo4dHNhRFMzbW9LYTYwck5ZaC9aNmpmTU92VjFPWmZMSno0TDNqeGFT?=
 =?utf-8?B?alAvZmpjWU1OOW0wR1VoclFhS0VYZVJaTlk0TDF0aFNDbk5JTHRybUF6K2NR?=
 =?utf-8?B?ZUJndXNoZ3BocEJMaDhna3E3QklBcHdxSHg0OXBLY1V0bkg5ZkQyNEFNMWpn?=
 =?utf-8?B?TnJ3NmMyd0VuNkUzeGF3SjJ0ajRtbXU0MDhoOVpRTkw2b1BZTHE2akFOQXR1?=
 =?utf-8?B?aTIwTVZHZkJBa3RkbFNYR3FwYzJJN1NJZGMwZHhzalJLM0hUZFVDNy9VOWIr?=
 =?utf-8?B?VjdMWFRzd1pYdXFOVjhlR3FmWVlmUVhTcmZRQmwvZ2V6V0U5dTNEbTg4Nzdh?=
 =?utf-8?B?RUlBWE1WV01kQ29xT0ZxV3U3RElRNkVSUFd1L09WMGpQc1lTVnluNm4vMjFV?=
 =?utf-8?B?bmhnWmhRYVdYbE10bFN6U3VKdUxWOWFDSXpOdGdxS0o0NG84TkpHSmFRemJy?=
 =?utf-8?B?YWlTYXhlbURiZER2SDNyc0xpa3NZcUc4RkhpQ2liTWVMTjYxVkVoczgxaHoy?=
 =?utf-8?B?dWl0TGZkRDhpME1NU0w2bjJxTUg4WVdhOG9Lazk2Q0xJVkNUc3E4ZnF5b05q?=
 =?utf-8?B?ZG5vaHV4S2oxWUhkdGdnTmNkdnRGa0RGczBIMExJNnNDL2V1bWVheWhRNi9j?=
 =?utf-8?B?QUo5U3k0dW5pVWRwdmlHN0NOOVRDOG9rRW10aWVBNGhjV0x6NjJjb1gyNkhJ?=
 =?utf-8?B?Tk9vUXR6cUQram1lcXQyOXdJdzJsRWJEcU9lZmJFTVBRTlZFK2V0bzVqVTUy?=
 =?utf-8?B?NTNtdi9hTmhlTlowN1RvWFMycklKdXd4ekovWFpuSllYTytvem45SW5CTldu?=
 =?utf-8?B?Y2tia00rbjZOR3JiS1lxMjYrQlFlbmdVL3pKY1dEcE45UHY2UjZSd1FLRmJQ?=
 =?utf-8?B?M3RYVVFnU3RUblozU01wZ3E0NjBjUlZBRnd4dVI0aG5DQmc2anB5NitQZFdH?=
 =?utf-8?B?dDZaZ1NSZDBUSUZnMEgvUldOUmk1bW1OWmY4Umx6YVJmK0FId3hvWklKbXJp?=
 =?utf-8?B?M3ZXbVpCUENiVnNSUHZpd0dDbXVxdjZWUFRzTDY1Y0w3a0gxVTIwR1IxQXdt?=
 =?utf-8?B?bU5OT0FBQ0xwN2plbENqTVBTeVNySjZ6WEJvckFhYzE4aVJZZmlwSnNpVkth?=
 =?utf-8?B?T3kzblhPS3JjcHlUK0pwaHQ0aEMzeGV1ZnVKRjdUMmRIUldOS2trL09uQ3A0?=
 =?utf-8?B?S3FjUjJycEpXa3dITG1WQ1F1ZmpTY0tVekt5RldSOXpjdzlQT0g2SG9meGJM?=
 =?utf-8?B?TTMyT0xDTlRGa0xyU094c2JQazVOUEN4K3YrOXo0c2NadG9rQ2VoZXhpbmZB?=
 =?utf-8?B?Vk5UTlY3RkoxM0FNMHh3NGpSbWtYbzVuLzAxbTl1V3A4RUpRMVVnQUM0Z2Nk?=
 =?utf-8?B?ajdKc0RJLzVweVlZdUpLQlQvb08veWh3K1pqcC9hUERKRk9ZY2VmRkpheC8w?=
 =?utf-8?B?a0xkWTVOTVduR3gvc0tBWDUvU1IwTTZCTzhYN1B4Nmw2Z3YyTEtvdURzdFQ3?=
 =?utf-8?B?ek9pLzJIRk13TjcrYWNnNDdDZzdsYzIyRUFJdmNmMTBWaHVmNVNWWjFCS2x6?=
 =?utf-8?B?TExjRWQ4a2FRTGQzcWt2dzBvaDJEYktaYU9Qai9jcFMzODVscnNBU00vNWxY?=
 =?utf-8?B?S2xteHB4RzIzeFZuWHVxNCtvWm9SZlhSSlA4WXFhS1pZcmhlQXdUbkI3N2R2?=
 =?utf-8?B?V1NNOGhWeTNjMkQ5VnZSS0JNTFdNN2VkelVRdHZzeThZV1hkZDd5MmR3VGJ2?=
 =?utf-8?B?MmVLNFZQSHF4MWJ1VmdWaWE5ZTlWYVNVL0lmcFkrYnVNQ3BRUHU1bVFBWjV3?=
 =?utf-8?B?NmlNcjB2dGx4eGlVaXQwd2YzQVpHQ3RUMzN1TUk4NUlDNjFqeXFTSktNdXI5?=
 =?utf-8?Q?cbLmQ4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(10070799003)(376014)(366016)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVpVVmg3ckhERnRnOFlVcFd6UG5HNkw4azkyQW5saEpQa1QyNGlmSS9jTWJ5?=
 =?utf-8?B?QWVhMDFjM3hZbXNabTl4WGVrY1lOUE1lZ1E2a1J6YUhnMjFKOU0vVGQ5RnRT?=
 =?utf-8?B?MGdienh2VHMwS2lJcjU3cDk0eElEWHFpOUh6T05SSTJ2WWlrWTF4QWh1bHNJ?=
 =?utf-8?B?R3FiVnFmdCtja3VhdjZSNUUzK1RHR2F2OW1jMnlnMndHNWkvWlUzTG5IN2tF?=
 =?utf-8?B?WE5iaTE3MXZyYUtGVkw2eGc5RDBoWEtONE1ESjJhbWtlYzgvcjNiVmtnK0ht?=
 =?utf-8?B?Q3p2OStnWEFXR0Nhc3hRengzQWdOdXNkSHVuVnFZZG5LY29acVJuTkV0dVBR?=
 =?utf-8?B?dVlMN0pRWDljdGpkYXoxUUdBQVJMVUxyVGwzVXc3a0w3cXRjdG1KdlNYOHdF?=
 =?utf-8?B?cnpMdHl0dndVYndacCs1ckVWUnFZL3h1dWkxQnpEZ3lZTm1Cb3BwaDNFVGg3?=
 =?utf-8?B?VWwwR0ZPcm9uNWtMSHdOUXB5UzlFeC9YRzhKUDNBTnd2cjF2dGM3ZVJxdWlP?=
 =?utf-8?B?eUg3UlNnd09LeUxSOFN3RmdGWnpMbDdqUlVUNGlVajA2WnJSMnlEWnhwRG9w?=
 =?utf-8?B?VEZubFI4blM2UXNNYTc5TktxUXRMWUl1N3o4eFE1bUZ2bVExZmc0SFJqcFVB?=
 =?utf-8?B?c0RzVUlNdE9CR0dTMklGa3VxcjhSSVNWcWRuU3NpOEZTRm5wdFR6QWFxVm1x?=
 =?utf-8?B?R0JFRWN0eWFQVWpjNGVpb0U3SFpiU2x2V1BFMExmZHhmVDJ5OVRSd2U0cmp5?=
 =?utf-8?B?bEI1MEZwQzRiZTFrcDNTRGZIVEFzTERGdFd5UkVadXlGQXFVQkdiTjFTNDNX?=
 =?utf-8?B?STdzTGNRODFaNExnb1REenc1S0sxRE1DQktPem1DUUxINzQ1QVNmbGkvbDhT?=
 =?utf-8?B?TER4Umc5eTJPM1dzS3ZrcXpYTEFCSjdDZG15cUlyNEMzQjFzU2lka3VYdzB5?=
 =?utf-8?B?Ym9XZytRNUIyQk1CdlYveXBhdnlTRFhXUWF6SytVN1BQcjZRMGMycXg4K1Zj?=
 =?utf-8?B?VXZkRXNWNGFac0s5emg1SFVrVXRxMWI5WVIrd2F3d3ZlaGg4VjJKcmNhdmZ3?=
 =?utf-8?B?U05lOHhoQzZib0w3QVpaREtMTkhjMVVuS1ZKUGxrRlRoS3dHcktJU1NHNlJp?=
 =?utf-8?B?K09QVURBTzRVN2sreEVkczBpYzlwaFNnVFVBOERnWldTdUJBdGs0aUJEZjRa?=
 =?utf-8?B?V3poR01SaEYrRUc3cHBVMSsvSngwaEZMREVpTFVZZEV1eFhIT3Nnc1hLWlpE?=
 =?utf-8?B?ZVFrbWwxcExhTFZQazJtUUZRWTgxYVFuTko4OTYyMnNrSkdXNXI0TEZPcVlQ?=
 =?utf-8?B?NmdhSmszeXpKUmdLNjFNQkpObXBUcnIvUmt4R2JmUnJtdFZjdjZ5TnpPVXI4?=
 =?utf-8?B?NDFRUElzb2RURVJvVkE4NG9peFhsTVUwQUhwU2p6TjlnRnRaS3ZYV1ltTDFY?=
 =?utf-8?B?dVllS3NqeDlzL0d0WHFEMUR1Y3UwK3hLcTl3TUtIdURFOWhHeTZYNE9ZTEVY?=
 =?utf-8?B?SUMybEY4Q0ZyMW1xOFZNcFFPMEpTTTNubVZab1o4ZnpvU29zVnl2NG10aWw4?=
 =?utf-8?B?WjF1Y0hhSFZtdmpWK21uM2NuVHdsQ0RhMWkzZUx6RGpQbE1yTTlFN0VWM21r?=
 =?utf-8?B?STM0VTlyMjVzRkFJaHNpOW80Tk5FS2Nmdjl3aVBDTE04bDVxeEpBSG1McEFE?=
 =?utf-8?B?V3dKZDVvdlkwT01pNDlCRXA1Sk1waDJ1UTNNNUdNMmhOT2tkdlFqRWdBWXdt?=
 =?utf-8?B?U0lqOFBqZ0xWSkR4YmJnVWZFalAzMnRJaGh1dFloZHgzNW5OdVBQLzczdFhC?=
 =?utf-8?B?QXpoYzFjWTJHQy9lSThldldyam13dXFLQ0FQeER1RjlNWlgxRzhORDRyU0sx?=
 =?utf-8?B?RHd5dStFRVJGSEZiZWxaMFQybzdaU1A3c2VSeCtZTkZnRW1QeC84ejZaOFlF?=
 =?utf-8?B?WG1JK0ZpaXNLRTVabitMMHFNRFFJNmtSWkZDa2JBLy9CSFVsTnhoYURNdHc3?=
 =?utf-8?B?c1hLZ2R5aGVhM1VSbVJMOGE1ZkQzcjhiK0VialVCcDVpSlY3UGEvaHpUYmZt?=
 =?utf-8?B?QWhqY0k2ZWppWW5TN1JmakJhNEp1NnE1REZET3BwMnNyODlDQXhlYzFzd2JP?=
 =?utf-8?B?alZUbis2eXZJVW1aMCtWSXdEM0lYbUdOblNKMmpJUklROUdIR1d0cEdVYUU2?=
 =?utf-8?Q?UWqi0L1YlKhN8sFteWnl+2k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fccc2522-0209-48cd-0090-08de183df981
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 05:25:59.0846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBoGn8BvA2NhaF41biI9LiJ1+taFFUlwCWdQ+IPssPQnjn8w/iTDwFQi0WwC+U6tMRqTnDqpKlzbhELVNCOPxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VtbWVycywgU3R1YXJ0
IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDMw
LCAyMDI1IDEzOjUxDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgV2FuZywg
WCA8eC53YW5nQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAyLzJdIGxpYi9p
bnRlbF9kZXZpY2VfaW5mbzogUXVlcnkgcnVudGltZSB4ZSBkZXZpY2UNCj4gZ3JhcGhpY3MgdmVy
c2lvbnMNCj4gDQo+IE9uIE1vbiwgMjAyNS0xMC0yMCBhdCAyMzoxMiArMDAwMCwgWGluIFdhbmcg
d3JvdGU6DQo+ID4gRm9yIHBsYXRmb3JtcyB3aXRoIGdyYXBoaWNzX3ZlciA+PSAyMCwgcXVlcnkg
dGhlIHJ1bnRpbWUgeGUgZGV2aWNlIHZlcg0KPiA+IGluc3RlYWQgb2YgcmVseWluZyBzb2xlbHkg
b24gaGFyZGNvZGVkIHZhbHVlcyBmcm9tIHRoZSBQQ0kgZGV2aWNlDQo+ID4gdGFibGUuDQo+ID4g
VGhpcyBlbmFibGVzIGFjY3VyYXRlIElQIG1pbm9yIHZlcnNpb24gKGdyYXBoaWNzX3JlbCkgZGV0
ZWN0aW9uIGZvcg0KPiA+IHBsYXRmb3JtcyBsaWtlIFhlMiB3aGVyZSBkaWZmZXJlbnQgc3RlcHBp
bmdzIGhhdmUgZGlmZmVyZW50IElQDQo+ID4gdmVyc2lvbnMuDQo+ID4NCj4gPiBJbXBsZW1lbnRh
dGlvbiBkZXRhaWxzOg0KPiA+IC0gVXNlIHdlYWsgc3ltYm9sIGxpbmthZ2UgZm9yIHhlX2lwdmVy
X2NhY2hlX2xvb2t1cCgpIHRvIGhhbmRsZSBzdGF0aWMNCj4gPiDCoCBsaWJyYXJ5IGNvbXBpbGF0
aW9uIChsaWJpZ3RfY2hpcHNldC5hLCBsaWJpZ3RfZGV2aWNlX3NjYW4uYSkgd2l0aG91dA0KPiA+
IMKgIHhlX3F1ZXJ5LmMgZGVwZW5kZW5jaWVzIHdoaWNoIGFyZSB1c2VkIGZvciBpOTE1IHRvb2xz
IChpOTE1X3BlcmYgYW5kDQo+ID4gwqAgaW50ZWxfZ3B1X3RvcCkNCj4gPiAtIFByb3ZpZGUgYSB3
ZWFrIHN0dWIgdGhhdCByZXR1cm5zIE5VTEwgd2hlbiB4ZV9xdWVyeSBpcyBub3QgbGlua2VkDQo+
ID4gLSBGb3IgR2VuMjArIHBsYXRmb3JtcywgcHJlZmVyIHJ1bnRpbWUgeGUgZGV2aWNlIHZlcnNp
b25zIG92ZXIgc3RhdGljDQo+ID4gZGF0YQ0KPiA+IC0gRmFsbCBiYWNrIHRvIFBDSSB0YWJsZSBp
ZiB4ZSBkZXZpY2UgaW5mbyBpcyB1bmF2YWlsYWJsZQ0KPiA+IC0gUmVzZXQgY2FjaGUgb24gcXVl
cnkgZmFpbHVyZSB0byBhbGxvdyByZXRyeQ0KPiA+DQo+ID4gUmVtb3ZlIGhhcmRjb2RlZCBncmFw
aGljc19yZWwgZnJvbSBzdGF0aWMgdGFibGUgZW50cmllcyBmb3IgeGUgZGV2aWNlcw0KPiA+IGFz
IHRoZXkgd2lsbCBiZSBwb3B1bGF0ZWQgYXQgcnVudGltZSBmcm9tIEdNRF9JRC4NCj4gPg0KPiA+
IFRoaXMgdW5pZmllcyBkZXZpY2UgaW5mbyBoYW5kbGluZyBiZXR3ZWVuIGk5MTUgYW5kIHhlIGRy
aXZlcnMsDQo+ID4gZW5hYmxpbmc6DQo+ID4gLSBQbGF0Zm9ybS1zcGVjaWZpYyB3b3JrYXJvdW5k
cyBiYXNlZCBvbiBhY2N1cmF0ZSBJUCB2ZXJzaW9ucw0KPiA+IC0gQ29uc2lzdGVudCBkZXZpY2Ug
aW5mbyBBUEkgYWNyb3NzIGJvdGggZHJpdmVycw0KPiANCj4gSSdkIHBlcnNvbmFsbHkgZHJvcCB0
aGlzIHJlZmVyZW5jZSB0byB1bmlmaWNhdGlvbiBvZiBpbnRlcmZhY2VzLiBUaGUNCj4gaW1wbGVt
ZW50YXRpb25zIG9mIHRoZSBxdWVyeSBpbnRlcmZhY2VzIGJldHdlZW4geGUgYW5kIGk5MTUgYXJl
IGFscmVhZHkNCj4gZGlmZmVyZW50IGFuZCBjb3VsZCBkaXZlcmdlIGV2ZW4gZnVydGhlciBvdmVy
IHRpbWUsIHNvIHRoaXMgaXNuJ3QgYSB0cnVlDQo+IHVuaWZpY2F0aW9uIGFueXdheS4NCj4gDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaW4gV2FuZyA8eC53YW5nQGludGVsLmNvbT4NCj4gPiAt
LS0NCj4gPiDCoGxpYi9pbnRlbF9kZXZpY2VfaW5mby5jIHwgMjYgKysrKysrKysrKysrKysrKysr
KysrKystLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jIGIv
bGliL2ludGVsX2RldmljZV9pbmZvLmMgaW5kZXgNCj4gPiBhODUzZjlhYjQuLjg3YjEwNjliZSAx
MDA2NDQNCj4gPiAtLS0gYS9saWIvaW50ZWxfZGV2aWNlX2luZm8uYw0KPiA+ICsrKyBiL2xpYi9p
bnRlbF9kZXZpY2VfaW5mby5jDQo+ID4gQEAgLTMsNiArMywxNiBAQA0KPiA+IMKgI2luY2x1ZGUg
Imk5MTVfcGNpaWRzX2xvY2FsLmgiDQo+ID4NCj4gPiDCoCNpbmNsdWRlIDxzdHJpbmdzLmg+IC8q
IGZmcygpICovDQo+ID4gKyNpbmNsdWRlIDxzdGRkZWYuaD4NCj4gPiArI2luY2x1ZGUgPHN0cmlu
Zy5oPg0KPiANCj4gV2h5IGRvIHlvdSBuZWVkIHN0cmluZy5oIGhlcmU/DQoNCisjaW5jbHVkZSA8
c3RkZGVmLmg+ICAgPC0tIE5VTEwgZGVmaW5lDQorI2luY2x1ZGUgPHN0cmluZy5oPiAgICA8LS0g
bWVtY3B5KCkNCg0KVGhlIGNvbXBpbGVyIHdpbGwgcmVwb3J0IGVycm9yIHdpdGhvdXQgdGhlc2Ug
MiBoZWFkZXJzLg0KPiANCj4gPiArDQo+ID4gKy8qIFdlYWsgc3ltYm9sIHN0dWIgLSB3aWxsIGJl
IG92ZXJyaWRkZW4gaWYgeGVfcXVlcnkuYyBpcyBsaW5rZWQgKi8NCj4gPiArc3RydWN0IHhlX2Rl
dmljZV9pcHZlciAqeGVfaXB2ZXJfY2FjaGVfbG9va3VwKHVpbnQzMl90IGRldmlkKQ0KPiA+IF9f
YXR0cmlidXRlX18oKHdlYWspKTsNCj4gPiArDQo+ID4gK3N0cnVjdCB4ZV9kZXZpY2VfaXB2ZXIg
KnhlX2lwdmVyX2NhY2hlX2xvb2t1cCh1aW50MzJfdCBkZXZpZCkgew0KPiA+ICvCoMKgwqDCoMKg
wqDCoHJldHVybiBOVUxMOw0KPiA+ICt9DQo+ID4NCj4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
aW50ZWxfZGV2aWNlX2luZm8gaW50ZWxfZ2VuZXJpY19pbmZvID0gew0KPiA+IMKgwqDCoMKgwqDC
oMKgwqAuZ3JhcGhpY3NfdmVyID0gMCwNCj4gPiBAQCAtNTA1LDcgKzUxNSw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8NCj4gPiBpbnRlbF9wb250ZXZlY2NoaW9faW5m
byA9IHsNCj4gPg0KPiA+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyBp
bnRlbF9sdW5hcmxha2VfaW5mbyA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmdyYXBoaWNzX3Zl
ciA9IDIwLA0KPiANCj4gU29ycnkgaWYgSSdtIGNvbWluZyBpbiBsYXRlIGhlcmUuLi4gd2h5IGRv
bid0IHdlIGRvIHRoaXMgZm9yIGdyYXBoaWNzX3ZlciBhbHNvPw0KPiBUaGVuIGJlbG93IHlvdSBj
YW4ganVzdCBlaXRoZXIgY2hlY2sgaWYgZ3JhcGhpY3NfdmVyID09IDAgb3IgdXNlIGludGVsX2dl
bigpPw0KDQpTb21lIElHVCB0b29scyBkb27igJl0IGFjdHVhbGx5IG9wZW4gdGhlIHhlIGRldmlj
ZSBidXQgc3RpbGwgbmVlZCB0byBhY2Nlc3MgaW50ZWxfZ2V0X2RldmljZV9pbmZvKCkuIEluIHRo
b3NlIHRvb2xzLCB0aGUgbWlub3IgdmVyc2lvbiBpc27igJl0IHJlbGV2YW50Lg0KVGhlIG1ham9y
IHZlcnNpb24gZG9lc27igJl0IGNoYW5nZSBhY3Jvc3MgZGlmZmVyZW50IGRldmlkcyB3aXRoaW4g
dGhlIHNhbWUgaW50ZWxfZGV2aWNlX2luZm8gc3RydWN0LCBzbyBrZWVwaW5nIGl0IGhlcmUgd29u
4oCZdCBjYXVzZSBhbnkgaXNzdWVzLg0KDQo+IA0KPiA+IC3CoMKgwqDCoMKgwqDCoC5ncmFwaGlj
c19yZWwgPSA0LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuZGlzcGxheV92ZXIgPSAyMCwNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgLmhhc180dGlsZSA9IHRydWUsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5o
YXNfZmxhdGNjcyA9IHRydWUsDQo+ID4gQEAgLTUxNyw3ICs1MjYsNiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGludGVsX2RldmljZV9pbmZvDQo+ID4gaW50ZWxfbHVuYXJsYWtlX2luZm8gPSB7DQo+
ID4NCj4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gaW50ZWxfYmF0
dGxlbWFnZV9pbmZvID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuZ3JhcGhpY3NfdmVyID0gMjAs
DQo+ID4gLcKgwqDCoMKgwqDCoMKgLmdyYXBoaWNzX3JlbCA9IDEsDQo+ID4gwqDCoMKgwqDCoMKg
wqDCoC5kaXNwbGF5X3ZlciA9IDE0LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuaGFzXzR0aWxlID0g
dHJ1ZSwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmhhc19mbGF0Y2NzID0gdHJ1ZSwNCj4gPiBAQCAt
NTI5LDcgKzUzNyw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8NCj4g
PiBpbnRlbF9iYXR0bGVtYWdlX2luZm8gPSB7DQo+ID4NCj4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaW50ZWxfZGV2aWNlX2luZm8gaW50ZWxfcGFudGhlcmxha2VfaW5mbyA9IHsNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgLmdyYXBoaWNzX3ZlciA9IDMwLA0KPiA+IC3CoMKgwqDCoMKgwqDCoC5ncmFw
aGljc19yZWwgPSAwLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuZGlzcGxheV92ZXIgPSAzMCwNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgLmhhc180dGlsZSA9IHRydWUsDQo+ID4gwqDCoMKgwqDCoMKgwqDC
oC5oYXNfZmxhdGNjcyA9IHRydWUsDQo+ID4gQEAgLTY3NSw2ICs2ODIsOCBAQCBjb25zdCBzdHJ1
Y3QgaW50ZWxfZGV2aWNlX2luZm8NCj4gPiAqaW50ZWxfZ2V0X2RldmljZV9pbmZvKHVpbnQxNl90
IGRldmlkKQ0KPiA+IMKgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdGF0aWMgX190aHJlYWQgY29u
c3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvICpjYWNoZSA9DQo+ID4gJmludGVsX2dlbmVyaWNf
aW5mbzsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RhdGljIF9fdGhyZWFkIHVpbnQxNl90IGNhY2hl
ZF9kZXZpZDsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdGF0aWMgX190aHJlYWQgc3RydWN0IGludGVs
X2RldmljZV9pbmZvIHhlX2Rldl9pbmZvOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9k
ZXZpY2VfaXB2ZXIgKmlwdmVyOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnQgaTsNCj4gPg0KPiA+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoY2FjaGVkX2RldmlkID09IGRldmlkKQ0KPiA+IEBAIC02ODks
NiArNjk4LDE3IEBAIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbw0KPiA+ICppbnRlbF9n
ZXRfZGV2aWNlX2luZm8odWludDE2X3QgZGV2aWQpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGNhY2hl
ZF9kZXZpZCA9IGRldmlkOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBjYWNoZSA9ICh2b2lkICopaW50
ZWxfZGV2aWNlX21hdGNoW2ldLm1hdGNoX2RhdGE7DQo+ID4NCj4gPiArwqDCoMKgwqDCoMKgwqBp
ZiAoY2FjaGUtPmdyYXBoaWNzX3ZlciA+PSAyMCkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpcHZlciA9IHhlX2lwdmVyX2NhY2hlX2xvb2t1cChkZXZpZCk7DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChpcHZlciAmJiBpcHZlci0+ZGV2aWQgPT0g
ZGV2aWQpIHsNCj4gDQo+IFdoYXQgaXMgdGhlIGV4cGVjdGF0aW9uIGlmIHdlIGRvbid0IGxpbmsg
aW4geGVfcXVlcnkuYz8gU2VlbXMgbGlrZSBpdCB3b3VsZCBiZQ0KPiBiZXR0ZXIgdG8ganVzdCBt
YWtlIHRoaXMgYSBoYXJkIHJlcXVpcmVtZW50PyBPciBzaW5jZSB0aGVyZSBpcyBhIGRlcGVuZGVu
Y3kNCj4gaGVyZSBvbiBpZ3RfZGV2aWNlX2dldCgpL3B1dCgpIHdlIHN0aWxsIHdhbnQgdGhpcyBi
YWNrdXAgaWYgd2UgZG9uJ3QgY2FyZSBhYm91dA0KPiB0aGUgdmVyc2lvbnM/DQo+IA0KU2luY2Ug
dGhpcyBmaWxlIGdldHMgbGlua2VkIGFzIGEgc3RhbmRhbG9uZSBsaWIgaW4gSUdULCBzb21lIGk5
MTUgdG9vbHMgYWxyZWFkeSBkZXBlbmQgb24gaXQuIA0KRm9yY2luZyB4ZV9xdWVyeS5jIGludG8g
dGhlIGxpbmsgd291bGQgcmVxdWlyZSBhIGxvdCBvZiBjaGFuZ2VzLCBhbmQgdGhvc2UgdG9vbHMg
ZG9u4oCZdCBiZW5lZml0DQpmcm9tIHhlX3F1ZXJ5LmMgYW55d2F5LiBJ4oCZZCBwcmVmZXIgbm90
IHRvIHRvdWNoIGk5MTUgdG9vbHMgdGhhdCBoYXZlIGJlZW4gc3RhYmxlIGFuZCB3b3JraW5nIGZv
ciB5ZWFycy4NCg0KDQo+IFRoYW5rcywNCj4gU3R1YXJ0DQo+IA0KPiANCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1lbWNweSgmeGVfZGV2X2luZm8s
IGNhY2hlLCBzaXplb2Yoc3RydWN0DQo+ID4gaW50ZWxfZGV2aWNlX2luZm8pKTsNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Rldl9pbmZvLmdy
YXBoaWNzX3ZlciA9IGlwdmVyLQ0KPiA+ID5ncmFwaGljc192ZXI7DQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9kZXZfaW5mby5ncmFwaGljc19y
ZWwgPSBpcHZlci0NCj4gPiA+Z3JhcGhpY3NfcmVsOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FjaGUgPSAmeGVfZGV2X2luZm87DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjYWNoZWRfZGV2aWQgPSAwOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+
IMKgb3V0Og0KPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gY2FjaGU7DQo+ID4gwqB9DQoNCg==
