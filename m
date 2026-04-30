Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754D9FF886F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 07:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2E310E00F;
	Thu, 30 Apr 2026 07:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McgPcMjg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8E010F244
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 07:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777532707; x=1809068707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8puIc9Y8a36LPZY1gP9WbIBZ4leb0oeDbbPsp50yoVE=;
 b=McgPcMjgi2tvTptaEZZ2HsiLGfHPW81IqflgnGntkyvx21Lto+CHbk/P
 7/V5TlxjcziihBU/caFAzEFiDhYKWBo2Qj0ZUGY6C/aoYadAtc9y9phVb
 1NI1d8XwKVP1Y6tBBT2xYXYdK8vl+KTEuY4IneW79hX3NmLqDPzfsxJDj
 HpWVA3TOIOJYPORsUBqdo2W6HDKFXGqT6vJveDYN1hYnCm7iLJltD2EF1
 RkQJvDp83t88Rn9gTP6MFGQCupknExXUyhFv1yCa5atJ/ry+Cs2IySMY9
 OTvqsDpMzMSjTKGv4FbsijvkV8gSIER9meWGYY7+feyigJgM9m9UKxBRt w==;
X-CSE-ConnectionGUID: Bv8lG7cqR22ZWJtXGAlT+g==
X-CSE-MsgGUID: Dc2wEX7WRpGarVZz6YYabQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82082239"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="82082239"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:05:06 -0700
X-CSE-ConnectionGUID: 6+1W+5TRQX+qBw0c83PRjg==
X-CSE-MsgGUID: Ye+p6TFERdKBUnfOyhnG0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="257832612"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 00:05:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 00:05:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 00:05:05 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 00:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c62B0bc+DhBCIozTEuK4oavZvexG1uXLhydT2NmwIv7R363YQUIEIeglj/XwsWpE6SXKKjhhJcR8lz54vU9qiQHMzOXqOu7LaT9ci/wTRuz2lvF2/AJ2mbRoNEh7wKhwdFqfsq8cby68Fb8y+Elp0EOmf/boKCvXmmMtPrd9eH/zMPYtLl5PDuw5thYbXZDxG0SzTYRPnmRIGCBSAo0tpj51HmL7c01whFd9QLUWULMjCby3I9bE+mHfakH+isKYdF+9c00BITk2Sth0MWxh7LJR14MhX90/E83o1KgjM+CIERzU/HpZRi9jB+mRPFPx/yR/h9eAMbFvUvbcH9+09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8puIc9Y8a36LPZY1gP9WbIBZ4leb0oeDbbPsp50yoVE=;
 b=j3dfPTQqcbm/dHJ3IsZH5QqZ2PRbwrgmxMuoWpG+5qaWqN4+ZoyrZGAMBioQKm7c3iwu+Jsm1k/w1jCv9qxJTeOyzZ+bIqPpTXKk5MmCWsZqh6FuqwmBhL5KIvTLPnvnEsMFJ06gF1N7yXUaR+kMymvdXFOZXpXFSKJVy1HP24TYyFiNWK0hvQsMtBCJodkU0G+yW2RPMb17j03/hXu0lLyLbgp06t8XIQhuVsG9TPQS6/3WnOuP0cjF7HKQHLvnKWkPvRvTlKUCt4xjMnRQ21IcghAsfBRUJ2zxuY5UswjRO/VVfBq0QSV/CfnUBTXIxC7433m8RsiuOuYWviBN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by MW4PR11MB5773.namprd11.prod.outlook.com (2603:10b6:303:180::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:05:03 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 07:05:03 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v3 03/11] tests/intel/kms_frontbuffer_tracking:
 update the outdated fbc status reasons
Thread-Topic: [PATCH i-g-t v3 03/11] tests/intel/kms_frontbuffer_tracking:
 update the outdated fbc status reasons
Thread-Index: AQHczYMfF6EEtDthIkKCDOlG7UsoqLX3CjGAgAA6G4A=
Date: Thu, 30 Apr 2026 07:05:02 +0000
Message-ID: <8f0315369761db097a299fac068cc02f12256002.camel@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-4-vinod.govindapillai@intel.com>
 <d37a835b-69e5-4eaa-a6d8-fd98b02df74a@intel.com>
