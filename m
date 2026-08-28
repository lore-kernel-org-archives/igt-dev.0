Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65967C61DB9
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 04:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF44A10E2D9;
	Fri, 28 Aug 2026 04:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URy7TVYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA45110E2D9
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 04:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787889793; x=1819425793;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=JNsifqjZJFRMGfcD/oVsGE4+WVSJYv2lb9Qo0lpIGDs=;
 b=URy7TVYY5lU2+6mAF9Qj902LSVTo8O2WQ4dZv56ehO6tLOboHUafI7/x
 0VXdmFsf8cGyqsOIrU6fH3EtaMTx6nbMsiAyrFJSOxn1cmBt9Fy8ezygg
 OoEWEBz9014qfqhEiVsFL1VMGKHuUl/bXuu/+5GDZo6gIMpH+ASRmwKnB
 Qw3wLsjHHDVXW0XLa1smsBgSOqsEpeWl5M8zQTKc1nsAXcUxES8nPLcZ4
 ZQWhS/rDpLQm64QqUbqOxz/KF7wBf74cQn1dB6foQUcWTkqhqgdExpi4H
 7HEZI0CPZ/S3AMdoQ4hr2U4UcMPhyaM4oBwMsEYGJw17DwEOqWZr/1Gg3 w==;
X-CSE-ConnectionGUID: kdG/6DH2Qies8X1iQ7ga5Q==
X-CSE-MsgGUID: Pdope555Sqem1G5I74N9Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105918727"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
 d="scan'208,217";a="105918727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 21:03:12 -0700
X-CSE-ConnectionGUID: miuP9kaHRqq6UNP0qxgGsw==
X-CSE-MsgGUID: Oj3rVaIwTHmUx5PqeMWusA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
 d="scan'208,217";a="270013826"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 21:03:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 21:03:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 21:03:11 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 21:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHBlGr93EvdNCeayL7kp2MOHWUxzU5Nvqi/Cp5XDFJPIe1hHJ0t53G+nKzsKzahSY7p0OdyORapvbGzraly9Oz8r8+d5hfLD0z5DnOU0Jq2tDbdyiNhN8aEOBnub0mYeU8BowBIjixBDEnVJXuoKg3gf/x30wT1NfbNjqsTjZIElkXZlIxKNmvqp/1Fj390K5P1lhXcAALy6TkWI+kfZZn9ocH8Tq9DmPsVANYmivzwgK5Q8JC/urZ0mxhGK0FwzHywIti3bo8MMqwchDse8iiIgWooy1y64fyoHahRi5ucLSfDUiF5Hhm2r4mZY/DpQBOOvhqAWb631Tr7Z/IE8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkMCFG7dxJklQAYoMSH2P3ZCmZjgcgUOxG2WB9H4krc=;
 b=Bnk/h9blw92OPMIqP2dWfELD9ay/nJGm5lJGWJ4d7ETXZ/xoyQCzXXyax+r434gCv2RmmfIYGSZ05fM5yHWZCQd5Pif2z/ucWJhB6gHynEfHcbCd8qJd91YLT9sVZTXQyeTv07X2jPFEoq5u1WeLgazSYmBU3OMN2I2QFWNIhQvXeSIZG42+DMEu4KIFvTVFfYsKoW3f8bDAwz0htO5fmCkfPX9H8rUvKsm0W+yq/ayfPW1BZYXoI62Ug5RYFK+TYUac/xwIAaEE4+16ihjP5ZhG5w+YTN4sAp+6HxDPv080hRUG8A1+fn07EUWEllAXVsU1CqyN7iO/r02PfD5zMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 28 Aug 2026 04:03:09 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 04:03:09 +0000
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>, 
 "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH v3 00/10] Xe3P GPU Error Injection Test Suite with DRM RAS
 Netlink Support
Thread-Topic: [PATCH v3 00/10] Xe3P GPU Error Injection Test Suite with DRM
 RAS Netlink Support
