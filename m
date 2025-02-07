Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EBCC02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 07:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C494710EA34;
	Fri,  7 Feb 2025 07:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ei0tH9iO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3950910EA34
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738912527; x=1770448527;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZfaBoR2sQ5m/TBhHLbi9CkGpa3Jbc6Uz+enW1Mp9xfk=;
 b=Ei0tH9iOqWhE7Ig2OZarsPh6fuyCNRMOcGqTvl4BOgo9IyabZKLzpd7f
 D9J8XF9jvudR204+MU96g0XLF3ZG0tnazN86O9v1WX1nDpeBE68GrJWNP
 +jn1eHcybVKPMpOyvD3d0RrM4wCn5q8VE8PcmJySmrZWEtW+Ehz+vtM0k
 chAPNaNT7vGgbhKm91DKPWCn1r/Y+l9gWZQYJ4MBLAf0nFcrivpJUYq/b
 H0Y12EcXp5Jg/G+n/p2vnvNOYmKT5AqgmpgR/A7ZC37wZYZ1BOcjpEeuw
 2yMJzZyi2E/5+NAMJZjcnMRIOsMUSe6zXfXAKWr1jmj4W9EJ2519AD9GH w==;
X-CSE-ConnectionGUID: dU54MuSQTSafTtfb1SaDew==
X-CSE-MsgGUID: dWPlC24bQzCVimBgafnl1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43469208"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="43469208"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 23:15:27 -0800
X-CSE-ConnectionGUID: Aq2NA44RQvuoNO8Rr3zdEw==
X-CSE-MsgGUID: C2UqgdHUSWSmgXzX5eoxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="142329971"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 23:15:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 23:15:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 23:15:26 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 23:15:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxHKBM3hQk6UomV9F/Dez+hT+9xYVf9d/ITNhsf5LBcjzZ89wY8UDrd7xTYfhp863vzGXPdi2UDed7mUeSFP8hCcu0xfu9qmyuMthAcJZSwge517MGeRhwEO3Qc2MlSDo+X9WJmeinh7Iz6pBJQ38VCU8OC6gYf+80Rlfr5ZEaAlOSxpoh5uR3Nn2Suflqu6cnI+b098EtHKOHNZ2dD6qabX1cwKiQ0Gn77nKxBJir3Z16BpfTLeqVXFu4lKQ80pQthslutBZrz1t7m5HHfIycrEBC+OTuvYXCcK5dNCRtV5x48G1cQ+mNfsWtwtZCS0fhmrO6CTl5o3xqzGWiXvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvD93B4DgN/KtXVnW0bcgzQQ4EjhoCIh5iLBLoNQBAo=;
 b=p47aBC2aW5kEWZkZKVsGtkhOzP5jPFVn2PKV/XLGSY2mzbhhECeQesBRqPt4bPYL8TwSwGxrjXXGtLGSqKrzUSRzPnv7kCOKMD8a2BRlQTC/HoB9oEXIhvy6xYSs5EHjpSOH9CsRiD1Atqgwj37ea6iLMOu4NKajZcaxNgpkfMQCumSmdG+jriB9eRCSKlMfF+OpNkOhkKtCNtIn3MbIUJ4TDBGMF9LjiMpqwX633gQu/xBYKytzWDS4ugd1zhGCbB5ZWly3Y2Sol7zrgtl4L9yE2s4a4XQQpePDoczjkok+2rg96JX4Y1Q6UXO+oxkbSe54mesfiyU5vwEZBNRerg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM6PR11MB4593.namprd11.prod.outlook.com (2603:10b6:5:2a3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.11; Fri, 7 Feb 2025 07:15:09 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 07:15:09 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Subject: RE: [PATCH i-g-t] tests/xe_eudebug_online: Ignore stale attention
 events during single-step
Thread-Topic: [PATCH i-g-t] tests/xe_eudebug_online: Ignore stale attention
 events during single-step
Thread-Index: AQHbeJkpaz7zHjTe/0KpnV5auohWqbM7bZyQ
Date: Fri, 7 Feb 2025 07:15:09 +0000
Message-ID: <DS0PR11MB7264F67BA6D9615CB6EA3E89D9F12@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250206131455.612021-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20250206131455.612021-1-dominik.grzegorzek@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM6PR11MB4593:EE_
x-ms-office365-filtering-correlation-id: a2a2aeed-41a5-41fc-0062-08dd474727f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?KNxKz8Yda2fFFvkzSXYEThawz6Y6APOIoWf+hRSE82FMLHGppzxq+C2MTO?=
 =?iso-8859-2?Q?X4U0EiRhXV+/7OU8Ywugesr8T6ZrBwzxdp1QMISeOcKktbQmnrBgl27iEe?=
 =?iso-8859-2?Q?jX1DA8B1ooA7+NC06nrbxRtFpwg3lGxtJvEhD/uY9uTSz50LVnVd987J8S?=
 =?iso-8859-2?Q?IFIVzHDsRKHeaYEg63o9h1fIYWxQz2Stlbu0LvQz5M0RiSqlHJeHFv20fa?=
 =?iso-8859-2?Q?TkVUT2JMgCC+I1s6GdAtCc/8TQ9hAnmyDj8/PLabOpTinzvDBiM3AxEg5g?=
 =?iso-8859-2?Q?1tUh7bD8G8de0kdf1zk/IN2pFuCcleYfkMxGHTSUxHIWoDNzGrAwv2Gd7J?=
 =?iso-8859-2?Q?FKnSUAwT2bwvC5ewZASmH7dcP5iPRJSRLIsVKzj5X6BkZHCon7CF8jUwoJ?=
 =?iso-8859-2?Q?EqaiyB8HZfZau/Ziz0tkeCauF0c5EDFK73LcREiWFcdeewzE4B2f4w4d6V?=
 =?iso-8859-2?Q?blAU/Ei5w3ZJIYgl/RHc+sAEsByEJa1iDAO5yiEXI7Xt3+MfE5plpoiYKP?=
 =?iso-8859-2?Q?yKt2R/cg5pY5QMmOM3TT+eJHR+tcOriholZl79Cf0vYC0YKxqQbfzcjWOR?=
 =?iso-8859-2?Q?ATG/4cu0qbONZBF2IUvLh4YIhlTNbv7iw3FkPPVqDbUo7EpIe820XNhj+H?=
 =?iso-8859-2?Q?33FNkmVu7wfGScSGZ65oTy+ol8QaD2XU61ZfuxyvuNiWJA6aHSyzm/WjNn?=
 =?iso-8859-2?Q?J1cfWnKeNUW/tf7tluIEb7ftjxu6cCZ4ovRyrRQbSy1i/W5XsTLN2YbkyQ?=
 =?iso-8859-2?Q?dpsySuS5dL72pP+mIFj3PG/YtmI8WfQOyCWQlcG7wzX/EywfQ5luJvpNRX?=
 =?iso-8859-2?Q?0msXtuhVMwnSRdHDTMfsN0yllCTVJ2GDhzVm1xH5q988WcqOKI9SrULTwE?=
 =?iso-8859-2?Q?g73EzbXuLMloBqNdmqfuU1YXd/J7agya1m5qaIJXR9VbMyEJSdWKpPimqS?=
 =?iso-8859-2?Q?lmZZYL+XX2bDTXKk5GrPjqFGjNyILSy2zzIP37otxz/FBOhBfy1qYbLGX4?=
 =?iso-8859-2?Q?2QYzSSKstJ0yU+u9I1MIfq5vPdjgCMBUAZg06J4l+gddgly3isJIFdq5u1?=
 =?iso-8859-2?Q?txxZPZmgfpDLRalMCU3gvFveNVzwv/u3C10jKakjAfnP05TolWP/fI813O?=
 =?iso-8859-2?Q?Q6kkOWs3mQmXnSu3yJGvQzencmZdx3h9H6ywNuUb+Fh9KcrY8xCBz6SuK1?=
 =?iso-8859-2?Q?IyOSr2n2HLvpkCG+EMYaVMuREpLMkwm3MHWe/WvjM1UNmYeD6hUdPEhVox?=
 =?iso-8859-2?Q?rOs5HUG7/lQjhris1nCKeLFTcO0Wae4mfy3nZTfzSTKD+Ll6CoZ6TmGacn?=
 =?iso-8859-2?Q?KF3R++fBb6YKQ0Ob4JJB7tMig21wI9aF3no1xkinkUyCDw+h2/EEBslxDT?=
 =?iso-8859-2?Q?Omp5Oc1M/X3UcbZab0MCylv1xphHWrO0jUY1HWjrHGGGrvfSsiObDMzypg?=
 =?iso-8859-2?Q?CWPG+mV13dujH+mY3sjkkAY0RCElZZQbL5H2eBIa1FapNmJgVcjF1LnkfP?=
 =?iso-8859-2?Q?6btTqFhB94vfB2PNidqpa8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?B8eG8pN4lQTHwCkS/ZFJdvkijXtHM1bfb5LT3IzZBkXwSpl2w3EJOmqvUn?=
 =?iso-8859-2?Q?FQNTGurQFFFfQdnFvkOsuPbBY/agTNjceN3F+at8ayDKwm6aWksT90FE4J?=
 =?iso-8859-2?Q?4ZpFMDx8PaJnozceoBiOj3ydb3XvCu7/7kffMCmEnEaB1wJGmnM5Gjk0kd?=
 =?iso-8859-2?Q?22Lo/43vBvCYH07SKUT5+trAwfcxG55nnC4OEIgvVjpCNUtDzJgMOMF8vE?=
 =?iso-8859-2?Q?lRSet64O83ZyRaTJzzA0EZFBtB0nXq9iEWGEY2O6zc0IU6WBR5pwgGhwSD?=
 =?iso-8859-2?Q?3zXJxD1WoDs2lX24cH2x2ZK2yLbxKfqzkOM6gPZtgo8nmjXvN6SiyuEzYy?=
 =?iso-8859-2?Q?8q8wnRj5Rl+hA1apLzI9zbWHl+804tXmy+djiJJTH9M6IiAyI1qGPi0+B5?=
 =?iso-8859-2?Q?9grQfUdhiwDdhEX/5PBjn3Zo9u1YIV4IQkmABsvYfvaqZVoUL5Ofap/l8A?=
 =?iso-8859-2?Q?xM7/kGlQIz2bzNKrzcfKdOzuVeYMCFVI0/vqF982zN/nSS+1VKAqnW8bb7?=
 =?iso-8859-2?Q?Lwx0WCvhi/6sYSHwws+S80APDrsRL6Qo1gYtwh5ELQWwpkFuBhGjEiXSJh?=
 =?iso-8859-2?Q?JOFi02Dh3hWa2YwY5Av+sfb0NxvuXcAzmeOvK9DH+Pq3FEQLHpoSMGJ7ig?=
 =?iso-8859-2?Q?qkGUYfcvnOuXUWMTJOvuyOc0KlXtBYDBWNP+DBse5UXVxM5afb/KuLgRCM?=
 =?iso-8859-2?Q?fiDSBMGwFOK6Wm59vyu4reLJPmFn744uFCAAI2PZPXaAhMa93oI1pQdcty?=
 =?iso-8859-2?Q?yzp5uAi0rKoIDWZDdzBqTvqpdr9eewicDSJVT1Jadxo5RFaQpV7qCcgx3Z?=
 =?iso-8859-2?Q?I4akxtpFe5EBI3ErdeG50faC75f9fCrL0ZF/L/+MQPIKJ5NvA6nXK2164w?=
 =?iso-8859-2?Q?MGrCYLNqmvd5/JLwDCW96VWvWqzLpem9XrVTFZ/kPlv/iAPKxpFFlIJxml?=
 =?iso-8859-2?Q?hlHn6yFhRlHH9TkKzFcTl6i4A97nV1w/uuzuX1vmkfCSM78tLouPU2uAxD?=
 =?iso-8859-2?Q?sEP/ENd/FS5ISnSb7M8pG+z7JD4v+BKHrukkPE1+HJ0BrgMxAYpHVeuIsk?=
 =?iso-8859-2?Q?RGtbPPf8cLqw8hJIZ0V8BibuUBne2mM+a7j6PvOzegvNhcPP45YHYYu5UY?=
 =?iso-8859-2?Q?r2ajJhwXUEWvSpUyswP0+PdW1/pvB4kp76en/w/3cSpkebTv9fOz3KE/s/?=
 =?iso-8859-2?Q?+PGk6gRX87nVYZBWyp5WVUkvGiLkJHMROJ7sG48tXZ2zEr+FTZggWikYXs?=
 =?iso-8859-2?Q?P9QJV25YmxaMswlH/6BY0TnPkbwqJZ6bSad0Z+mgkmkAdr5EiYmtmS1dDx?=
 =?iso-8859-2?Q?XNrRlVQVDdObC9RnZTrsfgn2EXA62K5oIzpN+hZa8zc1zgw6vQdStBzV+C?=
 =?iso-8859-2?Q?YjdYv7hKOzDAxZg6GIJxep0OA8XCMb2RnJT5rfJlDGUDwqstgFdRQZiwPz?=
 =?iso-8859-2?Q?1VEb+pa+fgPpIV2AF87l4FW6o4dU+5wbsQ1qrnrCNvlBxKbRgx3tWQuY58?=
 =?iso-8859-2?Q?RXxpex/vzcFBzsfC+2/KLPMhgfw+azJC+YqLxCVIE3KVGS/S0k9ejYrcVB?=
 =?iso-8859-2?Q?zwvf84Gq1mAzHgz59sSeVGnFmNkoOb6jaZJfRijrF1vk0v6kWCyXda1eOM?=
 =?iso-8859-2?Q?O/Gloy603kWOgK1L6a8oV7u9DCntHzVGOqRFAMWoxALbWnm+eWW4OrBg?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a2aeed-41a5-41fc-0062-08dd474727f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 07:15:09.4955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYNvZO6PIiD2/BFWs44pzfeRvmzO8OsmtmyJ+LnZVC0aLmD22qeE8AHSMgDjCDa39M56U165WEVf3/v4deFNcdW1EVeet5xZ5x8sZoXJ4RQ3FXva4JSsc7ai8POy3/VB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4593
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

Hi Dominik,

> -----Original Message-----
> From: Grzegorzek, Dominik <dominik.grzegorzek@intel.com>
> Sent: Thursday, February 6, 2025 2:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Manszewski, Christoph <christoph.manszewski@intel.com>; Piatkowski,
> Dominik Karol <dominik.karol.piatkowski@intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>
> Subject: [PATCH i-g-t] tests/xe_eudebug_online: Ignore stale attention ev=
ents
> during single-step
>=20
> Signle step testcases are not filtering stale attention events in resume =
trigger,

Nitpick: typo signle -> single

> as a result those expect fixed number of attention events to come. If for=
 some
> reason attention wasn't handeled before the next one came test would fail=
.

Nitpick: typo handeled -> handled

> Filter out all atentions with seqno lower than last eu control call.

Nitpick: typo atentions -> attentions

With this fixed,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index ecc32ee97..c98f1ef1f 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -694,6 +694,9 @@ static void
> eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>=20
>  	get_aips_offset_table(data, threads);
>=20
> +	if (data->last_eu_control_seqno > att->base.seqno)
> +		return;
> +
>  	if (d->flags & TRIGGER_RESUME_PARALLEL_WALK) {
>  		if (data->stepped_threads_count !=3D -1)
>  			if (data->steps_done < SINGLE_STEP_COUNT) { @@ -
> 766,9 +769,9 @@ static void eu_attention_resume_single_step_trigger(struc=
t
> xe_eudebug_debugger *
>  			     data->target_offset + steering_offset(threads)), sz);
>  	fsync(data->vm_fd);
>=20
> -	eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
> -		      att->exec_queue_handle, att->lrc_handle,
> -		      att->bitmask, att->bitmask_size);
> +	data->last_eu_control_seqno =3D eu_ctl_resume(d->master_fd, d->fd,
> att->client_handle,
> +						    att->exec_queue_handle,
> att->lrc_handle,
> +						    att->bitmask, att-
> >bitmask_size);
>=20
>  	if (data->single_step_bitmask)
>  		for (int i =3D 0; i < att->bitmask_size; i++)
> --
> 2.34.1

