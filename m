Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88E4C88E41
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 04:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E79F10E2EE;
	Fri, 11 Sep 2026 04:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2vi+l76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FD110E2EE
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 04:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789100345; x=1820636345;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=LW3U3SMn21i1mUsln6WvZC4J7mrhzcAJmJB6RR1HcQw=;
 b=f2vi+l76GD92MU316hPibcMPMQZ99Pch8ITfRfjo/ecXwRS6t0atZgdf
 yz2aXi6CyUTgSoP85T2jcREK9eLMYtHWqcOMyLvlCgRHZcb00njNiaMWW
 PKvxPn/gSbDQ/sibfxX8qv3zhma1xz1G7uwGxn8Vgl2A8QH0CphMTq/qF
 Img/UPp2bbUOjeS7ybCN9lFVlacy4euE1RlwLZ+rVotS++Hw8V9cdf+j0
 8FjyWC1AZynrsHF/IP0FY2Lue2YLnkiUjaenakaAEMA2bru8Myew/NC7c
 748TLu8muctBraEgem3nxOcGopUutAbBrNuk95e3bIHKtQvypeTt4bXnc Q==;
X-CSE-ConnectionGUID: +OnlBtr/Q4WuhglvHY0Gtw==
X-CSE-MsgGUID: l56PDcEQRsu4cNhoLjCsUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89689197"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208,217";a="89689197"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:19:05 -0700
X-CSE-ConnectionGUID: AzEvEs3GRlmuXjuPCllB5w==
X-CSE-MsgGUID: FqsjcroTR16+dXfNLZeLbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208,217";a="130189"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:19:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 21:19:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 21:19:04 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 21:19:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h24++Z5wXnBCC100YSkr1Na5PqEiTB5pK5aPF/iK2lF3rZ0eBV4kYguM0bg4grV5VRnMQ7C3IIUF0e7wcxktD0UI9B0XqwMymGBVFa8gvppV9ZsL2r0Add8BW61dBGPX/b0xXTWNzUzLZyVO61Of5m2LNcsaRsYpxfeM0lQAOCBG0VGV4lJoY/HKiKo+NGvpCl+FIzdmzW4HEMr56ZHDZtE+NdZEilrFh6A3pdje6Bnmh7MfYABb/VljFP/FEdGJjajJeu/Ss1VJzBo+4DtDuNlv5AaaziM7iIOIu2DdeMaCeOLcI1oibAy7RsXctkP65IukaZgNNj7EHqYfKHm68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LW3U3SMn21i1mUsln6WvZC4J7mrhzcAJmJB6RR1HcQw=;
 b=xbGCrpZEOTVkV5yVQzXRkoCrxWTt/4F54O4u7OBrI20d6+aK8HwTGG8ZnrDzrZFUSW8sEQB21Oy1oNO6U8JgHYjkXNICY6YmQBC69zDsuIO3J18ktM/achIJAva6Gj7wa1bowwDZp7fpTFR+KbMLvIt6PGnrH0jejG4A1DRFtXPnocS1BcDIKuYZdKkYpF1lgmjK6tUDypAOV+ajAbtwfk4UQIVVAilP8QeyMxZhm+VF24ax7KDYwOqZw3iPf0r3jKmfcyuQRD87rCS/76MDM8lhzw0c5mIwG5f9eDwaVdtZhQAjSzSPrwG2WkUmlf0tJZEfb8BP3Xe7SYapzSTKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 04:19:01 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 04:19:01 +0000
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Purkait, 
 Soham" <soham.purkait@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, 
 "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Chegondi, Harish"
 <harish.chegondi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: [PATCH v4 01/10] drm-uapi/drm_ras: Sync with kernel b2207d4c4e84
Thread-Topic: [PATCH v4 01/10] drm-uapi/drm_ras: Sync with kernel b2207d4c4e84
Thread-Index: AQHdO3aihsABR0PQdEedG3YwyMkOkLbHs6QAgAEdVSg=
Date: Fri, 11 Sep 2026 04:19:00 +0000
Message-ID: <DS0PR11MB7651D4B1EDAA57133116668CD8BE2@DS0PR11MB7651.namprd11.prod.outlook.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-2-ravi.kishore.koppuravuri@intel.com>
 <aqKQpKaSaDnoULTr@black.igk.intel.com>
