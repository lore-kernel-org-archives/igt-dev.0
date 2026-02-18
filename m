Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAABE9A02C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 17:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254C010E606;
	Wed, 18 Feb 2026 17:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LR0Ej4A1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFCF10E60C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771434624; x=1802970624;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=piDhiL2RzUgY70+cpP6SaR+ZS7YRsf4tPUR+wv1vEAE=;
 b=LR0Ej4A18h6QKpgayXMif9Gd6ujFngWWDko9Wo/siwobrgzApaIZ3ipd
 VFkM3tQHBufsfQgsHjvgqUhiS4bGhu+EmUrMW06zieJqZsftB3EpdikGV
 Q8MTB8pGeL55ynkS4QNxPuegXpaHXD9cmGzQDYhlKrFNYx1tMnNnv/TsU
 cRGc8YA2inOYTYzB1Wz34zFeS9imAubst8//0Zk04X44iJKwzEhsSW30t
 WO05+40Ogg7q+zQlVXk3X4sCpUwYY072gBhFR+hgamS+5BQ77WknyWPiX
 EkLO4MOzjs9rXN7I4pAddl7riM3QyJj/2bZNIJKXNvDy67H0LBvpJ+ZM4 Q==;
X-CSE-ConnectionGUID: xLwibKdRSU2Z2QaE+in42w==
X-CSE-MsgGUID: Wy/7wYcRTuiP31saoJMQHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83232680"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83232680"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 09:10:24 -0800
X-CSE-ConnectionGUID: oFwkLeUhRFyUva7u6/SENQ==
X-CSE-MsgGUID: CiwshdBGQW6EmzVVvKjBgA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 09:10:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 09:10:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 09:10:23 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 09:10:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBrRjnoddMUR7XZKXrR6QWH0CNoap55jpPWH+tQ4zWG4UpAIbVM4ckeZ+cmn4ivfH8Y7R4BvHo8IInUHktKHLS8RWo06SP87gQk7v9hpazWmWbPV9/VtBLR09LfM1cParPrRbY3Ojxil8TYsAST5oKVz7kMwGvFzOYd5d4g1uY9xpFdxp+8jamFnRm03AmMbswhvZaPaS4G/i69MoDb8XUsMZIfVRnhIXhxthSqzkCtW6nDY8FGVpEnfRv6ZVuudrAz8xrywYbRiWuufmtLRoIks3rmIw/fQ1y5nVehUbCzSCFaS/Li92gDxoJWET8SWD23DfLA5qiunvP0PKkxQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTvh5hCYxqrTG35zrhoFJz5GijWe6gdKSx4WNU/QGt4=;
 b=dGT2eSZ7cqre8j5G+UGzRgmgxr+dqAq6FW5/Uh93HTPEcm5MCAbS1tSvuWQwXvWXLPXx5zPmOIukSLTVzrO5gN94ScrqawGOcX0nUULYn5Rw2O221k/aGfOasHirvwABqfdHUBQNshQQdK8pgzHmozNApWffucijwG1Emxn0IbfDoYC1Lm0Fg0sKkDx7tUhA1ZKsyl9gBUspq37IimfReXhMQjYIRK5JFuBglk1xFFlIAPaBSmQMq29ElH3PBSlmdVGDLm4IDgwepeTZDy0tzTqvKbMWBqB17d6b6/bL5rNlLHIDj6+oQjCHZwd6Sa3kYHihMJ9SP+gExpUDN0Xmlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 17:10:19 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:10:19 +0000
