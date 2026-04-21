Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF243F327B1
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 06:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D16610E18C;
	Tue, 21 Apr 2026 06:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUaJOWn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A2310E18C
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776754762; x=1808290762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+2ja+KUs/TOUg8Pjssh8VNgACOtWy+rHv8vX8XfO7Xg=;
 b=UUaJOWn4OeTIMxsuPf3vnQSukMJIHhb4Q7O5rqtlktAViSJq2oPEli/w
 x1s6Ey/UroZUe35/FG75dRf6+2VZjBjjy3QCx0ycDBmuf7BB6Igod+38B
 J8oQW8BthlM6osGFPYNN+vo/ZCgcP7AgPyeBqXF94B7RnGfv4L7qfvOlV
 qq0+B/zqnl1c5UiyfGjn0HvDMp5quSCr1Evb0L9UStCvGac1qyZntpx8R
 nCFETGD4BRHHBdzpy9AQyENf+p+Za+MI6rMxsSPXChDsBxjJYykvh6Up2
 aMKaPMKj+wTszTj487GlnEVN2cgqx7hAfd5vrqiaHp5GGcUUWRLNKq0F7 A==;
X-CSE-ConnectionGUID: Uwy/HBFdQ9mQEe1howbopw==
X-CSE-MsgGUID: 7ukbriuVRH6n444so1GaRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77751999"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="77751999"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:59:10 -0700
X-CSE-ConnectionGUID: 13LiJjLpRA2QgigT0E7aMA==
X-CSE-MsgGUID: HWOdR6EYQm+cw++ES4Iujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="227622979"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 23:57:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:57:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 23:57:48 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 23:57:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRb6OeTXkjliwvvl1ZYJJV/JRe49P9hMb7DezzFOHXsXgCsLKjywqnrHxhzt0ubASbLivv5+9i6uIbDx0GKdlpAPCXt9Q0FZgWODqRPPj0dng0J8dIO3idSWJ9csN+CooYN3TJqNSYxgSHLsCFMoP4Fdo2/YmE3HG9/3gXezVgoKwxym3/ew89SoXcOjS4+xf6U54ui++oOQPL10sNlvamJSKfy7e08KCQdBO1ZXOBm9k0014V8cOgM0/3LrAM1ceadIEMLG0u0giGV9RBhQ/7ZjvIiSyZ/119kR1h6iEZQSO5F4YtZvPhBTyOi99ZIa/vJI4FE5MsEz/sfus0vG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVDB+2Q5hh0Ba8Z879St9PiJ5yGV+t6xn3Qa69ItOLM=;
 b=BE0fmEbd3ZzqCN36B8WVIDkIwgedXicTAvOAjdbadp+SDntSdMi6sFmMqWEThfGQiJgJaoNMeIQ2tHpVYQc9VXDnftku9t6u+rnlfwlgKcDQeaCLljHzgiBk9NkhQoP8Xjp3y4eS8PY6z2L+ZJvd1UrbqETres8gj9z5gTq9eQ1VmDXQobPt5X0gOs/GR0r5gF7rr4uNhIGKkArCT13kMEwiEx4OWX4SNrN4kxsUmZU0FU0JEt6Z0WaJdcO2ImadzLQQHesiES+X6zSjZloirSGwOoCXBAIcxJ9mzEag6EoMcezAwGU0Bfs7Cd01Lw3V+MyChmc2ypMsHIpErjNxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB8480.namprd11.prod.outlook.com (2603:10b6:510:2fe::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 06:57:44 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 06:57:44 +0000
Date: Tue, 21 Apr 2026 06:57:32 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v4 2/4] runner: Create attachments directory to use
 by hooks