In-Reply-To: <d37a835b-69e5-4eaa-a6d8-fd98b02df74a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|MW4PR11MB5773:EE_
x-ms-office365-filtering-correlation-id: 9017cff9-294c-4186-7798-08dea686cd1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: wAHiVv8sq+bP5G8ZAWzHOzKPyCcShQijBJbrzuKJFBjh9accFZoB8Ss2+Vq7uo5xUSFW9UHsqKbNAQkc0SRyfRX2n32WBTxq1YndMQ+gvRi8yrtl0wN+U4z/puUgBIrLItqf0a2I1G8NENSsQAVqv2V67KReJvUnctwcVRlfHo7s37bHUOAcSe6wCDgCo3l+88zIjDZTLzcPfNv6Qa14cGCNJuMQXq45HDiMpmeEH0GaxRR6LVdBpOEdnddrPo6qRkYmyF5fySQlDP0d7KZBcsnmjosEWamZvv22F+Zf+NM95hJtiNCLMFHmxa9J7BKOlqaM+H/XNJUO0hUECajjGtbM1tKR/YcsYsZJWdRjS62cywan42yjEzYbdoik1+EWzxtH0IfOSrMN5l6qYaTUFnAOORVrV/n5QHApQkjWhDKic4KF5UVf9NJooAtuMHv8imgv0cMY1nGAY9FnghS16L8e3CkGeoo+mUm6DIRd33cc24GY91RlskzWW39g/O3Kg3Tp5JlLlZ3S0jNZ66aJz2z/9IucyDOmXplGSMq9bpqhtLJogYCkwh+YAaR56jXDuy7dQ3gpShIpBKp8F4Mh2KnjwmhGFGlRH8mRRke3GtrN7dW3z0z6EQyBwvmqvaBadNtIDExQ4oidZWmDwU3Ub0h0NCk3LmuRk6Zm7BKL6E62QLZv5e+L32as6qFRmoRalpdcU+bP0HknvLyVsuGJmRh9TqBtY7ImEFGF1aylf4y8IYdvj8ouyxd6br9JtyKJU7NjMbecO/FjIDp+tfcgTMbxDmOTPRNeQX0f2jbQkMA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmp3OFJyNTE5NW9IbTF4OWpxTUlrYXdLL09lZ0ZzSlVVSGtWN293cXdsR1da?=
 =?utf-8?B?UHZuaHJDRXVzT2RIOTBoT2ZJL0pnUHlFZy9Bb2lYcHZkM2pIWkRqNS84RVh0?=
 =?utf-8?B?a2tmRjZsN2ZHMUsyTFRUZElZbHNkeVlJREJCQWNwQmtUcmhnN2h4dlBmMUdQ?=
 =?utf-8?B?MjVjdHJsdEUzRTg1dHk2OVl1eGtKQWphRGtlRkE4QU5HOE1qb1NFNVlUTXRs?=
 =?utf-8?B?aDlJdFk1djdmSzhtZUg1NnZvYm1LeTRIRDlNWjYyZXpzZTE5RHNMb254ZVhH?=
 =?utf-8?B?U3JJbG1IVGV6ck1zUGdNY24yRE1OSGZhVHN6amVtUkhidzBKbVEzK2RpN1VO?=
 =?utf-8?B?eTNUNmI0UjhsdFk5d3ZUaVU3WnhmbE0zdWtFbTNRVEE4K1FPRFRiZFBaUzIw?=
 =?utf-8?B?TFBtVEs4UEZwcUs1N1dhZ3VsdDVjd1BOMnlmWGd4SjczZGpuc3JPK3FYUEtx?=
 =?utf-8?B?SWovc3RGdGFYY1E4UEFUSEtrZ1c5dkdYY0E0TlhkVWVqUlBYS3BadytuM0Nl?=
 =?utf-8?B?eE52UlFtT05LczlZbDhkdEV6Tjl4REwrQjlHUTg4VFBEVndwZ2QzT01Vblo4?=
 =?utf-8?B?VEpHYTBZeThlaGptUFVTY2YzNU83QjVxTmR5OVQ0N0Q3R1ZkSjdLazZwOElI?=
 =?utf-8?B?SUZLS1JZNURqREIrQ1hHNStqdjJsdW4rMXVJYnhXcEZ3L1hIMzlKdFFLR09a?=
 =?utf-8?B?NmlJSy8xeVZvTWZZbTM0Qjg0N3ZxYSt3MUxBaHVCWXRWempwQWoyOFYwK1cz?=
 =?utf-8?B?azc3MjJsdWlOeTk5TCtqbTBnR1hpVUNuaEJXWm1sRnRmcURGSSsxQWpoUE5S?=
 =?utf-8?B?c0hsQkwxQWlsTCtXd0EzZ1FlVHdqUzdIdU82UFAxcWtzS1FIY0NNL2VkYkI3?=
 =?utf-8?B?emdiOVdFRDlsK3ZOVWRXTExjbnl6QnhHY0FZcFRCRk1FTEhsL1RJNHVHMmQy?=
 =?utf-8?B?WkdDZUxLUWVHanYzdGxaanhSeldXak5zdThEbGY1TldaeWt2TDY2TGhPOXpj?=
 =?utf-8?B?UStKSVR3Qm1EWG1pbVEwRnJETGVoZ2tCaGtFWFpScmxCYnBRckFXZ3NZSWdl?=
 =?utf-8?B?MDA4R3pHNVFYdURyVXlMamppOGtISUZxV2tMQW45K0xwSDF4QVB1THQyb3hx?=
 =?utf-8?B?VkxBTnk4Vm5POXJqVXZxektlK1NSQVU5TVpNeldGZytkU1k3K1JYdWxSajBy?=
 =?utf-8?B?NkkwbXVRZXJKSnlZQVpXWWZIZlNGcFo2Q1VLMExiWEpEM0hNRHV4cmdnVlBH?=
 =?utf-8?B?MDdQdXhoZTBPZjZXTUl4QXhiMGxIN1ByZFplNXcwNjNlRG1mR041Mkhmd0lI?=
 =?utf-8?B?UlJEZGRGeEF3SUt3QnhvNDVRY0t5TExMV1BTaFhtbE81Qkt3QkFESEZQVzMw?=
 =?utf-8?B?YUNGb012bnN4SVJ5eFdMcXlkSnEyZC9xakJYQzJtczJZUjByZlpENldQamw1?=
 =?utf-8?B?WHUvYnNQYWxSWE9TN3RWY2pkNVFEWWg0bUgyL1hHSnRldkZrei9zRit0ejJF?=
 =?utf-8?B?L0lGTDB1SThXelZTL002aUhzMGtmQUx1RGpMbU1hSCtQK2lINkVtZDRSOU83?=
 =?utf-8?B?UlZnWlM1L2xualJLcTI5d0ZyOTd2TEcxb2M5WTIvYkEzQ2drOFNOcG5OajYy?=
 =?utf-8?B?TkZtdzA4R3BYN1JMYkNPNnU1MU1oZUpKYVNjNnhSbk4rUStzZXBSMHNFRVcr?=
 =?utf-8?B?OWpta1FxT3BFTElMNnA5UXF3MW1ZYVRpU0pRaGdYRmswVGd4NHhoZUlYcU10?=
 =?utf-8?B?TysvRjU4YXVvcWV3ZWdFd3B3YUhIWUZPWktwSjZSTnZoWmpzZWRPUWRxeWY4?=
 =?utf-8?B?TGJFcGJaTXdIWVd6UEpwWUFla1N1UFBEYmJ3WUd0UjZWc0hJUnMrdzJ4UUdw?=
 =?utf-8?B?TDZoNW1iZGtXVEduSkx1dXhYWGNENjBURzF3SElwcVZJbUQvQUhxa1crRlhu?=
 =?utf-8?B?cEg4UWpUVGIvUk1NNFVUVGdWQkZMUUxMeUg0eXltZUl5WC83UWxQK2hMRW1x?=
 =?utf-8?B?dUQ5YXNYeTVCczlDTGZuMEV1UXlkeVJFVzZUejRIcmowSEN3L09ldUJ5ZUpy?=
 =?utf-8?B?SFpIZjd3Q3EvNzVyeXBZcENYT3ZGVmRPM3lLWWpDRmVTckVqTXNhczJjSFo4?=
 =?utf-8?B?dUxscktmekVQemlkOTR5Z0NUZU1wcFdkUjNmRjlFWEZINjRlYkV4VitCVXEx?=
 =?utf-8?B?ZFpoMXRSUUJjTkh0bXlnNDZMa2lTSTFHTDVOcy90b1ZHWithbFJCRW9LaTY0?=
 =?utf-8?B?bjMyKzhZOG11SEpVak1hRGlablp5Q3NkSmg1T3JqbzRVbkZxdVlJdjBSc3d1?=
 =?utf-8?B?QkNua2wyb1kvTzRDeElFdG1PNjUvQy9BcHY1V3N5TDhUYitJdWN1a2UvT1BY?=
 =?utf-8?Q?Dsyk3lQ34Au+awljE2DVgRAt6tKhcnekl4EJ8Vu4XRWR9?=