Message-ID: <d0e05125-371c-41bd-bfea-ae5739ce8a09@intel.com>
Date: Wed, 18 Feb 2026 22:40:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 4/5] tools/gputop.src/gputop: Enable support for
 multiple GPUs and instances
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <ashutosh.dixit@intel.com>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20260130095318.644256-1-soham.purkait@intel.com>
 <20260130095318.644256-5-soham.purkait@intel.com>
 <0bd96bbc-fd89-4b04-a203-8784a5d9701c@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <0bd96bbc-fd89-4b04-a203-8784a5d9701c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::15) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CY8PR11MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe383a8-2f28-4e2c-9de9-08de6f1097eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmFTNVB0a2NsSDd2MGRKL2dSam9tMlFPdUpZOFFENjhpS25XeTBEME5tbm1h?=
 =?utf-8?B?aDFTeENkQm1tYThab1dpSEdGbXZYRTBKQVdUZVJ3UHdHZFdkS1N4K0s1Y1dE?=
 =?utf-8?B?ejJ1VjAzNCtCeFJNK0IvRjFBcjFOZnU4QnA3aFZGVFNpZ2FKdGJqTHF2S3ox?=
 =?utf-8?B?dFQ4K2FIR2VoM1BtSzhZUFZRdHo1VHJFS0VGMlJNRi9hZjNyby95WTVETTMv?=
 =?utf-8?B?QlFZQVdqRDEvVXlXZVN5amNaWXpadWsvTFcrSC82c3E5c0xoTE9vZk83RE8z?=
 =?utf-8?B?NkZzSHhJWWpaSHVhYjdZRlp6UEtpWG5USU43YVl3VGJ2MmFQcStBb2NVL0tZ?=
 =?utf-8?B?K1V2WEhUWG9lNDRSY3VTWlFHY2wxRGNvOTRrS3RyTjJURmdYczl1TVRpd2pN?=
 =?utf-8?B?ZmZkRnZLeWU1N0dOcC8weTJ0THorSWg5d3g1UU44ajEyRGxOdjlBMUF6OWhY?=
 =?utf-8?B?ZzRLUTFJZ3kza3RUcUZJbWlpWWY5YXFPMjB4dnFzaW5kek5BbExpejB5SkIz?=
 =?utf-8?B?S054aVliNmhtdnlkU24zdUlRdGRVaG9XYjh3TmxmWFNLZXB4R3M4NUJNa2dm?=
 =?utf-8?B?QTB2Yk5qYStJWFduK0xFcUFsdTVGVGRYYTRBcFRQTEVhaGZaOGZicjBLMWJ2?=
 =?utf-8?B?MVVjU2JmbnZ1Sk15SmpPeWwrdFcvV3NOaEhSSXJSM3pVSk53OEtrZVROS3Y5?=
 =?utf-8?B?UzJ4TUcyUmx3bW0wbUZ5RXpMeXJNTm9HamtWcitxVGxzdEJPWDNtWkYySWRa?=
 =?utf-8?B?Q2ErcmhIaDlBWUNXdENRTVI3ZHk2V1lKOGZVNG5Dd3pXVC9Vd1lxR3I2am1k?=
 =?utf-8?B?V2dNbTBvQ0MydnBBNXVYNnkzNTQraUt2S3JiaTNMVDI2ZGQwRUdpWHZLQTR6?=
 =?utf-8?B?V1U1S0dGOGxYVjlBMXpRZlJ3ZHYyQ2YvbGlzZGZabGtsTmdNUUtweC9rcGxy?=
 =?utf-8?B?UlhESHNxeXNDb1M4SW80dzZ3dXZaWk5tdk9ZUVlmVDB0MXZNcmxHSzRUVTRr?=
 =?utf-8?B?Z2hHQ2NWR0tUK08rYVc2Skt0RGVsVkxrajJURFErT3NINHFTL1NGQklCRFV4?=
 =?utf-8?B?NG1NWHZpN1RhcXhVY01TRFNoM3M2NUtsSWNxS2ppeFhUWGFxZUVRc0prQlM0?=
 =?utf-8?B?cUhLSjhHNVk0SE1UenVIZWExNHdWeXZmWEJBTndEMjdWbWgzWHU4bnNZby9p?=
 =?utf-8?B?Uzh5RGw0anM5cjRGN04wMWxNZUowUytEM1JiUFluem96T2FoUVp4R2JXRHBW?=
 =?utf-8?B?U0ZlSU5MZHI3S0tsdXRCZmlzMlcwQzE4dFNOVjZWOWtzOTZSYXo0Y0QramlJ?=
 =?utf-8?B?b2xhNmxPd2JFcDZ6VVQrQ2VYcVpRSHZ4RkxVRzREVWNZck5qazNDdEtoL2ls?=
 =?utf-8?B?QXRkMk1JeisxR3YzTks3d2x5QnBOUWQ5azU0YnJoYmhCcjdvSGZCQThydktk?=
 =?utf-8?B?cjdZS2ZwTjdLUlRpVlpFUHRucTgzMG1IOTJlZFBhOGZWQkVtYkJNTmVsdnhF?=
 =?utf-8?B?cjRZYWIvc2dKRUNXOHB2V0tCTERZZGtqUmxEWkFQVmJSYWRKeEJYSVdtMVla?=
 =?utf-8?B?R28zR0pvNnR5WjZLS1NhdXZOL0REbkpqR0NJaFN0TjNPTHBudWV1NWRMMzhs?=
 =?utf-8?B?TEw5VGJwU000aUpUQVoyWmZPa21yNlJDcXl2WjVTMDZaS2U4Q3BKMCtGc0dT?=
 =?utf-8?B?bHBsVWZ1SkRLYmJjYWVUWVY0V3NZajBRaytQZlZsTkYxcG92RkdwQUxjc09Z?=
 =?utf-8?B?UDNRT3Q5bTNlQlBuMTRSQWI2NWZJdWFLTm5Lc3RFU0hRQVRoV1hJUG4zMDZY?=
 =?utf-8?B?QWtLRUNMQ0lsR3ZGV1JPSTIwZGxyTzVFNmJUcm80dGR1VExXR1NYOU8vY2Np?=
 =?utf-8?B?Z1FOUVZYVFBuSXJ5K1VXdTNDSTdKMTBWRHFyNVkzeGU1MllyM243S21GRHVm?=
 =?utf-8?B?WkdDaHlLaDVub1hJRnlMRkVHU2ZSbTJqd25WdW5KeGttSlhwbUhLUDBVMmRi?=
 =?utf-8?B?ZWliOTBUeXZXT3dVMFhJcW56eTJLS1lYQVBNemhjYnpadHl0dnVqSHRrZC8y?=
 =?utf-8?B?VjhvaWRyUDFjeUF1S21TMGZoRzQ3L2NaNnBmWG83YU1GSzE3cHdaUGVuZUxm?=
 =?utf-8?Q?r/uLzlD7D3yrRmdJiMpA18uJ+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFpWRkJpNm02cFcySFprQzM0Z04vRDIrZ2xXNGJCTVdtL2JOcStaNHloaDRt?=
 =?utf-8?B?VUtHZmZlWU9MN1ZFaDN0ZzB2eHZSWGZKRlVYaWNNL2p6M3ZIRTRleER4N21O?=
 =?utf-8?B?TG80bWxKSVlScTRlK1VxMGpaSlZmYm4wcEgzUkdlcmFVNFdlczZyOW1kZW9s?=
 =?utf-8?B?TGNNa2M5dmJwZFUwbTUzaTEyM3lWdEFiQjluVUtiY0hNRVZQc2Ruckc1QURy?=
 =?utf-8?B?ZnplU0xjM0ZzdWhqekNQRndyZVBNYS8yS2NhSmxUeTlJaU9KQkt6ZnBhTU02?=
 =?utf-8?B?MGxjRHBSKzV5ZFJIZ2s4b3ZTSTZTNldRcTFnd05SdjRlN2ZzSFlMTXJJMzI4?=
 =?utf-8?B?cTJwLzdBcUZ4QUVPQ3NZWlRDTFpLeEMvSVNKc0tMUDYyZXZVdWdTMzV5YnVG?=
 =?utf-8?B?TGRyZjNjMmJGSmNsR2k4YWpia09rU1VhYWZ3MEo2RVVkYlpHVnlPeUhFbHFW?=
 =?utf-8?B?d2x3blFoYy9NT1gyYTNNaU1xSmtidWQ3Q1ZqclJ0dGtXUHByZC93Z25CQUxu?=
 =?utf-8?B?Y0E4K01SL2dhWFIrUTNzOFp3R1l6eHd1dTVFSTRuZ0FaMHhTeHovbUNqMllD?=
 =?utf-8?B?S3FXUHNHbTQrWVdvZW1NZExLVTlVRmxPVFQ0SHgxTDUwMEJaQTlCbVZ6MnVC?=
 =?utf-8?B?TXlPeStaRjVXMFlsRnNxajFMd2wrMFdXZy9NM0ZwVHpKUkRIYjRVS2Y0ZFJp?=
 =?utf-8?B?QzRpcE9Nbmw5dzRqTHJpeTZKdEJoTVFuV3FqcG5vY3YwV2RJd2g3d0JpUU83?=
 =?utf-8?B?Mll2aFZZbTBhN20wSlh0U082SHpCbGUxTWlzdllqSnF2K1lNUWozT2NvWTN2?=
 =?utf-8?B?NVJSaExURVdXajB4eXBncW1YTGVVYTVkdDdldjhrYkhGOXkwQUlNWjlTNXhp?=
 =?utf-8?B?ZjZwM3J0d1FJVG9kSzlkUC9KdzZoNXdXVS9oMVp6K2MzVm9BbUhvTFc2S1U5?=
 =?utf-8?B?QVRGd092Qy9BdXNqR2FnRitYQWhXdkZQOVI0Q29QQ2hDeVB3VXU4anI4Y0hW?=
 =?utf-8?B?Q1NZbVNiWnlDb2JzQ2V5elpHYzk2UFhDTG4zVTlkQzFlRktpRU1jb28rd0pl?=
 =?utf-8?B?RnNic1o0Z1VBMDJtZTNBakNxOUtHVlRzdTVVQ0F2ZWNjK2lvQXRTU21lL3pa?=
 =?utf-8?B?N3gyR1l0SE4rOWhZY0hLdTdLc2w4dUZtOG1yNFM3TjdtUFBuZXZXazZHVnRi?=
 =?utf-8?B?UlQxZmhoMG91b2grTGdwVTZaSVh4UHVFQWdHMWd4bUpzOU5iVDFJajUzSWVC?=
 =?utf-8?B?ZEUvTGo1cThZRitIb1UySmo0N2ZVSmU1M3FQZnhleDBKNmdpeFMxOExWQ1M1?=
 =?utf-8?B?SUM0NVg5dTB2UGthOFdSZVZGUlVwRlhFUUxIdGMvT0M4K1JTNHJ6bkE0N3BE?=
 =?utf-8?B?ZlFwZ3dCb1JZYTAxOXFQRW5xd21neDJ3MHJZcC9jQ1pJUnNRNmFoU0JSUzB5?=
 =?utf-8?B?bkdIbEdJMCthbWp0dnc1M1R1WFBvQ1FRUDlQWC96QlZMR2R4TGt4U0NHM3Yw?=
 =?utf-8?B?VGdyMUVPYmRjOFVCSFhJN3htdzd2Z09QaW9kUTRScmMrVThMcWZ2NExLNjZG?=
 =?utf-8?B?ZnZmV1g1aTB4QmhST3M4MWFDdDAvYWxiNElLVzVoZjZ6VzVSaU1saW50ODdm?=
 =?utf-8?B?eVhFcTE1VS9jM1h4SG1EOVdmOVM5NnVSdnB1K2NzUURkMGZ5MGpiZ2NydE8w?=
 =?utf-8?B?cElXYkhnNzNacFdycU84WDViZ2hldkVJQVR6ZW1wNjBEazYrZ2FMRHl2RE1k?=
 =?utf-8?B?YVNzYVVpRlZKYkVWSkgyY1B3bGNPWXJBME9qNHlTbnVCSVA5TjJ2cC9KR1Bs?=
 =?utf-8?B?UnlSYkJGUWVkV3VZT2NPK3pOL2VmQmtRZmhGa2l3bzBDK0N5UjZ5ZlRjaHlX?=
 =?utf-8?B?T0dXd1JXRUlNVldjQlNvdVFjeXpsekFjYkVxcHlnSC9zNGZmRW1yRzRBUkxJ?=
 =?utf-8?B?VjF0VzBPMVNEdGtsdWh1QTFyQWZ1NTh1WGp4VnBkeERuSWJnTHIwUndPSG5R?=
 =?utf-8?B?M2RRdHZvYjlsTzV3NXJjNDgxS1NHOE1jbjZzeVpic3h5UmQvRDRlOEJZOUR4?=
 =?utf-8?B?VUhkQzVJMUFUZmc1VWFlVTBKbmdDWW9lRWFRdHZwV1pSbEtpc0NrcVF4c1JD?=
 =?utf-8?B?SlF5d3BuQ1JxczlUNmV1NW80blhHOExvalhVR3ZGRm15Vm82K1A0RkNHdy9Y?=
 =?utf-8?B?dGNGU0QrY1E1dkJEbjZoMzdUQUVGd3FWQ1RjUC81dS9ZV2NQK3Z3U2g5Q0h6?=
 =?utf-8?B?RjFZMGJTZXU4YmpTRkFmSVdYSERjYVhENFhKbjhySXFOclBjZDNoWmFNVGhP?=
 =?utf-8?B?WHJFZkF6eXdvVUZ4T1VheGxSTWRFazArY3pORWkrYzM3cysybEtKdkFtSFhn?=
 =?utf-8?Q?7FhkrZLSMxsH/YP8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe383a8-2f28-4e2c-9de9-08de6f1097eb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 17:10:19.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCvzb1y+jRZzhSmwWPIqo32N7Z9iqg+gWRi4d04pyVCaMt0OUz2nXu8VNwohfyPhBKAP5DrNYGjCjsfWF9ej2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083
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

