Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA26CA0FFD
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 07:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58CC10E396;
	Mon,  1 Sep 2025 07:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7L3rYaJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34B910EBA1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756470707; x=1788006707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Ng3us7x/nMEchOmfWspDBtgo5+eNCe/GfdXYW+lQ3c=;
 b=P7L3rYaJpzpKDLbAkseuyZunvCA1xwlJXFjyIjYXgYQXAWQVaxjSzhmG
 FlRJKHsiq4P2NrU7ArATWEaRPjUxbDTaE9urkLpkWKiXwa1GsFNMjFbQO
 zvQ5lBhdLBjtWzHv/IWVMj4RkQBVYmFreUhjBaqJXVGnJUomgNeX7Q5R6
 Dpid8qklPFPKqVHnq4FCa4UEOQ09SgcHh3P2PhUC2Vjiwz2h7ocGmUm67
 0hi07TVchE5qiBgtMvB7/MBhTD5r/yftxfk+TDiAufNr1ZAFhSTjeV7Lg
 l0ckPZhaGSCQRpLcEyiUrm8sl4LL2N0nML4bHKv6MCkNPd44PFvaadwOM w==;
X-CSE-ConnectionGUID: gJ/wcdE3TrmJ2yvFBZ/WTg==
X-CSE-MsgGUID: wocFDSB9Q+q/INZxKOOJ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58461933"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58461933"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 05:31:47 -0700
X-CSE-ConnectionGUID: Z9kthK8AQ3WbyHLgC3W4hg==
X-CSE-MsgGUID: Nt0T34eIT3aCgE2T1rOrZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169672986"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 05:31:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 05:31:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 05:31:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.83)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 05:31:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHjvGLbr0vUmtKTAc6MoUBngcwdNvi9E5t5qGBmC8CxMMPBeAzMszy6mBkWwUxyi1ss0KpGnyx4ioKAg9wdldcBiBkajUw4O+G2f2n5+Y1lHOQGSv/2st/4YvSGhv4NAsMdJr65dpKW1AeMKkqeTQCO5uZozTw0e5CWUiGiVFOK7OWz4BoHGIixbHLSOTyqM61yF/SKrhdtKS1fKT8ZLd9IcIjxmCeQT5pWTk/ftJwPrsErSbUWCNBGtmS1e8/8yi0VPyh2VslB1kwlmRYxahreTc2IkpE1cf301pnm62HVnqljWQJB8qLefFZUMj+pQxx2O/mRVkRnKx8FdIptNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcoHnYZo2gUIiv3PTjtJ9zzF+wZuWjVrTNXu3sMY2js=;
 b=xCNs5A2mW57sRCLx3cLdgYOw5E47ztYsd+dYkv7VVnVbaI210JkoOE+xaox2Bg7o/sBIYimUwgDeTYyCWBc+Dj0s/T8ZukP+s/o7ooab8lnDdId9zAQK5dqppzlp0VqjY7KGCm3JcepB1n5Tms30VJQhd9gZXvtlU1n4OF0mmL0vYxDccLzPwT/XnmNEbhMoOkXittiEhn7FEsg83yYaUy7McCNCJ9WZIpfWP7wyKsow8R5FejBV+9LWpFvxS4cIl1CVNhOCHRjG5NehN7gjq2FlIx6uHTb365F2EgdT46Gkd9oU+0gA2vZXDvAKRPvTqzeDiwIFjMjiD+R384VGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ5PPF8A49C4DF4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.17; Fri, 29 Aug
 2025 12:31:39 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::b358:b7a0:d076:38d4]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::b358:b7a0:d076:38d4%5]) with mapi id 15.20.9052.013; Fri, 29 Aug 2025
 12:31:39 +0000
From: "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Poosa,
 Karthik" <karthik.poosa@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>
Subject: RE: [PATCH i-g-t 2/2] HAX: Added list of test cases to fastfeedback
 list
Thread-Topic: [PATCH i-g-t 2/2] HAX: Added list of test cases to fastfeedback
 list
