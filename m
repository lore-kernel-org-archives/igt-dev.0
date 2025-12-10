Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3698DD2CE17
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 08:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46E510E230;
	Wed, 10 Dec 2025 08:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWh2cypn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468C610E230
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765356782; x=1796892782;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=hJoG83LIhNCthnEMMmtZ5OA77TnH2iKGASAnihb9v1s=;
 b=YWh2cypnhLSzx4WwYs8f1A/CQ5i2X6M+4hG9DO2UAWoCPEdjUtPmVY7z
 D+RloTkSeMKAJtqVXXp65RTsTcYnDWi9epDgx0KVBj2EANSnvPX+LABqP
 YYAkSDpOSY7UKFDh9tXxlBUUMSPlnrbhsmjYj9sFazzJ1FPIdFg/Cbquj
 9tK25916VAXU+spvSz5b7e0s4DMDMg458vvDYUamj9N3b8Bhgdf5XJDjZ
 c0UCkDdg5Vim0gXM5B3bveVMF6kf2QtB2WfHbRyfJUT3yBuvo4L1Qqa9Y
 HhGd0lJCYtdIQB3JZq+8Rb1px1BCGdrgv3qLGTfGPpEi3mvPGMUVFQj/J Q==;
X-CSE-ConnectionGUID: VyuqYpJ0SWCuw98XDu6bTg==
X-CSE-MsgGUID: L/3IGfA3S46XCg1o4WBAMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66500842"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="66500842"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 00:53:02 -0800
X-CSE-ConnectionGUID: +dW9RhiEQMyzZWgywzYwMA==
X-CSE-MsgGUID: QQBEgx7cSkqMfU86fGDs9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196211272"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 00:53:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 00:53:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 00:53:01 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 00:53:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO02mXP8D9MGL2D/7jU8Ds7VNmc34iV5t7LmrgyHODw7VPfoAuNzUpjpZCkqVRjkvjCMNRqLde1dOsqVEUFQFeYuJvLmytd6IEyrmWXgChaCsCj+L3iNIZhgAXQ2eIF8j4vW2eiQ0rIu+DNBpQwjNJ4Hu1D/9yFFUFC39muwVUHBCYs3PUttJaO0Tl3Cn552eHeqPLOgpOczOjbdgF3+TiKcX2o44qkE7banismH0ufQzIdSdYRYIw7trCYiqwwg5kNT3lr8cUUncmMxG+NFB2LHQy9PFIp2j2gnag1SHQmI6+gTyQUkWRI5rq50GhOUKjH4GkWj8grhKtsswp/zGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rM+0HJdMLpsl3AN7P0wpSbqZRBoZsiaMGvzHxkuBqg=;
 b=pn3ZS8mPBxKOp6vfnDij6SjOZWxTqP2NtoLLLRCmrpM0oNFNaMJvz2SIXVZmPiaIbqeHBzSem2XPFuoNvzuoTAMeRSr8mPlBCzcRNoKURYI9MjYaRnI2b2Sj5bLju7bUonKFmVRsBzgqlBTq6PuCQQdj5V3NbpyN4uZYaBfJ2hET8SwiR7p2T9rKT4dbldDwHoWQAJ0h4+xRZz/RZKsNpr9EBFNXS+8CvHb68MUWtv8RfeRTTOul22HVXBNFg7N2k/J/vwg84RyvWQRaHeN9Xcyo8MNgx3c6R6kExUhybRztKTJQeBO11wCkgP6L//Js/gqIlYbO5z9QJMYAxWtQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ0PR11MB5120.namprd11.prod.outlook.com (2603:10b6:a03:2d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 08:52:59 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%7]) with mapi id 15.20.9343.011; Wed, 10 Dec 2025
 08:52:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Dec 2025 09:52:54 +0100
Message-ID: <DEUEQYH4HNUY.22L7Q86LHC4PX@intel.com>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>, <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v3 2/2] tests/chamelium/kms_chamelium_hpd: use
 helper function for connector lookup in DP/HDMI/VGA tests
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20251209152359.907648-1-mohammed.bilal@intel.com>
 <20251209152359.907648-3-mohammed.bilal@intel.com>