In-Reply-To: <aqKQpKaSaDnoULTr@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7651:EE_|PH7PR11MB6499:EE_
x-ms-office365-filtering-correlation-id: e6ef0bea-c677-445a-1c5a-08df0fbbce99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|23010399003|38070700021|4143699003|11063799006|56012099006|10067099003|8096899003|22082099003|18002099003;
x-microsoft-antispam-message-info: 0p4B7HnH+vP+QQ+2YR4tmP/kc31Y/dFWjVW2QJIR4IzKYJOuNLk0n6SipHQGBvZ0cFAe2hWdk69+MEx1sOrX8klAOzvQVw1ipUA4YcTQrlE5oLi/uHOqqb38/b9NvIA0FMVsJ9T0N8vwYAdqgMa5OSVbqfBothpKyeCpF2eawbYoQQHiEVCZ+84gixP/uzjlUhamXCPdSSG1u3pWK4o+teQHyjTGBFiIiRrLCEQL+HwPmiTHpEfEn0RUpR4MAxEAVDVcuLXZRSld/r7ViL/y+s3djtNoWL7o6VVoK5InQOybbdUCPi6moszlgGqBKb8ifzpNeTmIfzruBq+iRZ2EaKddEbEMPFxwv4UenRDRPsxAUYPfT8itZIdTwzbm5G3ot43r5FLMr8pFWplX9UiTbFMOJMzpKfteUlEg0LY3saFutnERgQ40VoX5aYrSUF+VU0YCZjiFZSR6SOCdlKVB4zkTo2uK/YzYbVPRnCYJD5LSnDu4zfln4VQ7ChaQ6YbQIifPdCxPcUxGVO5y5SDZcomUxZxB5l+/ZuyjIwqreIQ7ZUU56m07YZBF1f8WC3NmwltHlMNcAORBS3r50UksYNSMqSsDXSo1G3OtH/fn5NoHUupPTrWAuNEhRAHjBEaL5jBQmWf2yNzYGQmL2p0TOBqDfHtexpfWJ3dm7C+1qq1ZGLw4/Tsl6p6H7xvcCb096kcfUAM5xj+QkoBMqjARWKlpuP21o8zA0HIhNMZMYqY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xmlboU1sjUwa3GlHnkySWqFirN2Fuj4VSrzLctnQZpbDmZ15UwZD+1v7Tq?=
 =?iso-8859-1?Q?da0r/PNkuQYWzw0dyTzx2MijInLiiBohXykhGQsP56BjuX7HwQG/Mv6xd5?=
 =?iso-8859-1?Q?y5ZySImlivd9sgSqVxS4ZuV78QyJVitOlJxVi6rSPMKdn+/W4+HciQq9cs?=
 =?iso-8859-1?Q?PHUbVEK0MXj37PpHHxKY1+XitUeHjj63GH9sl+aFlt/bHHnefRB3yAf4hi?=
 =?iso-8859-1?Q?HKt2XoiRT+UZ57vn9SWhxBldUAImtWNyvxYgZmBBsXtAiy/NHbFwAzTXTc?=
 =?iso-8859-1?Q?2dIzvgqoBsQIpxwNyODiQXzORETw6t3bQdAmnNSjzjkHXOWdDqkm/IV+zM?=
 =?iso-8859-1?Q?9+6hdz04uLEbAHPecM5e/ovZW3WzH74/OuAsfwK7X0gHgSMXfuGGpcBuaC?=
 =?iso-8859-1?Q?SBotO/qlqPxIEubyEd9h4jCAVjERjL7f811rD4mJy7ppIB0TSyN9URh5bB?=
 =?iso-8859-1?Q?OrjKITrZmfl3m992rhrYlySBn4lkm55qyn0RSETEeKvZFWYp771/4Wv8fP?=
 =?iso-8859-1?Q?9wbu116SAsoqdOX7o+dVK/BY2pRNqoiRVtox+gNDJmchpgdmjTASHIxTpX?=
 =?iso-8859-1?Q?tAc4KGQrUO8Oa9TjnDHFSOKDFCSVpoYNzsuZVHKp+FUOgXhNMF+ELygsTF?=
 =?iso-8859-1?Q?/ALpNpZ1/OtrlljJGhMN5XrYbY75ZiEUETuIf4kl1gHcXukNidCrAu5Kwd?=
 =?iso-8859-1?Q?Wg8rnfvJQ7zcughVhfX6Rph6XwBkzEpLrjpoCRL+zaD9ydwS2AtU6zwmUN?=
 =?iso-8859-1?Q?O00jwikiM8WJ84IuMSFvBOKeqQFqG2s9/XNUGB6wE4Zu3AYmk12q1REyUE?=
 =?iso-8859-1?Q?XeFrFtxefKmgeLOeLlUtavQFA1eWm9wk3F9/oqPQfiWkiBgR7QCGnIPHHR?=
 =?iso-8859-1?Q?vSUOpBx15qPPb5TzP9WZDd+2l/85KQ5qnnMaMzfhK2zOEPjMg64UnGys7c?=
 =?iso-8859-1?Q?AfwRqKXYbRF8rrJvFo4sGwnSKsN+7SOpHP8VfMoe6+v44WPjIjQi+PROaP?=
 =?iso-8859-1?Q?5YSXt42ixCKJk5y7sUbchZOq/c9k4IT51I2pkdZYrcjdzZwRNiG1hKNam+?=
 =?iso-8859-1?Q?1/e9zwZUxn7UE6C4srPbgI7bNAvbGs1XytNGvLP/txUSRlX0ixQrW06D8O?=
 =?iso-8859-1?Q?kvP68TWrLDF4qLj0i0xDY6C62FOj5oPbT/cG2xcN7EbEGu4mvXP6T5lNdN?=
 =?iso-8859-1?Q?lvD/kQ2oP1UvevQziTzUlLgBbTH0RmYNvu8rrvJ/8U41UDp3uKyzwb0xDl?=
 =?iso-8859-1?Q?rJBGF9xwDvnSbeyUHBw3nZC4wMok5WFF3539EB52QqMf8zXfZOdzEiZJw/?=
 =?iso-8859-1?Q?iaebc+P1RU/4o28RrAeIG8VA/3vBSowhq/atp2izqdX6uwrcmABdwP0DDW?=
 =?iso-8859-1?Q?rKQ77zXJLTRt/H8AQpAPcIHVTSRzTJWKkpJrERpR8axG+YhItLJNYm9pRq?=
 =?iso-8859-1?Q?/WMwNC54whEgR9GaeQ8Y/J04D66eySX8cNoz4oDdzEVMeJXs6+9jLCfKwm?=
 =?iso-8859-1?Q?SMOE7lqjV53IL8IRfONKpxMz7TCYcRcCAyJ3W6oGg23XcsnGbKuHQ4U9sa?=
 =?iso-8859-1?Q?TBacDf+s3jLmOIjpkjUSo+lc5Z1z3N11d8On/DFtbT8kXTXDrgSiUxUkn5?=
 =?iso-8859-1?Q?zWfwlyD8LuYgwKVF0Zc4faQdAq1LtFjND4mdcFSKbdtzcEGWBQV8Pq3vGC?=
 =?iso-8859-1?Q?MueDXEMlR//JnX0P3SA5CE2YTlvpKFfVcq1uebS8hds9+ughnOwihip3Ps?=
 =?iso-8859-1?Q?I55zdb40D5REaFT+OyotrvP0pn2bC/tVedanN0qVwLU1H7TZ4x04yRBMmt?=
 =?iso-8859-1?Q?SIrfHHQ8Y/yaV3menxNq/I4w/cELkzR3D1HMZrEI5O+4AJ4TZdMl1HdqsA?=
 =?iso-8859-1?Q?Q4?=
