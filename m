Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1610CD6E64
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 08:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E3610FA52;
	Wed,  3 Jun 2026 08:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+7tfE+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B9010FA59
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780476120; x=1812012120;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0qncRuvCZcGn7P7RXqsvl2yC2B2l+jvBtXwSEzScaNs=;
 b=N+7tfE+Bu5ftmQ3Rey3q0rQAYJmW6RRBwsVjwNsZVE6DDZ0gM2p/jbGP
 +SepBF0rHm6BAGB11KWwHlc5GKF8VhRXrrzKrWhsaqhrns2r1IiiUWbsx
 MgI7+wZoHLACFLZmL1Y2myiprhKleZD3wyy3P0zqwNnRfGocpUniNquSg
 e3+wjYnf0k5kSpxGMmIHruFM+0HPj4BCP6iBbGnKgQqw6lfIB9DRY5tk4
 SKcsp+MKFj1eHdtT6d/eltRtJMdFMONDRhLukqAOa+TNKNHl4z5ldjpPN
 xLx+UMtVuXvQXburhxnTSBP+9U6JQqG44fPpeeZpxNOakKbc7V8ukK2Ob w==;
X-CSE-ConnectionGUID: gWDMIfswQXuZBjAwvzPDIA==
X-CSE-MsgGUID: rnpXREddTFqPGEVz8YEIvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80419090"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="80419090"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:41:56 -0700
X-CSE-ConnectionGUID: doJemkapT+Kl0qmiQkD0LA==
X-CSE-MsgGUID: /aVTnQgWR56RSyWLntoemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="282272878"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 01:41:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:41:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 01:41:52 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 01:41:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N25jD+tVOdqzZU3zLyCxz9c5JYV2gjFv2TrWMlS7HovIZ4uOzI1CZOwHrlDSh3KJDiTShaJ51qysxeoFUR2vj8oWwViR1u5w0m+xcI4Y6/MpuVC0usj4KbgPiptGjns4vmhNyb8D05W0+8QdOJQIGxBhZGvxKX9n9IOjpYxBxI9OiBHAkfmnP7t2WhlioQcA6R0kuEqt8THMP8K1g8v7/PAi8NPtoG2W69/b21Cvc8KNH+Ly559cQ0A7MuUwHosW4mRadprMJTRWdiKqXhENDDKv6zNF6bslz3dzEgXsZvu1efaVz+RPajkvWxBmRdiyas/v+LQoNoZEUWaB6/Eteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3mRj/3Qkbanoo4KYRdUbEjOvTXwkVYnq3WdFiul1YE=;
 b=dR8ZYeFT/u7n7dA+spwMUIsGc5tIVTEP9Wt0gTV4+i8lNKBHJ5UAGNmEpXQZE5lWhkllfQ5ccYv47H8/1ThfALzYAJtTR/7Ee4gLY4W2mQwVSabtVVFX+9P1O+A2/0J9F1MBGBiTO6ljtwvtpE6CVynFvKuy9tm6VeAaApcQ3fjoohIgT9zrOm2wHg2+Pe++gdu2kKrP5a4xpK9Ec6b0kCqU5RL9mh0m3HljEyo06+ZuU6AsQJ1X1+7eFuhgvYXvp/ieezxHhDIvHC6lknmx88NwRHnBJgxdOAFGVYHPLQGmzb3ndpCPQeCOth2MjYUWlKEjGbYHCgNLJPwusWqDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:41:48 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 08:41:48 +0000