Thread-Index: AQHdM+d/ZRY4NGBzCESuL8D6z6J0f7ayW9UAgACABkk=
Date: Fri, 28 Aug 2026 04:03:09 +0000
Message-ID: <DS0PR11MB7651CCB3774D83F7AE02AF47D8AC2@DS0PR11MB7651.namprd11.prod.outlook.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <apCclpWH9W_qgN-6@intel.com>
In-Reply-To: <apCclpWH9W_qgN-6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: harish.chegondi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7651:EE_|DM6PR11MB4692:EE_
x-ms-office365-filtering-correlation-id: 53dd3a35-1aed-4725-2fe6-08df04b945d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10070799003|56012099006|10067099003|6133799003|8096899003|22082099003|18002099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: poYjNkYV7AcHHC/KFPsSlokNTTEP+ImkjEx4wLhzy8bt2lHSMzqVA9Y3M0LaiVGwmK+iZYA9jiz8rSzZYY+YEs+Y5TTDhlsY2nmwL1p5OBcZh7tdFeFNr0VI1UsttXQvAxhJaos2klNpLU/FVA6Zwwb1LrleXwAkHhAwFJfxL2KzYzAKk5idSKBVrRrJYpqPTLexrwCgaLC8KSBeJXHZdoFbozGnHRaQkdbrC3PnyiCB/48HCrRE/x9Ii9Qk5dy2FQPA07cYXLVdyShVwfJIwQwJJPoOyigxdGrYn/H69aVdUBXlPudE7esUghoNSvycjUtup4QRkDKJFDaW3QATqqJ/N7QVKwFZvtkupgRjIPEqCl2XrD+oaahBQI7rdDIuq2vtNQzApXZ73aP/kMXWrfTHUbRqNZ2h54Vchu2D2Bty1vcu2ZoRXbCG8aQ7lQY8/O3Iz7CuPI1vfbegjU1LCQjU/ZmnwQ0kNPUlpnkzU6g6DFThmzfJZlXqpb+Ouc7Vd9B9DZn7OxI4HVuz4qgywJtBAvTFIJEbI3olspC7CXWVSE0GsXd3Mkgbe2HlY98xXpgclWRLlwS5hCza4qHn/JvxMEwlml8/9wa8on20fehCQLMsa9aZ/1Bew3qHTeWCiR7hdNKMFWCaivbdtyC4wro5owax2xDcb3ccQrWes2ZIA0w6qMsrnlBpeLq2SK4SjtLeRg7HNEM5C/wPSH/LsW+cHuhmY+wh9r5/Hzt87XA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10070799003)(56012099006)(10067099003)(6133799003)(8096899003)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7vEeFA984ZZaPU4FSoGfg4tQsRQQ/Dag20Ll3BifX8cgf0M9fm0qSGhqzK?=
 =?iso-8859-1?Q?5VGIjmnM9gBs754Js7zQkj/sFny1skidRr9lpwwkJwnhpAlSHyXPpPZny1?=
 =?iso-8859-1?Q?SI2V1/xjK/OqCVuzyIHiuRQJ88dLiTzUw/gpUIMPbCAYFZNf36azaUc3sd?=
 =?iso-8859-1?Q?mpUA13NJRjmeBQ46FHqmU9Qy4j+Xrn9/eH6Vz8FdWD8rF4sw8TGnkrup47?=
 =?iso-8859-1?Q?P8SZuXGXVwSMZbwi7nP3YS30WeaGDyEQ45hcj7o0u8UKx3MJkKj6iCq6fd?=
 =?iso-8859-1?Q?rccIs1L7a+T8DAkrRouL8sW3WK4TMdD3Wg64cnRT6X1ySEQX1qwJL7szWo?=
 =?iso-8859-1?Q?aTj9Lh/yGs1VLnRC12dbYsZpKDBcfxJg5nWiv/eK23LiIjh+SqbR/cZD0F?=
 =?iso-8859-1?Q?TUokWXw4/IdFm6Y59DQjXOWyioKo5fQi+swT+Y7ftaLppBDS16BHraHh2C?=
 =?iso-8859-1?Q?Q7QeMwOB6KFXrwNNbKYw+rSoArDfLVXbx9yCdPyLcnTJsatkKJmWEPTTSy?=
 =?iso-8859-1?Q?Q7EzYRK02GJOUxWdAlsJ9SzHb7tr97MOZQBLPnzBaTzebMFMnitWa0hwkG?=
 =?iso-8859-1?Q?trl4YJe0Uii5/BFQdZw+xnDOJoob3Phat/qKmcDFZ590XyW5ZjQuYv3bj+?=
 =?iso-8859-1?Q?5Dddb+jmSsCr4F4p5RuHfSpt17J+Tgm4WRazeonMOJKzzAht4+43SjqDRK?=
 =?iso-8859-1?Q?c6mrmiHpwQqhBdWPFTnWTAG2NJONNHA/742BssuRby1jncjc6gVrfvirQQ?=
 =?iso-8859-1?Q?bWBj+nx+jXw/CL0mEaxiqyWg0JsBholFD18DVoP1fDvQuIay5KkJmmReF8?=
 =?iso-8859-1?Q?oiTuNcSumlRgsJYGtrBg8t1pdz9eJWK+zDny6gi+5qp2Y5EF7qL0jWF03B?=
 =?iso-8859-1?Q?pkJIg+UqRK5ZsKj1bnru2loh8oniTWNZ7pe25e8beDUQKQSb8oU16pkSGK?=
 =?iso-8859-1?Q?I7SUCZD02bRU+uoBhXgZXu9sbhvlMvpLU+hYjSuED5TXnnIRIxpWWnE1b2?=
 =?iso-8859-1?Q?Tvg0WwztG+TDxxR7DwImEfaweTwd6PeetHpzRPYris6zU3dGDXyFuJibHV?=
 =?iso-8859-1?Q?R3srcPpImZN+XeQNPKTDLmq1Pfga/2EmzrQhR8tvztK7dnj6pT+gqvCpri?=
 =?iso-8859-1?Q?PVliheguMxQHrSPqXKPld5ZmCZ2X8mdIhsJ/5HPsKeiMpoJq6+9fENrvHK?=
 =?iso-8859-1?Q?BLr/wjwiI5cnQ51bRpo/OFSKYiUkMG6RVfAWXRwXQqxMrgmIy3eQVc7pAV?=
 =?iso-8859-1?Q?20+yLSqgirOaXffNE6NsR9HPKCFuDHU5TSrd5+ovN7iGOmdWN6mu8wzmv6?=
 =?iso-8859-1?Q?pn6rNbXjoDBKaP/ifJupZtoW+uTzcoycAZVXN5xOTrLtFuQcbhHSBPOVAT?=
 =?iso-8859-1?Q?IH6ultDkDWAh3TD7ehcDJ3kTBVRbmcygUszc3SR5mFm3Y8Vlf+yWCgD8oN?=
 =?iso-8859-1?Q?0kcI6nviLCXqi6IVY0qjQkEff5uXaxVS4GWctqFPvjf8lV4hEea8wyBOMa?=
 =?iso-8859-1?Q?nFucTSxjEhdx6NrHTI7K8dxdO/p+n1Vu9z0KRdJOZS9kTIT6beXjLhtaoj?=
 =?iso-8859-1?Q?xQpKtHAeBT9qOx9F8NQ9o0Kh5xIXzA+M+llWrIY/sjTHJAaqPcXC4ocluw?=
 =?iso-8859-1?Q?UkTAEeG7oNKUNkCMXJNbLrPyhxtiCD9UnfgEBf9xGplo73yBqciGLtCFSW?=
 =?iso-8859-1?Q?1DzDCzd712BVKDWfSoYbPg1QAjkUKgs92bfVIQ8cZtXoKk/IEX/7TRb+ty?=
 =?iso-8859-1?Q?cC1C7fFu6T2XoI5sRux/dylikbh5GXg7mXDZvUuVmwL1Hp3L/ydehm18S7?=
 =?iso-8859-1?Q?FieUWVJGBYIARk8VqTPy+IpYgSoBbmQI4xHtfaoyuTNDP04/ExFGrWZUjc?=
 =?iso-8859-1?Q?M/?=