x-ms-exchange-antispam-messagedata-1: 8gx8tgFJp4+j4+N1eCBgzGnKzxndYPZeyf8=
Content-Type: multipart/alternative;
 boundary="_000_DS0PR11MB7651D4B1EDAA57133116668CD8BE2DS0PR11MB7651namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0FtoKtGoR8OHb1fCoWkegGEJalZOFOr8HYRr1o5XxdVzTEMZw+Mpyg5n7yoYsK5k5UUZuLzQcYqqIQnKCMZAFNa3akxnOGjlTTzeFVuPw9e8BUigyDQjjTohcVca8x7WABGdKG93JfnbpH0KVqtmyrncEQl6Qrw6nem73ScawzSoFrVQ4uXxqAgPp44eNhv8TOSVapyfUHbxMRYh0mgMgkBy/Sj4OWvDs78yMJfCn/gJSkIXIQ5CDxWHqDwryuZBc5HpDVBGTs1UR/jtae8TSVejUokn3hVdnxHPzVpoapMpjb7tNptkLqsqpXc+dX2mtR6k0G65ZezWjluWsLZNEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ef0bea-c677-445a-1c5a-08df0fbbce99
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 04:19:00.9260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AlcC2oavz4+lPlOlQwcv+MPgIVdL71OcnSPY1LJjVmd+IqzvFDYwRU+5nO12ig3dCAvieVUXer3XQIEOlSlc37ise+FSSBmIq7jM0xmelP1+2kbWzVVihKPkXeKtfluM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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