Date: Wed, 3 Jun 2026 08:41:36 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: Re: [PATCH v6 1/2] lib/drmtest: add drm_open_driver_path()
Message-ID: <wgl7ekqbiyt4iugadulvze63e3ejx7dgcipvxekh7djwkfej3r@m5ihlyqpaslw>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1780397630.git.sebastian.brzezinka@intel.com>
 <3636f67c531c0e99743682c5f69ede74f5e0487f.1780397630.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <3636f67c531c0e99743682c5f69ede74f5e0487f.1780397630.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL0P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::12) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4dbe5f-8e97-456e-59c8-08dec14bf352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|11063799006|4143699003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: JEughD6XGJmHoz0eYODr3ZB2PE7IJp1F5lyTuEjgwmHkgSkoMDAlgJjDtUX0jn+ES6FRtUfIrW9hYzNyTe8fZvycalXlMVLX587b/fi63jf7GM2sJAPwvNK5cGx6Zci0qbakIqDSq5x5nsE/LLgSx3ecTq+frGmnAx1SmXEJn61UNotm3qUCDisk1INUmHANS/WV1HXWFKgkBf3Vx55QXAo7dhZHzjC0yaFaaZawdrAjf1shH7sK+SeZb2uZj8Y9Xee7zx2XXdNTuTwWPEyz0exeF/0EbWocmW/1CDvwJ5cEBK5+Jg0Y0f/X3pRYh8Bim9WZMb4ROvAYqesceKHFBHiNLWcbvyiKnAFSANZcM/N3DRgt0KkvkTsBRJC4WDFdRRHwt495vwXu0kjlTxxoM5tvCRrNVSCwryLikOas8Pe6KLmMpyBCPmGmHqEmaRpzm1LQMuGVtBSx98/oTMhYNkP8qsnxKo2MK9Sw/GQT0ag6P5tUPsDIcBzAO+vpO6ztDX8/BP5TJY08R9QsV2Q8/eJY1NWm6/rPgsj/yK3xntQBm4D8tGLwVNSLpCHHpwT+C8QiG+XP4jcj4akYzjIEMxILga3gxLEULrVtJ76jgffV8YFDd+fEz54YbIOlY3NcqsaHhAK7e+eWrZLp4yj2m87qlUUy4rWk98re5QOAfk4JBXL+vuWc7UYwdP/eY0jz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(11063799006)(4143699003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDMvNlZhWUlubi9RUGNPemc3T2JBYUtPOHpDQ0RkWUVTbCtLQ0tIckR0VWJz?=
 =?utf-8?B?QTFFMXhuMmJ2MFZ1cHZMYnJLcmVPeHBiTUtCdCtXZnRuemlIdFM1UUg5SFVF?=
 =?utf-8?B?RHc4bEd4Z3dtNWxaK0ZKSFVkSFZ2YmJ6MmJDK1h2T0g3NUg1L01pbTdnT3E4?=
 =?utf-8?B?LzF3NGxrOFM0dDd6K0dURjlMT3lVWmpuVlk4cVZRS1hGbWJsTmU5dk9CdTlv?=
 =?utf-8?B?dWZGQXVpN1BHWEsrRGR5SlY0b3RsU3JsSmlpYWNwVFZ3WUI4Ylp0bkd2Y2JR?=
 =?utf-8?B?K28ydTh3bGlZdk0zRWlvd1Z6NEJHYlVvMHNjWXIraTl3NDZEcCs1aHlPRmYx?=
 =?utf-8?B?STNHZzc5N3hibUs1VmlkM1ZlRDJzNE5zNFlHbmtLUmhDUEJMVjRTaFhiZk9q?=
 =?utf-8?B?bkJ0aElkeXdGcTJ1T2hrRlo3bUdCeGxmQTVIajczaXBNY3BMb3VTTFRQTVkx?=
 =?utf-8?B?bXJtYTgzMDJsTW1veUd0S01ENHZVa3RyQ1A1cm9IeFdJZWdnUVZ5L3JrUXM0?=
 =?utf-8?B?cDlJNnFKblVhbW03eUJlMEZPZlJKd0h4eXFOZ2xXdGxOOEhVOHR6VWJqQUtu?=
 =?utf-8?B?Tm1RVFE2N0RXOWlFUkgxeUdNa2VlODBvYllMRXBQa21CS09MdDJocG5PSHhB?=
 =?utf-8?B?VG9vdnI3QmROZEVmVnNZMDZiWWRodzdscEIwUlRhNW5Yc21mOXRVUzl4dUlI?=
 =?utf-8?B?QWhjT01lQUJQRzdMMmkrN1Q0bk02YTZnNHoxd2tORzRvM1E2Tkg3QnNidTJS?=
 =?utf-8?B?cHJaU2FPbUM2Sng5QVg4Q1Zsblp5N3lNZzkxZjJDcVd4MEdPUDl5Ym5rQ2E0?=
 =?utf-8?B?VVJZYlQwVE84TEplaVBvRjhkdGdiaURrRUVjZ29HSk9GdUtpUG94cU1OaUZY?=
 =?utf-8?B?MENNdWN3ditibVRUa3FqbCs4U2pVVHhIZWhCbXBrT0ZtclphaU1OeDNTZjh5?=
 =?utf-8?B?RUw4SFdxdzdibnJjb3lZOWYxK0w5N0syUFJqeUJidjVMQ3RLaHlIRUFpUDJ4?=
 =?utf-8?B?dWk0WGdOTm01eFIrclpNakwxSlZQbnZ4Sjk0Wmc2UmJrYXFFQ09PNHpLVU5G?=
 =?utf-8?B?RTNkNURMY0gxZEVUcGZOK2xveFE3ZFluN2NEREpoM0VYVjFHT2VFUUtmQmUw?=
 =?utf-8?B?dGl2RVIyUXEyb3FzV3d1bnZzUTRvMWdnNUs5SFFrb0Y3eitkZGp5Q3BCdS8v?=
 =?utf-8?B?cWh4NFE1VFYrc0Z5Rk5nZXBidGt5MXdyOEpmbi8xVXg0bmgzdkFmbzZqU1Rm?=
 =?utf-8?B?TSsvVW5HSFBCZmVGOFRWQlJDRk9CVTdLellIeTZ3QVo5SWV1T1hVZDhGZld4?=
 =?utf-8?B?TGFmbUhiWk0yR3FtdUdSZzhIeUlRUWJHdVc2MDhNS2VlVENFdXBMMHNrNisv?=
 =?utf-8?B?bUxzNjZoVHh3SDdUajYyc3V3bmZNMnF4RUZNSVRHQ0pJRkxOdDNVRTRMVnpq?=
 =?utf-8?B?enhaMEFCNHBKZkpxeGdrZS8yNFpWWmwyK2lITkcrWitQUDErMDIrMGpWcEd3?=
 =?utf-8?B?RUFJQnBFNXZuNklIMEJUbEtuZFB5cFJpOUJCWVFBVW0xUlZhY0RLWlZhbnJx?=
 =?utf-8?B?MzN4SGgzM0xuZFZLaW1PaUVOSEN3NjNvK2FjNHV5VzBPMXg5d0k1VWdxZ0JJ?=
 =?utf-8?B?Z3RZcHhxeWlGQ29vOTNFdThST0RNdjhtRTZDYnNIZnlFdUVqTXI2QW0veGpn?=
 =?utf-8?B?UVZGVTROVjhqdUJOUHQvVk9nMmRGNDB6VW1HRkd6eDNzUDZ3Qlh4MnlETVNq?=
 =?utf-8?B?ZTBjUGRNSzczV081UElqZ3V4enJkNXVYbWNwdWM5NlNhSUt6MVpHK0RRckRv?=
 =?utf-8?B?bHh1WTQ1b05GcTJXNFN5ZFNyRkFkdDFpdGVDWFQ4OXExWlkwSnEyOUd3bEpV?=
 =?utf-8?B?VkoremJZbjRmYkRZckpFY2pZMVZlcUFLdzRWOGdVd05DSSs4K1lsNDZMSjZs?=
 =?utf-8?B?amZvYmw5Y3BRSjBlcG1FR1hKNERRdzlXQUpET0d3dGdqN21Sd1hlZGhjcmpE?=
 =?utf-8?B?UkRjK1hIL092Sm01NU1reUdPT0RiK1Zua3pPQ3ErSzU0UmVVcWoyOTZhc0Za?=
 =?utf-8?B?TXpRTGJRVGxzTlhjVk1YeGg2eFdXMU1GZHowV3dRSzVJL2VxeFM0cFkvOWJC?=
 =?utf-8?B?cktkUjNYSmxqdEZaOEE1NVpvYkMrYXJsYlpCa2N0TU4weEYvT21pYzFqaElx?=
 =?utf-8?B?Z3hnak92b2Mwd1l0QjVGa0Zobnc5MysvVWZLUTJpL2U1T3RBcnlUaGVrdml1?=
 =?utf-8?B?RDVHL1dwQVRPUGVXUm0xZk5GK0FUVUFMd0ZBNjc2VFFFVTlDWXBCYmNFeGRP?=
 =?utf-8?B?WTFyOWk5MmZMT0hHR0EwYTErS1FSMXRSaVNmeXAvWDEySytZZW5vdzBZUVQ0?=
 =?utf-8?Q?7Zepw0XjWcub6j+U=3D?=
X-Exchange-RoutingPolicyChecked: QNTiNzA6/1hHU3CeuZKEGThFp+dcPAIU3xYg1CniAkyMcULS+y5oL3+byO8s1nUhj0FG5Eqr2SPG4goUIv4OytuQ2XR/GC/gF/LMSL5vpW4WNjcoEikCu8i9h2R9J3m/upaQkcTC1lfd5OO7/+eUdaCZ0MWbeZhyTGAp595sdD2aYVLrfc4j89JKqSQCN5SUHkOHjMPGFkT1RdHf/CmxjBNd6rKbY1VL+wtaiGEFOVbjPW6O80QRsOCrnA6X7wanLrc01+3J/TQ5AaBwJL3GSIwKwLHUkshL6HyXC8T+ib84OZyI8GqARKFKwyRURFs02TR7s2snu1C8anhYSloKlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4dbe5f-8e97-456e-59c8-08dec14bf352
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 08:41:48.3528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: st3lJDpBw8eFVK+76k3GL+MI8KaQ+JWn5lYd85ZW0vi8rTLsEuwq760qGC+fKhMWfjurRn07pHi/6BjEBpxrF7nXiFy/z9TAuY5SLIKzVBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
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

Hi Sebastian,

On 2026-06-02 at 13:50:57 +0200, Sebastian Brzezinka wrote:
> Some callers already have a device node path and don't need the
> chipset-based selection of drm_open_driver(). This helper opens a
> device by path, checks it is a real DRM device via DRM_IOCTL_VERSION,
> and sets up the Xe device cache when needed.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