x-ms-exchange-antispam-messagedata-1: TArbKjVyxboMNa1K+0OTFtrS9drIJ3Vs8SE=
Content-Type: multipart/alternative;
 boundary="_000_DS0PR11MB7651CCB3774D83F7AE02AF47D8AC2DS0PR11MB7651namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: poulyKIvbxeb4mhK4+X8OKOMUIyn8fLOF1zdyZ0oBH/HZwGAmLQwhOhytpK/MY7Lf4usnLihWzpK903PgjazJRAYKtEorONjPFq1QVJ3H1yO1geatrUtfZ9cDdR+DMdz9qSAXRcSPnQkU8LH+JR1piJ5s5KAtKZ7+0lWBTc3tGmJ3acKvlrbMtV/ngJQQqheVG6P+24jNCzV1wqKHAD+x4Rbnn2xqpSI8zDSYd2lAjUvRhybbPfZy+QTAZW/06SBU8qhTb25kLMtve++KBluqEJCV6Rm4SNL7pWpR0RkA1haXhGCNIJKoUbV36mucPU3JN9/24BvlFhm1nw5xD8YBg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dd3a35-1aed-4725-2fe6-08df04b945d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 04:03:09.4699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CtEyTxw19Y0T5Ss9H8J3I26hfsR3D/HVJ6KkkUNk4WxtSGqn51k4SOK/tIfRCwp0kibOw/gHnGEmyUwNLIm6B8qiNU6eYBZAWJu7pawOeA12lHXtZsHfO/PZ4Jb3/9dF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
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