Message-ID: <koeh2itzhkbjfl7sf5byomgxef2bzzseac52embffxdjf7vkdv@6im4owetb573>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260420085653.2587750-6-zbigniew.kempczynski@intel.com>
 <20260420085653.2587750-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260420085653.2587750-8-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VE1PR03CA0058.eurprd03.prod.outlook.com
 (2603:10a6:803:118::47) To PH0PR11MB5064.namprd11.prod.outlook.com
 (2603:10b6:510:3b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: e0da0c7d-1f2c-42f0-be77-08de9f73490c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: LaaK5aLWKVXU3mAQhpnJGljWpZbKYEYm6pmGW5oPK8T1GaEMqQ5u5MKZND91AUw31oF0oOrFfZaX6WoTYPms9oC0W9KejIs7oO1z7rtyUsiN93+x4g8Z0l9bmXpHhIR1jA1LEneHR4lb54ZQY6lZTawRrkpsOrdTd7dZoggfC/ypZBTD9KL0mvckfRxxfK107ohYGnMlAM5j+q4t/wkPcrd9qmtsGeGymYWyYYpr2F2M1pyOUe9GYD1iDlZBEz48CPYpmd+DFOwxIFWcgpwHpdsBnszSQ7hc7HTCYubz+cdOf7qGBs/pmUHUeUGw8XN0mSPoNYu3XwPfJ7IuMExoQrI6WaUsNNlFUHb8OEVzzWTwIFayhiFu2u/jia4x9aifCN0uFOB7s5rUbklwdvurLGksysE8VrAHaG4nQ4wXw1FRw7gnOiZrHxX4C3SWBV2ciMp1qwDaBM/35cAMoY2c3xWcQ+xGWDN/e/sXMBM9DYfqXdQuu6LP2FsGCE5q2jB4Aj+EU+sc2sCmB7nURamXpVGbqBLN5t2x6aTXrZj+IAm8j1mGHhq6zHP06kmvIsvvv6mE8Jg4MxMH53HgZJw+yavYXGIoF5n2wqxlAHDze4hmFlII7fJaDVfhHKwI9/5Ej0T7CHphtMEgLO9xPnK4PYFmQ4WDPlFOI8l0lCijTMZ3q/rhokS7ghYXPKZSym91OFGhSvHsmL6I69PaLTz2mQ0aQxTdNCO0YO5Ei/xVY+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTZOQmRpTUJRTGJxZlhROEpPdlI1K3JwRklzNnc3SU1hdVRTY25sdmV4TkFX?=
 =?utf-8?B?bnk4a3JtRTM3UjFYbEFWUXNHMFVQSURtdXZGNXNaK2piZEJaQ004bDFkcHVq?=
 =?utf-8?B?cTNhZUlHQzNoNExDRlRndCtjN3BOaXBtSlczK0pkL21JSVhpS0pGbFZ6Mjhr?=
 =?utf-8?B?VnljWVYvRGp3c0YwdG1jdVdDT1FieGV2WkRLYXRZVVI2VUo1elc4TEErYWZZ?=
 =?utf-8?B?d2NEWkhEZG80V1RydUhNbGRodUNabC9XWHRCWjFwbXJNRlFMYlFydFB2NFdV?=
 =?utf-8?B?MGczZFZIMkIxM3BYakFvcUJpdVRVWDVoYWMyUGhPZlNTc1A5NVVTWk15b0Zu?=
 =?utf-8?B?L3hQMFVRcXpXb2RzbmNVM3MzMVR6ZlBrRGQ5S3ZqcG5HTnV4TnZUdTJtN3hx?=
 =?utf-8?B?Mnd6d0J1NVRoRFJYekRKZ1pMalh5anNBWU5FNGhRS25SbmVGVHppaEUzMVAy?=
 =?utf-8?B?QXZqYUNqblpoMWd5S29iQ1JoMlQ2SFBGSCtyeThETXpOdy9ub0RzQzVUMjEr?=
 =?utf-8?B?dWVYMWRGanlpYVRCYWZibUs5bjlFTk9CVDJUYzZBemtOTVU0VnA1cmxaaXQ3?=
 =?utf-8?B?UngvUmlKOUNIU3J6Z3V6L2Nlb0hmMDVlWURBblJJcU5SdGtqQ1Yzbk9WSWhI?=
 =?utf-8?B?WFJmaTRMYkVoZXo2MXVlOTVFZHNpeFo3cHpPOFRZck5xczFqbEdTTkxIQytk?=
 =?utf-8?B?NmN6M1Y1QVZFN1dsTkMza01CcjF4Z0tISlh3eVkxTEVhNlVvcTN5MllMazBk?=
 =?utf-8?B?YnlUZTNEeHVUNzNrVjZQNnUxT1p6YXdIekpiYUlEdGxaMnNVVXJoK2RtMkVq?=
 =?utf-8?B?R0VHZG50NTlZaG85SmxKUFFmbXZKSFQ5aU5VNzlpZWdVUUtuSjc3U0V4cEgv?=
 =?utf-8?B?ZVFNZTRCcSs2dUg5aWxWZjVNV0tHdHhUclQ0R3VaUzA2OGdaSHFXSkhUOFNH?=
 =?utf-8?B?cTZvM3lzTFc2UTdWVHA0cG55UEl5ZGtGWkkvazhEcWFQbGRuVHRVNnlMWW0v?=
 =?utf-8?B?dkNvS01XUGMzT3Z3d0c4aUdzblNOSmdmVzNKMjE3OFZiL20reTJTSFBlNmtL?=
 =?utf-8?B?SUpHVE9LRXVjWVNNZTMveG8zQ25YRHArbnY2ZXZQVC9uNFR3Nk1qZFVOSlNo?=
 =?utf-8?B?UERpTXpRMDVoYnZqRHNBVHB1N3N2Y3A1UWZVR1ZRRTlEN1ZVOWdYczZMcjJX?=
 =?utf-8?B?ZmR3eHRLQk9sY0M3U3JnMnl2bGFTejFQVDJrVVlqclQ0TmdRc3gxYnJWSS9Q?=
 =?utf-8?B?YWllRTBTeWRpZEdFZ1FUOW1JWEVBYTc0aG9UWmlkYXVndlIwVjdTanhsY1Vo?=
 =?utf-8?B?Q0pvVEJ1Mkh6RXZtL0dHOTF5TE4zbldkK2ZMMW5BTkVlSHBCbW9YNjdRSGs3?=
 =?utf-8?B?dlNDUFBVMkJsQkVwR25PVjd1SnI1SmVZSWlIZTlHMk5uSHZMUXRTcU03bnJs?=
 =?utf-8?B?aTZudlJpaXpObmtUeTJKaXRRM2FIZ2hBYklQUEJBOE80NWMyL0lmc0JIdk5j?=
 =?utf-8?B?VngwZzRtNDZIZU1rOEtxKzZRK0prOFRBWGEybENaT2JPWjZFNTRWbTVyY3dC?=
 =?utf-8?B?bTVNZnBDWk8rcy85eEw5dytTWFlWYjJPcDc1UWczUWp5Q095cWZ4dG5JcHJu?=
 =?utf-8?B?SXFuSURJdWZwbk5yZEh2cnBOc283djl3REl5b3pQaDBqU1U5bWhxaXFzb1Bq?=
 =?utf-8?B?U3B3OVRXdkRFUnovUVluenlhR01yeTY1NGdJRFlGUXVKbk42YXVnQTNFa0x3?=
 =?utf-8?B?T2ZCZkZjSG5XTm1NbmRHSzhNbEtyNDRqaVZ2eTRGRDczZXJhY0tZK0FlcVNO?=
 =?utf-8?B?Nkg3OWVjNzE2RmpUeEZDeHZNayt4MUN5T3pMT0FSZHRhaXV3UWQ1VTBIUVdx?=
 =?utf-8?B?WWpGbkJvTTRwbjVoUmVtc0ZscFozVGtzbEJQbzVJQ1NOdThyR3JIeW1Ld0Rr?=
 =?utf-8?B?b2tLNWhSNWlnTHBIWDR0N2xyZGg5WnNGblF2R2lrTkJ4M1krdWVxdVpaTlps?=
 =?utf-8?B?RDN6aHpva1kydytLNUszc3EyL3NvVHpOejB5ZDF2Wlp2T0c2Uk1MQ3B0c2Fu?=
 =?utf-8?B?ZUlKM2gwVW1kbktkaEVyZkM3Vm1DMzdWbHcrTkRrWG5lL0ltMkF6cHVlb2wv?=
 =?utf-8?B?aGcxNDB5SzBuRWpxNnVaT0k3QWlVMFYrT2Qrdlo0VkxGQ2g2ZGlCTnZYeDgw?=
 =?utf-8?B?cjk3RE5yNW9uSzNqNXpnK2pYRWtWMmZMOWU3RVZ1NzN1cmUwSzFDUWpGdFd6?=
 =?utf-8?B?NXlQNnBrYW9NMUQrY0g0UFQwOUVJTXhPSkJIK1dhazlrT2NqOEJoRk8xaGRC?=
 =?utf-8?B?aXhuMnh4ampCb1U5SUZOalNVVm9rME1OTzFXT1FUQTVJQ2tMd1RRMk5zQVhh?=
 =?utf-8?Q?PoSrg3p2Qs8yas4A=3D?=
X-Exchange-RoutingPolicyChecked: YPu2PMcZcZWK+pLUhcF/dAqJ7dOdvcTaGHrj3wq6jT73gyX+LPsOuroIsQljkBR08SuH0nyfNdJhrauzoNEr/7FR9prAIryJuVaKPCR2ZOfQxSullLMz79/RJmSjMv1uY0XaB6GmEkWhR719PreP2ImtrAo1Z/bDjF4gCDHw0jCHIaLsruQi2fMt87l6E8X8en8egWMFMxDtCWMQfL61ViJM3f5y3J7rbD+OG6opZvF2ARZnnpi8AFzxCW5Hszldrh4ZMjLSSrqXp+apHCF+OCm35SSsMRrXduMqapgOPKNRralz//E2vpsKPclc4Q60jvC9XG35U544JEJcpaqKeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0da0c7d-1f2c-42f0-be77-08de9f73490c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 06:57:44.3285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I48ZyJTQsTRro8ULBnf9lXsAwbf0lOUzhSzhahA6uo6eWAS4uq1bhT8gCeWzGeOp1A2OuVFfufEYvpSnWbBzfnAv5937DaJ7lwaPqqYTSOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8480
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

Hi Zbigniew,

[...]

>  
>  static bool clear_old_results(char *path)
> @@ -1990,20 +2044,19 @@ static bool clear_old_results(char *path)
>  		return false;
>  	}
>  
> +
You added a newline here, I think it is redundant.
Apart from that, I like the patch:

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