--_000_DS0PR11MB7651D4B1EDAA57133116668CD8BE2DS0PR11MB7651namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Raag,

I have added all the commits which have touched the uapi file using git log=
 and cited all those commits as shown below


Sync Xe drm uapi up to commit b2207d4c4e84, this will bring following
changes:

b2207d4c4e84 ("drm/ras: Introduce error threshold")
6fdbfc75eaa1 ("drm/drm_ras: Add drm_ras netlink error event")
ee18d39a0877 ("drm/drm_ras: Add clear-error-counter netlink command to
drm_ras")
c36218dc49f5 ("drm/ras: Introduce the DRM RAS infrastructure over
generic netlink")

This is as per the comments shared by the other reviewers.

Thanks,
Ravi Kishore K

________________________________
From: Jadav, Raag <raag.jadav@intel.com>
Sent: Thursday, September 10, 2026 4:42 PM
To: Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Purkait,=
 Soham <soham.purkait@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gup=
ta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@inte=
l.com>; Koujalagi, Mallesh <mallesh.koujalagi@intel.com>; Chegondi, Harish =
<harish.chegondi@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel.c=
om>; Nikula, Jani <jani.nikula@intel.com>
Subject: Re: [PATCH v4 01/10] drm-uapi/drm_ras: Sync with kernel b2207d4c4e=
84

On Thu, Sep 03, 2026 at 01:03:26PM +0530, Ravi Kishore Koppuravuri wrote:
> Sync Xe drm uapi up to commit b2207d4c4e84, this will bring following
> changes:

...

> Cc: Jadav Raag <raag.jadav@intel.com>

Is this me?
Shouldn't it be the other way around? ;)
(including all patches where it's used)

Raag

--_000_DS0PR11MB7651D4B1EDAA57133116668CD8BE2DS0PR11MB7651namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Raag,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have added all the commits which have touched the uapi file using git log=
 and cited all those commits as shown below</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<pre class=3D"elementToProof" style=3D"margin: 0px 0px 10px; padding: 9.5px=
; border-radius: 0px; display: block;"><div class=3D"elementToProof" style=
=3D"text-align: left; text-indent: 0px; line-height: 14.3px; font-family: A=
ptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-ser=
if; font-size: 11pt; color: rgb(0, 0, 0);">Sync Xe drm uapi up to commit b2=
207d4c4e84, this will bring following=0A=
changes:=0A=
=0A=
b2207d4c4e84 (&quot;drm/ras: Introduce error threshold&quot;)=0A=
6fdbfc75eaa1 (&quot;drm/drm_ras: Add drm_ras netlink error event&quot;)=0A=
ee18d39a0877 (&quot;drm/drm_ras: Add clear-error-counter netlink command to=
=0A=
drm_ras&quot;)=0A=
c36218dc49f5 (&quot;drm/ras: Introduce the DRM RAS infrastructure over=0A=
generic netlink&quot;)</div></pre>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
This is as per the comments shared by the other reviewers.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Ravi Kishore K</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Jadav, Raag &lt;raag.jadav@intel.com&gt;<br>
<b>Sent:</b> Thursday, September 10, 2026 4:42 PM<br>
<b>To:</b> Koppuravuri, Ravi Kishore &lt;ravi.kishore.koppuravuri@intel.com=
&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Purkait, Soham &lt;soham.purkait@intel.com&gt;; Tauro, Riana &lt;riana=
.tauro@intel.com&gt;; Gupta, Anshuman &lt;anshuman.gupta@intel.com&gt;; Nil=
awar, Badal &lt;badal.nilawar@intel.com&gt;; Koujalagi, Mallesh
 &lt;mallesh.koujalagi@intel.com&gt;; Chegondi, Harish &lt;harish.chegondi@=
intel.com&gt;; Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;; Nik=
ula, Jani &lt;jani.nikula@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH v4 01/10] drm-uapi/drm_ras: Sync with kernel b22=
07d4c4e84
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Thu, Sep 03, 2026 at 01:03:26PM +0530, R=
avi Kishore Koppuravuri wrote:<br>
&gt; Sync Xe drm uapi up to commit b2207d4c4e84, this will bring following<=
br>
&gt; changes:<br>
<br>
...<br>
<br>
&gt; Cc: Jadav Raag &lt;raag.jadav@intel.com&gt;<br>
<br>
Is this me?<br>
Shouldn't it be the other way around? ;)<br>
(including all patches where it's used)<br>
<br>
Raag<br>
</div>
</body>
</html>

--_000_DS0PR11MB7651D4B1EDAA57133116668CD8BE2DS0PR11MB7651namp_--