--_000_DS0PR11MB7651CCB3774D83F7AE02AF47D8AC2DS0PR11MB7651namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi @Chegondi, Harish<mailto:harish.chegondi@intel.com>,

With respect to the comments from Kamil, I have updated the test names, lib=
rary function names and also separated out the DRM UAPI header file as a co=
mmit.

No functional changes are there in V3 other than these things.

Thanks,
Ravi Kishore K.

________________________________
From: Chegondi, Harish <harish.chegondi@intel.com>
Sent: Friday, August 28, 2026 1:52 AM
To: Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Tauro, R=
iana <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>; K=
oujalagi, Mallesh <mallesh.koujalagi@intel.com>; Jadav, Raag <raag.jadav@in=
tel.com>; Purkait, Soham <soham.purkait@intel.com>
Subject: Re: [PATCH v3 00/10] Xe3P GPU Error Injection Test Suite with DRM =
RAS Netlink Support

On Mon, Aug 24, 2026 at 10:11:23PM +0530, Ravi Kishore Koppuravuri wrote:
Hi Ravi,

Are there any new changes in V3 or just a rebase?

Thanks
Harish.

> This series introduces comprehensive error injection testing capabilities
> for Intel Xe3P GPUs, leveraging the DRM RAS (Reliability, Availability,
> Serviceability) Generic Netlink interface for error reporting and event
> notification.
>
> The patch series focuses on the below key areas:
>
> 1. DRM RAS Netlink Library
> Establishes the foundation by introducing a reusable DRM RAS netlink libr=
ary that
> provides kernel interface abstraction for error management:
>
> - DRM RAS Generic Netlink interface initialization and socket management
> - Error counter querying for per-node error tracking
> - Error threshold configuration (get/set operations)
> - Event notification subscription via multicast groups
>
> 2. Uncorrectable Error Verification
> Implements GT Uncorrectable Unicast Walker Command Parity Error Injection=
:
>
> - MMIO-based error injection mechanism
> - AER (Advanced Error Reporting) recovery verification
> - Validates Xe driver error handling and recovery flows
> - Includes workload execution post-recovery for robustness testing
>
> 3. Correctable Error Verification
> Adds support for L2 Bank Correctable Error Injection with threshold monit=
oring:
>
> - Event notification framework for real-time error event monitoring
> - Single and multi-iteration correctable error injection tests
> - Error threshold validation (critical for detecting error saturation)
>
> IGT Test Coverage includes:
>
> - GT Uncorrectable Unicast Walker Command Parity Error
> - L2 Bank Correctable Error (single injection)
> - L2 Bank Correctable Error with threshold=3D1
> - L2 Bank Correctable Error (16x injections)
>
> Ravi Kishore Koppuravuri (10):
>   drm-uapi/drm_ras: Add DRM RAS UAPI header
>   lib/meson: Add libnl dependencies for DRM RAS support
>   lib/igt_drm_netlink: Introduce DRM RAS Netlink interface library
>   lib/igt_drm_netlink: add get_error_counter support
>   lib/igt_drm_netlink: add get_error_threshold command support
>   lib/igt_drm_netlink: add set_error_threshold command support
>   tests/intel/xe_err_injection: Add GT UC Unicast GAM Walker Command
>     Parity Error Injection
>   lib/igt_drm_netlink: add event notify subscription and event wait
>     support
>   tests/intel/xe_err_injection: Add tests for L2 bank Corr err threshold
>     scenarios
>   tests/intel/xe_err_injection: add CRI GPU requirement check
>
>  include/drm-uapi/drm_ras.h     |  67 ++++
>  lib/igt_drm_netlink.c          | 565 ++++++++++++++++++++++++++++++
>  lib/igt_drm_netlink.h          |  48 +++
>  lib/meson.build                |   9 +
>  tests/intel/xe_err_injection.c | 623 +++++++++++++++++++++++++++++++++
>  tests/intel/xe_err_injection.h |  28 ++
>  tests/meson.build              |   1 +
>  7 files changed, 1341 insertions(+)
>  create mode 100644 include/drm-uapi/drm_ras.h
>  create mode 100644 lib/igt_drm_netlink.c
>  create mode 100644 lib/igt_drm_netlink.h
>  create mode 100644 tests/intel/xe_err_injection.c
>  create mode 100644 tests/intel/xe_err_injection.h
>
> --
> 2.34.1
>