In-Reply-To: <20251209152359.907648-3-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA2P291CA0030.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::26) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ0PR11MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: f93a78cf-6ee0-4967-eaba-08de37c9848c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SngxZlhWUDA4cG5tNG5zd2pQSnZKd0pCTE1CdVZOb1hhOC9vbkFXaEc5aWlX?=
 =?utf-8?B?ZXVCVThlWUV4S29EK1ZYeVVEeUdLVWhldmkyNjVGQTdmSzB4WEFVelZLY1BS?=
 =?utf-8?B?aVVrVmMzTlI0a1l0bkZBTUQxa0pVakF1OUdMVnY0OGI2WEFSRy80a0lPeVN6?=
 =?utf-8?B?YzE3b2p0STJRbUNGS2tTUVB2R0NUeEpaRUowUnR5YkIvN28yQXpDakhuQ1hp?=
 =?utf-8?B?MTQzUEdQZnZVWlpYN2FJZCtGbTE1SnZraERyeVh2Z3ZOc0l1djhmbDdGdGxH?=
 =?utf-8?B?cW9QWFFyenRRTjRhdFBPYlN1QTJSM09mbDRhU3lNRlZNY1dIVnZjaHZ5cVZz?=
 =?utf-8?B?ZUg3WDRBc1NFQ3A5RWV5d3FraUU5OTBhdEg5OE9GUEIwenZpNGo0Mkd1V21G?=
 =?utf-8?B?T0hEVlpqcVV3YXVlUkhsNE95UnlwU08ySkU5MUxiVmZDbVdJZnUxSkgvd0Q1?=
 =?utf-8?B?c3Ridnh6cDJaZm1oVnI2aWhXaklZWUxYYzZManZVTG1obUh4QWVETVdKczhF?=
 =?utf-8?B?b2s0VzVDdDNZTzNXbTlPNUpYUW8wYXJoZmFPcklsTzFkaVRtWmFOREpTMjVQ?=
 =?utf-8?B?L2taR2tVT3VXb1U1cytQTkdRVzZWQklYM0xIZ2VZSGRIcHFNaFpxU0VEWGVI?=
 =?utf-8?B?US93MXNkdzFnN3VuMVdET0dFTnlkNE1tVlYzd2dyWHJUV1JqaEk3T2pHbXl4?=
 =?utf-8?B?cEI3ZVRyS0phWGg0YWtDNWZtYTRTMU9iK0N4WnRnT1MxcFJtWDltSDF3M1hr?=
 =?utf-8?B?R1RBOFdSNE1xbmZ6NjI2QXVQczlST0E2eUlObVpjVys3Yk5uYkZTSmhkaHdm?=
 =?utf-8?B?QmZ6OEl0bStoVjdDUTMzZFhUUUk2NEZwZmhPOTJUNDZDbm85Q1JiRC9PSkpT?=
 =?utf-8?B?OURvWGNDclNmRmpOWXNXeTB1SDNZclAzb1kwb2s2aFJVblUxYnAxVmhTcVBJ?=
 =?utf-8?B?ZVVSRHVJUWpOLy9adGp3NHI1VG5CUzRPYkVuQitsbFlXd3Y2dWUrMGdyUE4z?=
 =?utf-8?B?OEdLYUErM1VPNWgvZ1BoRm9yY1pwUU9MdHBjeDZrNG1NUDlsSmlqQ3lrcXk3?=
 =?utf-8?B?aisxMEIwUGZEZmtKN0hGK2pXSS9ZZE1XbFlnVzNjajhXL2QzUTlmN3k1QkFx?=
 =?utf-8?B?Zml0NzVoaEo4anVUdWV5Y3VBQjU5MUxrQ1QxWndieHA2ZWNKTlZheEFkdTFJ?=
 =?utf-8?B?czBXK2RmQUZQSWFTdzdkSzhSS2Z0amZ5WXA0cE1rWGlBNTlMWlFZK1RETmZ2?=
 =?utf-8?B?N0xCRFlJaVpwcEU1S0xPTk5WWU1TRlBPaDVpbWdRSnQyMG84ODdMbngwd2Yv?=
 =?utf-8?B?MFh6ZnNBVWpydEhkN3VFVDdMNE42c0t4RWwxUkJpSEVwcVl1bmltNVpPK3Mx?=
 =?utf-8?B?aE9saEhHYTlkYnRhZVhNK0hheEhtaW1WcUdWeFZaNUFqK09hTWdDSU9IK3VJ?=
 =?utf-8?B?SlJvR3pmQVhWUTJmRUs4cFRZK0lrL3hESEFPaVBtVk1oUmNKQkMxL2JDbVFv?=
 =?utf-8?B?VERSRTJMdTFUWG85WWxHdHFXM2pCZy90eWZkMVFrT0VSUWNzOURQcHdudEN0?=
 =?utf-8?B?NHhrN3kyWjVNMFJoTlR4K0NwQit0cW1DYXh2K1c0QUZ3Nlp4cE9VYy9sYUlp?=
 =?utf-8?B?dm9ZTThVdU94WkxtMFkzZ083Zk9rSzB3Y3BNaDR5TEhmWkZETEFSMEVXZFZY?=
 =?utf-8?B?OHV0U3ZmbEthQnU1bkhJRHdRUzhTdHFKSTBaSVpZbVhGa2xUYzJnZFJQVkFL?=
 =?utf-8?B?MU9SR2I5ZWxpNjd4Y0pvcnJpTWhSVlJxeWR5Y3g2ZTNtaUh0b2dPUjZrOEE1?=
 =?utf-8?B?YlVFcnBaQmdScVRiT3YrdHdRVnRMdU9Rc1p6Ui9JSUxTVTU4MWxkenJFdmhU?=
 =?utf-8?B?WVlLR2xFWjBLd0FieFk1R0VYUnhUbkJqTDZCWng5OFhSUTlmcEY1UGFJeThx?=
 =?utf-8?Q?bwwMJQ4OlEsUhzrphtJyNiEXix5ry8j1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmFvMHlKOFB2TnQ5NW83T2JVWGR6S1ZRWWdtVzR6UHliZkpYSEdYUlh3bzZC?=
 =?utf-8?B?QVdMd2dMK1ZrQS9oNFJNU3lhenNFYWM4RWdsQlN3b3pzNld1T1doWFVlemNT?=
 =?utf-8?B?M0RXOGdYZWFSOVd0MmVKYk90Z0dLT2FSK0t3WnRBcThqVFQ0VFBidDIwWFYx?=
 =?utf-8?B?YWUzbVBwcXNMNFdBMG8wcFFBR3RsL2c5S25oUG0vYVcwZ3VRMkZOT0RjWFJD?=
 =?utf-8?B?cDF6QnBDaGp6SFNjRGFMbDBjb3JoL1JSNkdmTmpnUjVyU1J0WnBBejg0aVM5?=
 =?utf-8?B?QThsVmZPSW00YlFvMVlrYW82WDhTeTZ2NVZ5eFJ2enU2Z1I4Ri84b09GcnZj?=
 =?utf-8?B?YzloeGQvYS9MMHpVc3JXU3BUK2VPQW92dmwwQzJ2ZWUxOFc3eFd3VEtQdkZu?=
 =?utf-8?B?UDZGTHdDSzFvVis2d1ZnR1ZUU2krUDFFSWsxWG1JWXk4RjBocC9CODA1R0tH?=
 =?utf-8?B?WWtKZ2xHbGo5eStVQ1lHcUdpODlhL2ZxdDE3SC9HT1h4aC9VRHRrZTZNVnVT?=
 =?utf-8?B?NWhXdVNCc1J1N0tOTi9DQW94RytxWkNBSGVYaEtpeUloNktINWRKdnVPbDYv?=
 =?utf-8?B?MlFiYTYvS0lrNy9LWkF3OTNRR1gxMzBOZHZnZ2JZSUdXY01EZ2hjM0lKUG1s?=
 =?utf-8?B?cWJoTnhTTXY4RlEwTEtvR1RTbU1PVlh0Ymd2TkJMdDdjdVBuQXhwanI4SlY1?=
 =?utf-8?B?b0l1RVk1L0lTdHp0NnJrYitnVi82b01lclllcm5hRWEyODRZVUJ0ZW1oQUZy?=
 =?utf-8?B?NzFTRnE5dDBpU3JmNldaN1VPZTRBSk5mUUtTNjczTzJNVkxzUHlyZDhicmU2?=
 =?utf-8?B?YUoydEhnbnhuaFdaRFEvVTZwc3VhOG1BTUszS2ZFY1RGU2Y5a2hIQzZxa0hv?=
 =?utf-8?B?Y3pqbmlveUtwR1ZvcVFjSWRQOG81NXpIY3NsZXA1aXV1MzZDWFo1NmNsb2Vs?=
 =?utf-8?B?a3ZDek5XQ0lVMkVMd2hvelMxeGZkU2JCZmpGVk50T01oZWd1OVZHSWsvYkNp?=
 =?utf-8?B?Um1CcTVkK05UOCtEcWdRRllFaE9NbU5mSmliZStSaHRkQUhoZnBibXFGRTBM?=
 =?utf-8?B?dldwQU9jSXVsU1hmVEwzVnVBYzVkeTBaelZKaHFYcVFYMkMzZ1ZKeE9kb2pS?=
 =?utf-8?B?aDM1cDYyM1cwSVRuVWdDVDNWdkd4cGNnZjBpMG41NWlMbWF4NDh2eDN1bUt5?=
 =?utf-8?B?aXh6cjB6bmQwUlk1MGdFNkxXQkQvU0hRSldqeWpHUmg5OHg5VHNSNGxIKzh3?=
 =?utf-8?B?a3ZQY1AxS2pUeUx3alRvclZ4cFRaWGVrOWNDUElkZnQycHBZaEhqQkxaN2dr?=
 =?utf-8?B?Y2hQZXc3dEdXYWQxOVRzd1JreXBoOFA4ZU9KNHVETUhvdy9hN3pHUnpoVks5?=
 =?utf-8?B?TmN2aitDdVhPUlVOM1RHdjI2UjBCcUNXNFlDNTFsZDNTZXhLbjYrWGFnKzBp?=
 =?utf-8?B?bHJvVGxTVDV6UittazRaSVFKQVQ1Ym1wc0ppQ0xPNU1kTHh2LzlQc3I5Q3JX?=
 =?utf-8?B?ZmdEdnZ4VFVmb0ovclY3eWRwRFliMXdzOHZOeUZtdDJ3NkZMV1B3YkxNTnJ0?=
 =?utf-8?B?NXU0TCt3SHM4ZDdzanVxeFk5OCtJeGptdUpnWHBJR3NaYmt6UjV5bWR6Qmpv?=
 =?utf-8?B?VDFBMG5lYy9pbTZudmxQR2JjTHdaM01Xdm5xTlM4cWZYZkxxZUlZb1JaS0dk?=
 =?utf-8?B?cXJKT0p0MVZQblZjZ2gxTXRpZDFsekxLeHNQUkxtVkMxWmhiaVBxenQraWN4?=
 =?utf-8?B?RXY1K01teTBuWnB0T2dib1QyUHBZTFU3NXRvY2UvbStmS2N6UkUydm8rbm5N?=
 =?utf-8?B?b0dtaXNoenhZVUp1WnBvUWVibjl0N0o4aFNaMmgzazArSzIzMXNlRUVmWFpG?=
 =?utf-8?B?bmVzM3RnV0NLK3pPWUlrQWNJbkF6WWxabEhLNGhpRmV6T3lKODI1Nkh6SjZP?=
 =?utf-8?B?aFpLQnJSRkt1MjYyN3VhMlBmaE1yYWprYkovMEhjdW9HSGRLQTRjTWVIdDB3?=
 =?utf-8?B?UXdDMEJEZkM3MzB2ejkrS2duSFRwUkQ0UDJreDQrNEVrYkhkYUkxdHhveFFL?=
 =?utf-8?B?UTZFd2R1MVNLWlpUbkl0QzYyOEZSdDh4ZXNwQ0ttYk5NeXAxWDdYUkhPUEdi?=
 =?utf-8?B?WlEvbWQyMFBLSFRlWUt6SkEwTHNOaHZ6RlFpdkpwTUIyU2ZOejBGMy8xeEVE?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f93a78cf-6ee0-4967-eaba-08de37c9848c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 08:52:58.6799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQM0FWkO1HPT8oOnaQbBe0xEUu7BM2EtGutX9V0F6kQebO95yuEOWb3FHmBsLQzQcax/brvsWZYoy1sWYb7yiGrBPbyw4tm1o2ppzb5TzQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5120
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