x-ms-exchange-antispam-messagedata-1: Yy+DHoNDoh5YrI77QmvAHkjV3SSifVMg5n/ZqREfWonu0lNgV3kPWF/D
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F7614C43AA68E459B52973C36783FFA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qV3dROr8lqMd7hkYQo3c8sV96S3LkIpdF+MGjSl5ZSZLW8JomXJe/zLthYyPlmUUzE2jbchSTJYnfbjG7Rf4jo8gxI8LKRmqHs4Lq0GNlg/unwZwAK+uWJ+6IYxOLXdyVr938bjVhKlXvRuXigweMsiH+N0Pzn1S3klBQ2UPGzCKCALEQTz/jFprocZyiXO5h/mcBWIyAsMlMb+MuEtq5SeG5N3BI7pmNWzS+PA/fY0J0Nr9ovz8EUF4Kt85tzT9y94X6wIVNqmOfJVhGnR43nskSBH+w1KCDpelAkFlnc6DihGTe6tr2fzA3ME/E8dM/n4dsUXlqeVsRgC0HCArRw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9017cff9-294c-4186-7798-08dea686cd1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 07:05:02.9725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JrFcI0akID3VtCo3+J/K7UDB0yaVZYVpi2f614kwiNP4K8fWumFmuSXdE+LI0QOSxU7UbIL6VMpkPil3305EeJEolBfQy7Vpedpp2RNbE6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5773
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