--_000_DS0PR11MB7651CCB3774D83F7AE02AF47D8AC2DS0PR11MB7651namp_
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
Hi <a href=3D"mailto:harish.chegondi@intel.com" id=3D"OWAAM390601" class=3D=
"tWKOu mention ms-bgc-nlr ms-fcl-b">
@Chegondi, Harish</a>,&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
With respect to the comments from Kamil, I have updated the test names, lib=
rary function names and also separated out the DRM UAPI header file as a co=
mmit.</div>
<div><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
No functional changes are there in V3 other than these things.</div>
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
Ravi Kishore K.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Chegondi, Harish &lt;harish.chegondi@intel.com&gt;<br>
<b>Sent:</b> Friday, August 28, 2026 1:52 AM<br>
<b>To:</b> Koppuravuri, Ravi Kishore &lt;ravi.kishore.koppuravuri@intel.com=
&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Tauro, Riana &lt;riana.tauro@intel.com&gt;; Gupta, Anshuman &lt;anshum=
an.gupta@intel.com&gt;; Koujalagi, Mallesh &lt;mallesh.koujalagi@intel.com&=
gt;; Jadav, Raag &lt;raag.jadav@intel.com&gt;; Purkait, Soham
 &lt;soham.purkait@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH v3 00/10] Xe3P GPU Error Injection Test Suite wi=