>  	for (i = 0; true; i++) {
> -		int resdirfd;
> +		struct stat st;
>  
> -		snprintf(name, sizeof(name), "%zd", i);
> -		if ((resdirfd = openat(dirfd, name, O_DIRECTORY | O_RDONLY)) < 0)
> +		snprintf(name, sizeof(name), "%s/%zd", path, i);
> +		if (stat(name, &st))
>  			break;
>  
> -		if (!clear_test_result_directory(resdirfd)) {
> -			close(resdirfd);
> +		if (!clear_test_result_directory(name)) {
>  			close(dirfd);
>  			return false;
>  		}
> -		close(resdirfd);
> -		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
> +		if (rmdir(name)) {
>  			errf("Warning: Result directory %s contains extra files\n",
>  			     name);
>  		}
> diff --git a/runner/executor.h b/runner/executor.h
> index 3b1cabcf55..bc6ac80dc4 100644
> --- a/runner/executor.h
> +++ b/runner/executor.h
> @@ -25,6 +25,8 @@ enum {
>  	_F_LAST,
>  };
>  
> +#define DIR_ATTACHMENTS "attachments"
> +
>  bool open_output_files(int dirfd, int *fds, bool write);
>  bool open_output_files_rdonly(int dirfd, int *fds);
>  void close_outputs(int *fds);
> -- 
> 2.43.0
> 

-- 
Best Regards,
Krzysztof