Thread-Index: AQHcF+3H3lDW3RIUo0SZftFAAqSS7rR5f/YAgAAP6AA=
Date: Fri, 29 Aug 2025 12:31:38 +0000
Message-ID: <MN0PR11MB62070493976D79DC8DE109E6EA3AA@MN0PR11MB6207.namprd11.prod.outlook.com>
References: <20250828073114.1884451-1-mallesh.koujalagi@intel.com>
 <20250828073114.1884451-2-mallesh.koujalagi@intel.com>
 <20250829112732.yaodbjdvglnxyeb2@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250829112732.yaodbjdvglnxyeb2@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6207:EE_|SJ5PPF8A49C4DF4:EE_
x-ms-office365-filtering-correlation-id: a611b469-e330-4ccf-c767-08dde6f80067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?eUwExhw85Xro2xNWte7hNFZbe+ps4Wg4btHBuqeEWS+1L+s5TG0EVX73fQhu?=
 =?us-ascii?Q?CbNa2BNgdAyVbLVBK0TjxORUAbFyKr0GzWY4Azd3gTAYS6vnSZCE824hopDI?=
 =?us-ascii?Q?WUMTwIHzl1u/PxYnWikB63QRFaKHuZGnKVd/Usq5j3lBJ7BSKqhNZe05Fip3?=
 =?us-ascii?Q?00fWM1nP4OSIFgs2el685JF2huujJ8hXqgalKdPa2jne01z9eZEIPBChAwP+?=
 =?us-ascii?Q?VgAL80iCsKOZl5RS0RMWnxwzU7KWYKbCq1EHLnqNqpqL4DuBklc2pFXBYfBW?=
 =?us-ascii?Q?skcLcf2XMzpiQDRA173m0z6qg+m1To0mcWIzQ4oK0/uEGPEtTeSF0Xmsib0+?=
 =?us-ascii?Q?wmuPvUfSkWOrXyNbUNA093IPtkgrpVg4vn6bBiH4xrP44Ry93PFIS9BRhExk?=
 =?us-ascii?Q?moKqGrLZVQodSgQ76kJUAf4Vu2DktHYzEm2A0vQ8+GDttyOz1oPHgnRzU3FT?=
 =?us-ascii?Q?nF8hOTvmguO2B18QSfXGAkxR++b3lsxy6dIvMfv6p1exRt1M4jGtVpWzvxKx?=
 =?us-ascii?Q?2EzOhZ7fD26DMGSvucm4AowSizrJnA5yqBJ+BFQG9idZFnITPXs9oX+XFHet?=
 =?us-ascii?Q?jXRwS68ZoOldB/toAxek+Jfl2FzxiE/B8UZ+1EhbL0itBtkJ8CDwvybNw+Wg?=
 =?us-ascii?Q?HLdS/Pg0EiQVwTgZIHVusHx42pixCCebtRawhARq2vLmiuX24Pz+BTSd0Qi2?=
 =?us-ascii?Q?jUR2Mpl7BbcvDoACgRtJ/yuPyMmYaIxmMZJWcUgqLVgQTLVSmfx9pVdhhNCQ?=
 =?us-ascii?Q?ZOMU36IC6jiM/D8zZiDI7e5LJR+bKzryR3QnJva3iJDrmkIQVM1XKco4M7Nq?=
 =?us-ascii?Q?GtArhyWuPiXYia9eRcJ8ipDi3IgzF21Xt43xinVuCsSmgZoQz7SnsWlUvHti?=
 =?us-ascii?Q?KM2Xa7iw2TyikMizXNtA+2nTV4sccvJrshenPNojpnq+F5ukJw3mKyCNCyPq?=
 =?us-ascii?Q?IIZUA4LlYk65VbD3upyrloCM8ATxJUUhXzS8Y7V6FanR7308qk8IqBiJlx1L?=
 =?us-ascii?Q?nw83WIXSyavTwz6qnk9bsJEifqtLYrO/WTpkggJL5Ii8yupscZ54yCAlFS/P?=
 =?us-ascii?Q?j1c5COOMKCRVcjOOquZVd56nlych9FHDoMNSsrMah03EVH0eoLF5UTZr8dgO?=
 =?us-ascii?Q?cki+E5SKvKv/cSEyHVPhruD2pOlduozoDjkrd236h9tEOOYSCehk/6oe0e40?=
 =?us-ascii?Q?jZJik7v8+76V4ymjAcJS7uIORusNyIvgk2Ld8UZhl+O5F4Se1KEqQGoOTYzF?=
 =?us-ascii?Q?/k/fX2EIpXRfPbxIzoA+z/lts5b/41gDBgArc5gdtY5k7GUV9kHuMTxGckVb?=
 =?us-ascii?Q?5d0wK0pdHvVenAWX5qFTOpTuBxdEC8mHQV3KcG5OBBBVlxHoL2JHt31MQbZa?=
 =?us-ascii?Q?TDVzE2OYyR7J1Wo/NISn3zIW/aJ3LGyNvKtwzkGfTgAVFB5di2rAlMLPSKaQ?=
 =?us-ascii?Q?yLgsKkPgvwk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YxwVE/cy9CuPQCqhuqqTAYZ30On4OuB1Udbfxu3dAL3d7i+85wNNzuwYAfXF?=
 =?us-ascii?Q?8QpoYfu6HJ266qXzIx1T+N5YYPlvddwU/E6K1DgM2FL69yQIbfeGoeFcAlnO?=
 =?us-ascii?Q?umXyIXRutFPxZ4+F8MC+lPDOy1CrIZbniLAm5fLJ9vva+fVctb2DknsYDcha?=
 =?us-ascii?Q?k7Yr5jP6gtxD5rRJzr1aYvDetE9wnlPVcpPFVAMbzrT11W6lW7P7kbYaTRoe?=
 =?us-ascii?Q?2zsfX+izPVFBYtl4nuY/3SfveNCKz3MTWWGmsJjku7CEnoZFtsyeewRwDem6?=
 =?us-ascii?Q?4hp4IGBCOF/VHfb86e1o23QpSKVwSX+IFtUSjDFTysES7ThwD3z7chO7rV/q?=
 =?us-ascii?Q?APve2rxDW2pcWU2Pxt4ypK6twPM1fGuf67ZO5Z5py+dD/xflYlFYejI970Oi?=
 =?us-ascii?Q?vSmxfqJzYgnCR+5Aan0gZ8I/w7w0u+OPXg2juIJq5KWwdAzeW2dtOaRnf8M6?=
 =?us-ascii?Q?BAgbIxVx4yQ8dBzW5sPHTNsEBGOam6CiIc21dDZbAgV4bSRzwQQsbOT3/B6d?=
 =?us-ascii?Q?fVgLL44DzYk9Qtg5Tk1sy/d7EGIFq+RUf3XaEZyEHDa1WXsVUH3Nyi7elu/k?=
 =?us-ascii?Q?KdQQ8Cws7S422YZtXjRo8xaHGvcn8/fN2FrVQV6edh7R2+PPf/JY7o3kUhpj?=
 =?us-ascii?Q?hX1O9W7KtnZKJ7DaktLGJR4B5YQWHpC+JZqXEuxRAq6A8fEvZjZvuz4OplAy?=
 =?us-ascii?Q?c8OUK5FUbypXtto6j2eGFPvZCrWXaqmHi+2BOC2Eys/Byg1sboQ64yyRCNwp?=
 =?us-ascii?Q?jqns/ztIm+PLuuxlGmFNs2lEdObYnEw9nx+FP4haeyEy+81QKpaZV3Xm5sRw?=
 =?us-ascii?Q?Eg9BEYfFcFCzvkRh78GR/s+tVq9oKHp2AulZrbt2ISz8h938moxBf8AY0kjt?=
 =?us-ascii?Q?K+btuChhfCrH8rpHF+Bb3oFMFXdbZOZPXIKd98/rVoX8b4RtvKLY81WQT6q3?=
 =?us-ascii?Q?GsoFE573vJX1ClpUk2AVAbojCs5G7qECqDtUve/46ubiCyETamKpsTqfAwux?=
 =?us-ascii?Q?idYQW3do9RRTwgMkGCRnDDhwUhSEQkQ2kfwOabq7BtyJHOS/aeBAk4BMn4sZ?=
 =?us-ascii?Q?uHmYjyeuaeng4bKQKJB2nPF3JfuDsp0qRSeRWoIkr/Rux8eSe+ye8uW3G8lF?=
 =?us-ascii?Q?054vgIn4KKldyMcPlLlybWsVVJrt4IXP3mZVxNnf7gT70cnTlzYL4gZzJmj4?=
 =?us-ascii?Q?a8jyK7TFRFw6or7FEIJVrSQZv/CJvxEv/72g1SAAZYVwq3dmzPoN7LtsVqCm?=
 =?us-ascii?Q?8aKe92v+g8RpTt39KvYw3kfkWWn4ns3HOlUDOxIdGBOiqdj9nGOAPZtNAPJD?=
 =?us-ascii?Q?ApotP+C5UUhggFwXVMRpXmxa7+EF2Wks1qTm4onlz6/QR6KCsPDDt24WmjOk?=
 =?us-ascii?Q?sYc94QBQQKepeEvOH6kQkysC6v9hxsrrDlV8jNZSB7VS6OwtmL44vhjAw2dU?=
 =?us-ascii?Q?beeeHWMKtIVhJnOj/0a71M/xDkEIrcevcpLw5fb90FqJbUVaBu/XnkNzHij8?=
 =?us-ascii?Q?DE3OGGEIgTI1sQCiBjSd9V4b904kBp5MUUz8tFIj70KANq77QxsrG6ZrJLzF?=
 =?us-ascii?Q?sV3tPtBHveZZsded9PQ9VbUKgNHKBjRnqYVU4iECgSO/5QLzJOy9CVdnB9yJ?=
 =?us-ascii?Q?XA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a611b469-e330-4ccf-c767-08dde6f80067
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 12:31:38.9294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IcdMnhRp3iPewYg0bfKVwDD0xADFIwPliREgCufmo9SAyssfiF7po6+qGjSlCZqEauOTnbiL1+aY9I25MUqGDDUWQ/8cVM4ul0N/cPyMoVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8A49C4DF4
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:23:26 +0000
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