th DRM RAS Netlink Support
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Mon, Aug 24, 2026 at 10:11:23PM +0530, R=
avi Kishore Koppuravuri wrote:<br>
Hi Ravi,<br>
<br>
Are there any new changes in V3 or just a rebase?<br>
<br>
Thanks<br>
Harish.<br>
<br>
&gt; This series introduces comprehensive error injection testing capabilit=
ies<br>
&gt; for Intel Xe3P GPUs, leveraging the DRM RAS (Reliability, Availability=
,<br>
&gt; Serviceability) Generic Netlink interface for error reporting and even=
t<br>
&gt; notification.<br>
&gt;<br>
&gt; The patch series focuses on the below key areas:<br>
&gt;<br>
&gt; 1. DRM RAS Netlink Library<br>
&gt; Establishes the foundation by introducing a reusable DRM RAS netlink l=
ibrary that<br>
&gt; provides kernel interface abstraction for error management:<br>
&gt;<br>
&gt; - DRM RAS Generic Netlink interface initialization and socket manageme=
nt<br>
&gt; - Error counter querying for per-node error tracking<br>
&gt; - Error threshold configuration (get/set operations)<br>
&gt; - Event notification subscription via multicast groups<br>
&gt;<br>
&gt; 2. Uncorrectable Error Verification<br>
&gt; Implements GT Uncorrectable Unicast Walker Command Parity Error Inject=
ion:<br>
&gt;<br>
&gt; - MMIO-based error injection mechanism<br>
&gt; - AER (Advanced Error Reporting) recovery verification<br>
&gt; - Validates Xe driver error handling and recovery flows<br>
&gt; - Includes workload execution post-recovery for robustness testing<br>
&gt;<br>
&gt; 3. Correctable Error Verification<br>
&gt; Adds support for L2 Bank Correctable Error Injection with threshold mo=
nitoring:<br>
&gt;<br>
&gt; - Event notification framework for real-time error event monitoring<br=
>
&gt; - Single and multi-iteration correctable error injection tests<br>
&gt; - Error threshold validation (critical for detecting error saturation)=
<br>
&gt;<br>
&gt; IGT Test Coverage includes:<br>
&gt;<br>
&gt; - GT Uncorrectable Unicast Walker Command Parity Error<br>
&gt; - L2 Bank Correctable Error (single injection)<br>
&gt; - L2 Bank Correctable Error with threshold=3D1<br>
&gt; - L2 Bank Correctable Error (16x injections)<br>
&gt;<br>
&gt; Ravi Kishore Koppuravuri (10):<br>
&gt;&nbsp;&nbsp; drm-uapi/drm_ras: Add DRM RAS UAPI header<br>
&gt;&nbsp;&nbsp; lib/meson: Add libnl dependencies for DRM RAS support<br>
&gt;&nbsp;&nbsp; lib/igt_drm_netlink: Introduce DRM RAS Netlink interface l=
ibrary<br>
&gt;&nbsp;&nbsp; lib/igt_drm_netlink: add get_error_counter support<br>
&gt;&nbsp;&nbsp; lib/igt_drm_netlink: add get_error_threshold command suppo=
rt<br>
&gt;&nbsp;&nbsp; lib/igt_drm_netlink: add set_error_threshold command suppo=
rt<br>
&gt;&nbsp;&nbsp; tests/intel/xe_err_injection: Add GT UC Unicast GAM Walker=
 Command<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Parity Error Injection<br>
&gt;&nbsp;&nbsp; lib/igt_drm_netlink: add event notify subscription and eve=
nt wait<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; support<br>
&gt;&nbsp;&nbsp; tests/intel/xe_err_injection: Add tests for L2 bank Corr e=
rr threshold<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; scenarios<br>
&gt;&nbsp;&nbsp; tests/intel/xe_err_injection: add CRI GPU requirement chec=
k<br>
&gt;<br>
&gt;&nbsp; include/drm-uapi/drm_ras.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 67 ++=
++<br>
&gt;&nbsp; lib/igt_drm_netlink.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 565 ++++++++++++++++++++++++++++++<br>
&gt;&nbsp; lib/igt_drm_netlink.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 48 +++<br>
&gt;&nbsp; lib/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 9 +<br>
&gt;&nbsp; tests/intel/xe_err_injection.c | 623 +++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; tests/intel/xe_err_injection.h |&nbsp; 28 ++<br>
&gt;&nbsp; tests/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 7 files changed, 1341 insertions(+)<br>
&gt;&nbsp; create mode 100644 include/drm-uapi/drm_ras.h<br>
&gt;&nbsp; create mode 100644 lib/igt_drm_netlink.c<br>
&gt;&nbsp; create mode 100644 lib/igt_drm_netlink.h<br>
&gt;&nbsp; create mode 100644 tests/intel/xe_err_injection.c<br>
&gt;&nbsp; create mode 100644 tests/intel/xe_err_injection.h<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
</div>
</body>
</html>

--_000_DS0PR11MB7651CCB3774D83F7AE02AF47D8AC2DS0PR11MB7651namp_--