Hi Vinay,

On 13-02-2026 04:58, Belgaumkar, Vinay wrote:
>
> On 1/30/2026 1:53 AM, Soham Purkait wrote:
>> Introduce vendor-agnostic support for handling multiple GPUs and
>> instances in gputop. Improve the tool's adaptability to various GPU
>> configurations.
>>
>> v1:
>>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>> v2:
>>   - Cosmetic changes. (Riana)
>>   - Avoid three level indentation. (Riana)
>> v3:
>>   - Add device filter to populate the array of cards for
>>     all supported drivers. (Zbigniew)
>> v4:
>>   - Add user message for running without root privileges. (Kamil)
>> v5:
>>   - Add support for GPU client-only busyness on unsupported
>>     drivers as a fallback mechanism. (Kamil)
>> v6:
>>   - Remove unused dependencies and headers. (Kamil)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tools/gputop.src/gputop.c    | 278 +++++++++++++++++++++++++++++------
>>   tools/gputop.src/meson.build |   2 +-
>>   tools/meson.build            |   3 +-
>>   3 files changed, 240 insertions(+), 43 deletions(-)
>>
>> diff --git a/tools/gputop.src/gputop.c b/tools/gputop.src/gputop.c
>> index f577a1750..7d4515f8f 100644
>> --- a/tools/gputop.src/gputop.c
>> +++ b/tools/gputop.src/gputop.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2023 Intel Corporation
>> + * Copyright © 2023-2025 Intel Corporation
>>    */
>>     #include <assert.h>
>> @@ -14,66 +14,145 @@
>>   #include <math.h>
>>   #include <poll.h>
>>   #include <signal.h>
>> +#include <stdbool.h>
>>   #include <stdint.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <sys/ioctl.h>
>>   #include <sys/stat.h>
>> +#include <sys/sysmacros.h>
>>   #include <sys/types.h>
>> -#include <unistd.h>
>>   #include <termios.h>
>> -#include <sys/sysmacros.h>
>> -#include <stdbool.h>
>> +#include <unistd.h>
>>   -#include "igt_core.h"
>>   #include "igt_drm_clients.h"
>>   #include "igt_drm_fdinfo.h"
>>   #include "igt_profiling.h"
>> -#include "drmtest.h"
>> +#include "xe_gputop.h"
>> +
>> +/**
>> + * Supported Drivers
>> + *
>> + * Adhere to the following requirements when implementing support 
>> for the
>> + * new driver:
>> + * @drivers: Update drivers[] with driver string.
>> + * @sizeof_gputop_obj: Update this function as per new driver 
>> support included.
>> + * @operations: Update the respective operations of the new driver:
>> + * gputop_init,
>> + * discover_engines,
>> + * pmu_init,
>> + * pmu_sample,
>> + * print_engines,
>> + * clean_up
>> + * @per_driver_contexts: Update per_driver_contexts[] array of type 
>> "struct gputop_driver" with the
>> + * initial values.
>> + */
>> +static const char * const drivers[] = {
>> +    "xe",
>> +    /* Keep the last one as NULL */
>> +    NULL
>> +};
>> +
>> +static size_t sizeof_gputop_obj(int driver_num)
>> +{
>> +    switch (driver_num) {
>> +    case 0:
> Might be worthwhile using an enum like INTEL_XE_DRIVER instead of 
> hardcoded values.
>> +        return sizeof(struct xe_gputop);
>> +    default:
>> +        fprintf(stderr,
>> +            "Driver number does not exist.\n");
>> +        exit(EXIT_FAILURE);
>> +    }
>> +}
>> +
>> +/**
>> + * Supported operations on driver instances. Update the ops[] array for
>> + * each individual driver specific function. Maintain the sequence 
>> as per
>> + * drivers[] array.
>> + */
>> +struct device_operations ops[] = {
>> +    {
>> +        xe_gputop_init,
>> +        xe_populate_engines,
>> +        xe_pmu_init,
>> +        xe_pmu_sample,
>> +        xe_print_engines,
>> +        xe_clean_up
>> +    }
>> +};
>> +
>> +/*
>> + * per_driver_contexts[] array of type struct gputop_driver which 
>> keeps track of the devices
>> + * and related info discovered per driver.
>> + */
>> +struct gputop_driver per_driver_contexts[] = {
> This is already per driver, no need to add that in the name? just 
> driver_context or pci_driver_context? Also, where is gputop_driver 
> struct defined? (Didn't find it in this patch set)
>> +    {false, 0, NULL}
>> +};
>>     enum utilization_type {
>>       UTILIZATION_TYPE_ENGINE_TIME,
>>       UTILIZATION_TYPE_TOTAL_CYCLES,
>>   };
>>   -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", 
>> "▉", "█" };
>> -
>> -#define ANSI_HEADER "\033[7m"
>> -#define ANSI_RESET "\033[0m"
>> -
>> -static void n_spaces(const unsigned int n)
>> +static void gputop_clean_up(void)
>>   {
>> -    unsigned int i;
>> -
>> -    for (i = 0; i < n; i++)
>> -        putchar(' ');
>> +    for (int i = 0; drivers[i]; i++) {
>> +        ops[i].clean_up(per_driver_contexts[i].instances, 
>> per_driver_contexts[i].len);
>> +        free(per_driver_contexts[i].instances);
>> +        per_driver_contexts[i].device_present = false;
>> +        per_driver_contexts[i].len = 0;
>> +    }
>>   }
>>   -static void print_percentage_bar(double percent, int max_len)
>> +static int find_driver(struct igt_device_card *card)
> should be find_pci_driver?
>>   {
>> -    int bar_len, i, len = max_len - 1;
>> -    const int w = 8;
>> -
>> -    len -= printf("|%5.1f%% ", percent);
>> -
>> -    /* no space left for bars, do what we can */
>> -    if (len < 0)
>> -        len = 0;
>> -
>> -    bar_len = ceil(w * percent * len / 100.0);
>> -    if (bar_len > w * len)
>> -        bar_len = w * len;
>> +    for (int i = 0; drivers[i]; i++) {
>> +        if (strcmp(drivers[i], card->driver) == 0)
>> +            return i;
>> +    }
>> +    return -1;
>> +}
>>   -    for (i = bar_len; i >= w; i -= w)
>> -        printf("%s", bars[w]);
>> -    if (i)
>> -        printf("%s", bars[i]);
>> +static int populate_device_instances(const char *filter)
>> +{
>> +    struct igt_device_card *cards = NULL;
>> +    struct igt_device_card *card_inplace = NULL;
>> +    struct gputop_driver *driver_entry =  NULL;
>> +    int driver_no;
> should this be driver_num or driver_id?
>> +    int count, final_count = 0;
>> +
>> +    count = igt_device_card_match_all(filter, &cards);
>> +    for (int j = 0; j < count; j++) {
>> +        if (strcmp(cards[j].subsystem, "pci") != 0)
>> +            continue;
>>   -    len -= (bar_len + (w - 1)) / w;
>> -    n_spaces(len);
>> +        driver_no = find_driver(&cards[j]);
>> +        if (driver_no < 0)
>> +            continue;
>>   -    putchar('|');
>> +        driver_entry = &per_driver_contexts[driver_no];
>> +        if (!driver_entry->device_present)
>> +            driver_entry->device_present = true;
> is this check only for reassignment of device_present or should it 
> include the below statements as well?
>> +        driver_entry->len++;
>> +        driver_entry->instances = realloc(driver_entry->instances,
>> +                          driver_entry->len * 
>> sizeof_gputop_obj(driver_no));
> should this be renamed to driver_entry->engine_instances so we are 
> clear about which instances this refers to?
>> +        if (!driver_entry->instances) {
>> +            fprintf(stderr,
>> +                "Device instance realloc failed (%s)\n",
>> +                strerror(errno));
>> +            exit(EXIT_FAILURE);
>> +        }
>
> should these be under the conditional if check above as well? Or will 
> we end up incrementing len twice and duplicate realloc? Unless this 
> refers to driver instances?

I guess no. The  device_present (for a specific driver) is set to true 
only once during the 1st device discovery of that specific driver. After 
that if any more device of that driver is present it is not touched but 
len does increases accordingly.

Thanks,
Soham

>
> Thanks,
>
> Vinay.
>
>> +        card_inplace = (struct igt_device_card *)
>> +                calloc(1, sizeof(struct igt_device_card));
>> +        memcpy(card_inplace, &cards[j], sizeof(struct 
>> igt_device_card));
>> +        ops[driver_no].gputop_init(driver_entry->instances, 
>> (driver_entry->len - 1),
>> +            card_inplace);
>> +        final_count++;
>> +    }
>> +    if (count)
>> +        free(cards);
>> +    return final_count;
>>   }
>>     static int
>> @@ -335,6 +414,28 @@ struct gputop_args {
>>       unsigned long delay_usec;
>>   };
>>   +static void countdown(const char *msg, const int start_sec)
>> +{
>> +    struct pollfd pfd;
>> +    int i, ret;
>> +    char ch;
>> +
>> +    for (i = start_sec; i > 0; i--) {
>> +        printf("\r%s%d... second(s)", msg, i);
>> +        fflush(stdout);
>> +
>> +        pfd.fd = STDIN_FILENO;
>> +        pfd.events = POLLIN;
>> +
>> +        ret = poll(&pfd, 1, 1000);
>> +        if (ret > 0 && (pfd.revents & POLLIN)) {
>> +            while ((ch = getchar()) != '\n' && ch != EOF)
>> +                continue;
>> +            return;
>> +        }
>> +    }
>> +}
>> +
>>   static void help(char *full_path)
>>   {
>>       const char *short_program_name = strrchr(full_path, '/');
>> @@ -349,7 +450,32 @@ static void help(char *full_path)
>>              "Options:\n"
>>              "\t-h, --help                show this help\n"
>>              "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS 
>> [.TENTHS]\n"
>> -           "\t-n, --iterations =NUMBER  number of executions\n"
>> +           "\t-n, --iterations =NUMBER  number of executions\n\n"
>> +           "Running without root:\n"
>> +           "\tAs a non-root user, CAP_PERFMON or perf_event_paranoid 
>> is required to\n"
>> +           "\taccess engine busyness\n"
>> +           "\t" ANSI_HEADER "Steps to run without root (using 
>> CAP_PERFMON):"
>> +        ANSI_RESET "\n"
>> +           "\tcd /path/to/igt-gpu-tools/\n"
>> +           "\tsudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop\n"
>> +           "\tsudo sh -c \"echo $(pwd)/build/lib > 
>> /etc/ld.so.conf.d/lib-igt.conf\"\n"
>> +           "\tsudo ldconfig\n"
>> +           "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET 
>> "\n"
>> +           "\tsudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop\n"
>> +           "\tsudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
>> +           "\tsudo ldconfig\n"
>> +           "\n"
>> +           "\t" ANSI_HEADER "Steps to run without root (using 
>> perf_event_paranoid):"
>> +           ANSI_RESET "\n"
>> +           "\t\033[32m# Save current perf_event_paranoid 
>> value\033[0m\n"
>> +           "\torig_val=$(sysctl -n kernel.perf_event_paranoid)\n"
>> +           "\tsudo sysctl -w kernel.perf_event_paranoid=-1\n"
>> +           "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET 
>> "\n"
>> +           "\t\033[32m# Restore original value\033[0m\n"
>> +           "\tsudo sysctl -w kernel.perf_event_paranoid=$orig_val\n\n"
>> +           "\tFor details, see 'Perf events and tool security':\n"
>> +           "\thttps://www.kernel.org/doc/html/"
>> +           "latest/admin-guide/perf-security.html\n\n"
>>              , short_program_name);
>>   }
>>   @@ -417,9 +543,12 @@ int main(int argc, char **argv)
>>       struct igt_profiled_device *profiled_devices = NULL;
>>       struct igt_drm_clients *clients = NULL;
>>       int con_w = -1, con_h = -1;
>> +    bool is_root;
>>       int ret;
>>       long n;
>>   +    is_root = (geteuid() == 0);
>> +
>>       ret = parse_args(argc, argv, &args);
>>       if (ret < 0)
>>           return EXIT_FAILURE;
>> @@ -428,6 +557,53 @@ int main(int argc, char **argv)
>>         n = args.n_iter;
>>       period_us = args.delay_usec;
>> +    populate_device_instances("device:subsystem=pci,card=all");
>> +
>> +    for (int i = 0; drivers[i]; i++) {
>> +        if (!per_driver_contexts[i].device_present)
>> +            continue;
>> +
>> +        for (int j = 0; j < per_driver_contexts[i].len; j++) {
>> +            if 
>> (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
>> +                fprintf(stderr,
>> +                    "Failed to initialize engines! (%s)\n",
>> +                    strerror(errno));
>> +                    gputop_clean_up();
>> +                return EXIT_FAILURE;
>> +            }
>> +            ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
>> +
>> +            if (ret) {
>> +                if (errno == EACCES && !is_root) {
>> +                    fprintf(stderr,
>> +                        "\n"
>> +                        "Running without root privileges.\n"
>> +                        "Engine busyness may not be available "
>> +                        "without root privileges.\n"
>> +                        "See \"--help\" to enable engine "
>> +                        "busyness without root.\n\n");
>> +                    igt_devices_free();
>> +                    gputop_clean_up();
>> +                    countdown("Resuming with only gpu client "
>> +                          "busyness in ", 5);
>> +                } else {
>> +                    fprintf(stderr,
>> +                        "Failed to initialize PMU! (%s)\n",
>> +                        strerror(errno));
>> +                    igt_devices_free();
>> +                    gputop_clean_up();
>> +                    return EXIT_FAILURE;
>> +                }
>> +            }
>> +        }
>> +    }
>> +
>> +    for (int i = 0; drivers[i]; i++) {
>> +        for (int j = 0;
>> +             per_driver_contexts[i].device_present && j < 
>> per_driver_contexts[i].len;
>> +             j++)
>> +            ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +    }
>>         clients = igt_drm_clients_init(NULL);
>>       if (!clients)
>> @@ -449,22 +625,42 @@ int main(int argc, char **argv)
>>         while ((n != 0) && !stop_top) {
>>           struct igt_drm_client *c, *prevc = NULL;
>> -        int i, engine_w = 0, lines = 0;
>> +        int k, engine_w = 0, lines = 0;
>>             igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>> +
>> +        for (int i = 0; drivers[i]; i++) {
>> +            for (int j = 0;
>> +                 per_driver_contexts[i].device_present &&
>> +                 j < per_driver_contexts[i].len;
>> +                 j++)
>> + ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +        }
>> +
>>           igt_drm_clients_sort(clients, client_cmp);
>>             update_console_size(&con_w, &con_h);
>>           clrscr();
>>   +        for (int i = 0; drivers[i]; i++) {
>> +            for (int j = 0;
>> +                 per_driver_contexts[i].device_present &&
>> +                 j < per_driver_contexts[i].len;
>> +                 j++) {
>> +                lines = 
>> ops[i].print_engines(per_driver_contexts[i].instances, j,
>> +                             lines, con_w, con_h);
>> +            }
>> +        }
>> +
>>           if (!clients->num_clients) {
>> -            const char *msg = " (No GPU clients yet. Start workload 
>> to see stats)";
>> +            const char *msg;
>>   +            msg = " (No GPU clients yet. Start workload to see 
>> stats)";
>>               printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>>                      (int)(con_w - strlen(msg) - 1), msg);
>>           }
>>   -        igt_for_each_drm_client(clients, c, i) {
>> +        igt_for_each_drm_client(clients, c, k) {
>>               assert(c->status != IGT_DRM_CLIENT_PROBE);
>>               if (c->status != IGT_DRM_CLIENT_ALIVE)
>>                   break; /* Active clients are first in the array. */
>> @@ -488,11 +684,11 @@ int main(int argc, char **argv)
>>       }
>>         igt_drm_clients_free(clients);
>> +    gputop_clean_up();
>>         if (profiled_devices != NULL) {
>>           igt_devices_configure_profiling(profiled_devices, false);
>>           igt_devices_free_profiling(profiled_devices);
>>       }
>> -
>>       return 0;
>>   }
>> diff --git a/tools/gputop.src/meson.build b/tools/gputop.src/meson.build
>> index ec39f4c7a..e95657fca 100644
>> --- a/tools/gputop.src/meson.build
>> +++ b/tools/gputop.src/meson.build
>> @@ -1 +1 @@
>> -gputop_src = files('gputop.c')
>> +gputop_src = files('gputop.c', 'utils.c', 'xe_gputop.c')
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 521607a4c..caca57d0e 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -123,4 +123,5 @@ subdir('gputop.src')
>>   executable('gputop', sources : gputop_src,
>>          install : true,
>>          install_rpath : bindir_rpathdir,
>> -       dependencies : 
>> [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],)
>> +       dependencies : 
>> [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,
>> +                  lib_igt_drm_fdinfo,lib_igt_profiling,math],)