Sure Kaml!! Next patch with HAX commit, will try on igt-trybot.

Best regards,
-/Mallesh

-----Original Message-----
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>=20
Sent: Friday, August 29, 2025 4:58 PM
To: Koujalagi, Mallesh <mallesh.koujalagi@intel.com>
Cc: igt-dev@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.co=
m>; Nilawar, Badal <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@int=
el.com>; Poosa, Karthik <karthik.poosa@intel.com>; Anirban, Sk <sk.anirban@=
intel.com>; Jadav, Raag <raag.jadav@intel.com>
Subject: Re: [PATCH i-g-t 2/2] HAX: Added list of test cases to fastfeedbac=
k list

Hi mallesh.koujalagi,
On 2025-08-28 at 13:01:14 +0530, mallesh.koujalagi@intel.com wrote:
> From: Mallesh Koujalagi <mallesh.Koujalagi@intel.com>
>=20
> List of test cases added to fast feedback list i915_pm_rps@basic-api=20
> i915_pm_rps@min-max-config-idle i915_pm_rps@min-max-config-loaded=20
> i915_pm_rps@waitboost i915_pm_rps@reset

Please subscribe to igt-dev mailing list, you can do it here:

https://lists.freedesktop.org/mailman/listinfo/igt-dev

When you want to experiment with HAX please send series with HAX into Trybo=
t first.

intel-gfx-trybot@lists.freedesktop.org
https://patchwork.freedesktop.org/project/igt-trybot/

Regards,
Kaml

>=20
> Signed-off-by: Mallesh Koujalagi <mallesh.Koujalagi@intel.com>
> ---
>  tests/intel-ci/i915.fast-feedback.testlist | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tests/intel-ci/i915.fast-feedback.testlist=20
> b/tests/intel-ci/i915.fast-feedback.testlist
> index 2799bbaa5..69e45a597 100644
> --- a/tests/intel-ci/i915.fast-feedback.testlist
> +++ b/tests/intel-ci/i915.fast-feedback.testlist
> @@ -166,6 +166,12 @@ igt@gem_lmem_swapping@random-engines
>  igt@gem_lmem_swapping@verify-random
>  igt@i915_pm_rpm@module-reload
> =20
> +igt@i915_pm_rps@basic-api
> +igt@i915_pm_rps@min-max-config-idle
> +igt@i915_pm_rps@min-max-config-loaded
> +igt@i915_pm_rps@waitboost
> +igt@i915_pm_rps@reset
> +
>  # Kernel selftests
>  igt@i915_selftest@live
>  igt@dmabuf@all-tests
> --
> 2.34.1
>=20