Hi Mohammad

It looks much better now, but I still have a few minor
points that could be improved.

On Tue Dec 9, 2025 at 4:23 PM CET, Mohammed Bilal wrote:
> Replace the old connector_subtest() + per-connector igt_fixture blocks
> with a unified CONNECTOR_TEST() helper based on get_port(). The previous
> fixtures were always executed even when running other subtests, causing
> false failures when HDMI/VGA/DP connectors were not present.
>
> Using CONNECTOR_TEST() makes each subtest perform its own connector
A lot of definitions in IGT are in lowercase, you may consider changing
this one to lowercase as well

> lookup and skip cleanly if unavailable, while removing repeated
> boilerplate across DP/HDMI/VGA hotplug tests.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_hpd.c | 240 +++++++++++-----------------
>  1 file changed, 97 insertions(+), 143 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_ch=
amelium_hpd.c
> index 161f494e9..198ec6039 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -463,157 +463,114 @@ IGT_TEST_DESCRIPTION("Testing HPD with a Chameliu=
m board");
>  igt_main
>  {
>  	chamelium_data_t data;
> -	struct chamelium_port *port;
> -	int p;
> =20
>  	igt_fixture {
>  		chamelium_init_test(&data);
>  	}
> =20
>  	igt_describe("DisplayPort tests");
> -	igt_subtest_group {
Does the igt_subtest_group need to be removed?

> -		igt_fixture {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
> -				data.port_count, 1);
> -		}
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd", DisplayPort)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
> -				     TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-fast", DisplayPort) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-enable-disable-mode", DisplayPort)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-with-enabled-mode", DisplayPort)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> -
> -		igt_describe(test_hotplug_for_each_pipe_desc);
> -		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
> -			test_hotplug_for_each_pipe(&data, port);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("dp-hpd-after-suspend", DisplayPort)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("dp-hpd-after-hibernate", DisplayPort)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> -
> -		igt_describe(test_hpd_storm_detect_desc);
> -		connector_subtest("dp-hpd-storm", DisplayPort)
> -			test_hpd_storm_detect(&data, port,
> -					      HPD_STORM_PULSE_INTERVAL_DP);
> -
> -		igt_describe(test_hpd_storm_disable_desc);
> -		connector_subtest("dp-hpd-storm-disable", DisplayPort)
> -			test_hpd_storm_disable(&data, port,
> -					       HPD_STORM_PULSE_INTERVAL_DP);
> -	}
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("dp-hpd", DisplayPort, test_hotplug,
> +		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("dp-hpd-fast", DisplayPort, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("dp-hpd-enable-disable-mode", DisplayPort, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("dp-hpd-with-enabled-mode", DisplayPort, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	CONNECTOR_TEST("dp-hpd-for-each-pipe", DisplayPort, test_hotplug_for_ea=
ch_pipe);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	CONNECTOR_TEST("dp-hpd-after-suspend", DisplayPort, test_suspend_resume=
_hpd,
> +		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	CONNECTOR_TEST("dp-hpd-after-hibernate", DisplayPort, test_suspend_resu=
me_hpd,
> +		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
> +
> +	igt_describe(test_hpd_storm_detect_desc);
> +	CONNECTOR_TEST("dp-hpd-storm", DisplayPort, test_hpd_storm_detect,
> +		       HPD_STORM_PULSE_INTERVAL_DP);
> +
> +	igt_describe(test_hpd_storm_disable_desc);
> +	CONNECTOR_TEST("dp-hpd-storm-disable", DisplayPort, test_hpd_storm_disa=
ble,
> +		       HPD_STORM_PULSE_INTERVAL_DP);
> =20
>  	igt_describe("HDMI tests");
> -	igt_subtest_group {
> -		igt_fixture {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_HDMIA,
> -				data.port_count, 1);
> -		}
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd", HDMIA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
> -				     TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-fast", HDMIA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> -
> -		igt_describe(test_hotplug_for_each_pipe_desc);
> -		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
> -			test_hotplug_for_each_pipe(&data, port);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("hdmi-hpd-after-suspend", HDMIA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("hdmi-hpd-after-hibernate", HDMIA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> -
> -		igt_describe(test_hpd_storm_detect_desc);
> -		connector_subtest("hdmi-hpd-storm", HDMIA)
> -			test_hpd_storm_detect(&data, port,
> -					      HPD_STORM_PULSE_INTERVAL_HDMI);
> -
> -		igt_describe(test_hpd_storm_disable_desc);
> -		connector_subtest("hdmi-hpd-storm-disable", HDMIA)
> -			test_hpd_storm_disable(&data, port,
> -					       HPD_STORM_PULSE_INTERVAL_HDMI);
> -	}
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("hdmi-hpd", HDMIA, test_hotplug,
> +		       HPD_TOGGLE_COUNT_DP_HDMI, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("hdmi-hpd-fast", HDMIA, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("hdmi-hpd-enable-disable-mode", HDMIA, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("hdmi-hpd-with-enabled-mode", HDMIA, test_hotplug,
> +		       HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	CONNECTOR_TEST("hdmi-hpd-for-each-pipe", HDMIA, test_hotplug_for_each_p=
ipe);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	CONNECTOR_TEST("hdmi-hpd-after-suspend", HDMIA, test_suspend_resume_hpd=
,
> +		       SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	CONNECTOR_TEST("hdmi-hpd-after-hibernate", HDMIA, test_suspend_resume_h=
pd,
> +		       SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
> +
> +	igt_describe(test_hpd_storm_detect_desc);
> +	CONNECTOR_TEST("hdmi-hpd-storm", HDMIA, test_hpd_storm_detect,
> +		       HPD_STORM_PULSE_INTERVAL_HDMI);
> +
> +	igt_describe(test_hpd_storm_disable_desc);
> +	CONNECTOR_TEST("hdmi-hpd-storm-disable", HDMIA, test_hpd_storm_disable,
> +		       HPD_STORM_PULSE_INTERVAL_HDMI);
> =20
>  	igt_describe("VGA tests");
> -	igt_subtest_group {
> -		igt_fixture {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_VGA,
> -				data.port_count, 1);
> -		}
> =20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd", VGA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-fast", VGA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-enable-disable-mode", VGA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> -
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-with-enabled-mode", VGA)
> -			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("vga-hpd-after-suspend", VGA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> -
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("vga-hpd-after-hibernate", VGA)
> -			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> -
> -		igt_describe(test_hpd_without_ddc_desc);
> -		connector_subtest("vga-hpd-without-ddc", VGA)
> -			test_hpd_without_ddc(&data, port);
> -	}
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("vga-hpd", VGA, test_hotplug, HPD_TOGGLE_COUNT_VGA, TEST=
_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("vga-hpd-fast", VGA, test_hotplug, HPD_TOGGLE_COUNT_FAST=
, TEST_MODESET_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("vga-hpd-enable-disable-mode", VGA,
> +		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON_OFF);
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	CONNECTOR_TEST("vga-hpd-with-enabled-mode", VGA,
> +		       test_hotplug, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_ON);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	CONNECTOR_TEST("vga-hpd-after-suspend", VGA,
> +		       test_suspend_resume_hpd, SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	CONNECTOR_TEST("vga-hpd-after-hibernate", VGA,
> +		       test_suspend_resume_hpd, SUSPEND_STATE_DISK, SUSPEND_TEST_DEVIC=
ES);
> +
> +	igt_describe(test_hpd_without_ddc_desc);
> +	CONNECTOR_TEST("vga-hpd-without-ddc", VGA, test_hpd_without_ddc);
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	CONNECTOR_TEST("vga-hpd-for-each-pipe", VGA, test_hotplug_for_each_pipe=
);
> =20
>  	igt_describe("Tests that operate on all connectors");
>  	igt_subtest_group {
> @@ -623,7 +580,8 @@ igt_main
> =20
>  		igt_describe(test_suspend_resume_hpd_common_desc);
>  		igt_subtest("common-hpd-after-suspend")
> -			test_suspend_resume_hpd_common(&data, SUSPEND_STATE_MEM,
> +			test_suspend_resume_hpd_common(&data,
> +						       SUSPEND_STATE_MEM,
Please, do not add newlines like this. Maintain the current formatting.

BR,
Seba