T24gVGh1LCAyMDI2LTA0LTMwIGF0IDA5OjA3ICswNTMwLCBSZWRkeSBHdWRkYXRpLCBTYW50aG9z
aCB3cm90ZToNCj4gDQo+IA0KPiBPbiAxNi0wNC0yMDI2IDE0OjU1LCBWaW5vZCBHb3ZpbmRhcGls
bGFpIHdyb3RlOg0KPiA+IFJlcGxhY2UgdGhlIGZiYyBzdGF0dXMgY2hlY2sgZm9yICJtb2RlIHRv
byBsYXJnZSBmb3IgY29tcHJlc3Npb24iDQo+ID4gd2NoaWNoDQo+ID4gaXMgbm8gbG9uZ2VyIGJl
aW5nIHNldCBieSB0aGUgZHJpdmVyIHdpdGggInBsYW5lIHNpemUgdG9vIGJpZyIgYW5kDQo+ID4g
InN1cmZhY2Ugc2l6ZSB0b28gYmlnIiBmYmMgc3RhdHVzIGNoZWNrcy4NCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiDCoCB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tp
bmcuYyB8IDE4ICsrKysrKysrKysrKysrLS0tLQ0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiA+IGIvdGVzdHMvaW50ZWwva21z
X2Zyb250YnVmZmVyX3RyYWNraW5nLmMNCj4gPiBpbmRleCBiMDE5NTlkMmMuLjViZGZiZDEwNSAx
MDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0K
PiA+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jDQo+ID4gQEAg
LTE2NjcsMTYgKzE2NjcsMjUgQEAgc3RhdGljIGJvb2wgZmJjX3N0cmlkZV9ub3Rfc3VwcG9ydGVk
KHZvaWQpDQo+ID4gwqAgDQo+ID4gwqDCoAlpbnRlbF9mYmNfZ2V0X2ZiY19zdGF0dXMocHJpbV9t
b2RlX3BhcmFtcy5jcnRjLA0KPiA+IGZiY19zdGF0dXMsIHNpemVvZihmYmNfc3RhdHVzKSk7DQo+
ID4gwqAgDQo+ID4gLQlyZXR1cm4gc3Ryc3RyKGZiY19zdGF0dXMsICJGQkMgZGlzYWJsZWQ6IGZy
YW1lYnVmZmVyDQo+ID4gc3RyaWRlIG5vdCBzdXBwb3J0ZWRcbiIpOw0KPiA+ICsJcmV0dXJuIHN0
cnN0cihmYmNfc3RhdHVzLCAiRkJDIGRpc2FibGVkOiBzdHJpZGUgbm90DQo+ID4gc3VwcG9ydGVk
XG4iKTsNCj4gPiDCoCB9DQo+ID4gwqAgDQo+ID4gLXN0YXRpYyBib29sIGZiY19tb2RlX3Rvb19s
YXJnZSh2b2lkKQ0KPiA+ICtzdGF0aWMgYm9vbCBmYmNfcGxhbmVfc2l6ZV90b29fYmlnKHZvaWQp
DQo+ID4gwqAgew0KPiA+IMKgwqAJY2hhciBmYmNfc3RhdHVzWzEyOF07DQo+ID4gwqAgDQo+ID4g
wqDCoAlpbnRlbF9mYmNfZ2V0X2ZiY19zdGF0dXMocHJpbV9tb2RlX3BhcmFtcy5jcnRjLA0KPiA+
IGZiY19zdGF0dXMsIHNpemVvZihmYmNfc3RhdHVzKSk7DQo+ID4gwqAgDQo+ID4gLQlyZXR1cm4g
c3Ryc3RyKGZiY19zdGF0dXMsICJGQkMgZGlzYWJsZWQ6IG1vZGUgdG9vIGxhcmdlDQo+ID4gZm9y
IGNvbXByZXNzaW9uXG4iKTsNCj4gPiArCXJldHVybiBzdHJzdHIoZmJjX3N0YXR1cywgIkZCQyBk
aXNhYmxlZDogcGxhbmUgc2l6ZSB0b28NCj4gPiBiaWdcbiIpOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgYm9vbCBmYmNfc3VyZmFjZV9zaXplX3Rvb19iaWcodm9pZCkNCj4gDQo+IFNhbWUg
aGVyZSwgVGhlIG5leHQgY29tbWl0IGRlbGV0ZXMgYWxsIHRoaXMgY29kZSBhbmQgcmVwbGFjZSBh
bGwgdGhpcw0KPiB3aXRoIGludGVsX2ZiY19mb3VuZF9za2lwX3JlYXNvbigpLiBJbWhvLCB3ZSBz
aG91bGQgc3F1YXNoIHRoaXMNCj4gY29tbWl0Lg0KDQpUaGVzZSBhcmUgYmFzaWNhbGx5IHNlcGFy
YXRlIGNoYW5nZXMgLSBvbmUgcGF0Y2ggb25lIGxvZ2ljYWwgY2hhbmdlLiBJbg0KdGhhdCB3YXkg
aXQgd291bGQgYmUgZWFzaWVyIHRvIHRyYWNrL2RlYnVnIC0gYmlzZWN0IGV0Yy4gV2VsbC4uIHRo
aXMgaXMNCmhvdyBJIGhhdmUgc2VlbiBob3cgVmlsbGUvSmFuaSBoYXZlIGJlZW4gYXBwcm9hY2hp
bmcgdGhlIGNoYW5nZXMgaW4gdGhlDQpkcml2ZXIuLiBzbyBmb2xsb3dpbmcgdGhhdCBhcHByb2Fj
aC7CoA0KDQpCUg0KVmlub2QgDQoNCg==
