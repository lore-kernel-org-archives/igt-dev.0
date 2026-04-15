Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30510F9D0CE
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 02:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903D110E158;
	Wed, 15 Apr 2026 02:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gC9mPpsX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9B110E158
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 02:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776220665; x=1807756665;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=G6zVGN9jE3i4hBJhA9KkK2AGdal/f0LJiJtvI5l0+pA=;
 b=gC9mPpsXMZU0AEtUxK4dApCV0I6gLTVgRfY0ZdTD42ERbA9ICjKkRnqM
 XwmsKC8X6Bk/b00r/QbadJrsGf+FM4VdV1UrvLcwt911lE6AmtfBXDTDP
 /tSQgUCWXUujOHaMICp6ghkQRbQxZC5clxUtdED3vyxhyUEegOMZ6ip2m
 G7CxAbVutoheBw/gIoGIrEMRLqPT/aOvPCD71QmJQYYMM7PZAa57ErIXz
 PqiJQIqwHae4GP9UcRcDPASAQmxm5bwF0LtKAgFAoq68DnCLShsce3deP
 CB0fIoLC46nkWHUkWZEALl66AClqCaWb9NnBn3i2nrFlIkyk9G/SREu0s w==;
X-CSE-ConnectionGUID: 3pW52xN3RVa0dQ7HCqUtwQ==
X-CSE-MsgGUID: V3rrt1rkRLKDni5cH43x6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81055939"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208,217";a="81055939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 19:37:45 -0700
X-CSE-ConnectionGUID: uxHYDwRsRQix3MHpRyjZMg==
X-CSE-MsgGUID: 9qVfF0TsSFKC5yWkWdEc0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
 d="scan'208,217";a="235205368"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 19:37:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 19:37:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 19:37:43 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 19:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4e6xfOdMTWjrZeezbtMgQyey/e9LZLUz6tW/3rpZzDSyTXmouWM6tvejiINys3mGH8GbgRMFjYcSON9/0LWsWebErxE8D49GIDzaRH0iHGoWhDqrkcLokuTiA3bD+MGF9fSpD4A44/a0NFJIGRR5+hhsl1e3cDuJxOB+nZtlzyTfeIJFcQBfxERh7DbISR1ltW0A/rOKrh8We/AfpCSZAJNe/se4iU9rbQDf5yZSORXgmXAKOfWkkNGPBYB72hV1CJbs2yZ5lGtyuzVnlow6AoyxUk53ss43jZ4uFNkRvZ836tOdtH/VUbpfuXczUu34rfGmd79OXHf7RW61v0nRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCAwOI4U4u+CsrOkDgo55sPCHTPl7p9U9jfvLvPM7NQ=;
 b=h5XAIAiEF1fxe+3e2WtA8pBSuLK8c01yVfh2cbyGPMldJORCIn3CKdUxbWiRuVYtkTTqTILPHFvGxFVfO4C8Ok8y+sRdyx/EbsdwRlM3AtM66lVtPBjpmi1xYu19Rr4zw2hKi1uwz89gh9LXXJM6Amwa5rFYDGBzc/j/Jav+ihv3a9RZ4MKO283s74MBtt/UfKlXXYZ53LU5p8nxJ1BoRvpNmWDAI6XOmU8BLELFW/wX+Lb2m/dETNWbtBuTov/Ah7izn8XVA57FpGlaNodfqDBPPglMq9VrFLHmevQklbimbAQc14SMv7fucnBRQVKmmdHInoRAY7GErRwW/N+SwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH7PR11MB5941.namprd11.prod.outlook.com (2603:10b6:510:13d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 02:37:33 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 02:37:32 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_wedged: Add subtest to validate
 device behaviour
Thread-Topic: [PATCH i-g-t] tests/intel/xe_wedged: Add subtest to validate
 device behaviour
Thread-Index: AQHcy1McSduYgXO6oUae7OZS8TZ/lbXe1QWAgACVsxI=
Date: Wed, 15 Apr 2026 02:37:32 +0000
Message-ID: <MW4PR11MB71510001191037441A2DEDF4E4222@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20260413143717.5323-1-nishit.sharma@intel.com>
 <20260414174051.4jz7mquribwyownl@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260414174051.4jz7mquribwyownl@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|PH7PR11MB5941:EE_
x-ms-office365-filtering-correlation-id: 982bfe48-b5d5-418a-adf5-08de9a97f244
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|8096899003|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: MPdYK3ZQqzx/Spep5wrLkB42fzFdyE+3VHSAqCza0Sc48z5WIhDhzhuGZRB3qIoGExFES+6R94QNVfGvhOC5ygZBwYVlQGR1bZ0b8ucXkOTt5X1af2rcfx9+jQv2n3Sg/QKkuN13zQ3HV+6+W54wXZ8FNK+z+M2HvAX5gjRR4MCcLPjARSD0q7HRn4WhTz/6Z4ckoPDJP/mvxtgzmF21ZI8P2cizXnZ1yjlzWJHsVfgrJVJFH0B4+Z6kdP+TEGLWRVFm2VSdBvvR8tO9+ol18xiyU5WneydAq3vIVHHYD4tnMQYJPYy/ZSikogXWIH2snACR7Z6NdobSw7flhtqq1nMZRvgk3sdmTKrPLKlFP3SmGcBEYyLg//L5QgkJpebqrfXzrpidxrOd7AmP5UG3J8IJ0D7CoUyhY/P972PYuMSXOaP46xdXPXgTYZR3rtTpjKsWqiketf/rr3WwvtRolqf+KMZk8hhCCi4a3V8L6LSERh5fVp0/E/ABzInRaVlEKkyqGSxHutxGur6VPSHrz8WB63MH+/WuP+3or6YUyPDi7CpjcN08zcIQY3pZMMbT3Iy1m15L1nHXM8T9FM5lvvqScWIo6RRJjMdOPpTZchQBsfIgf2a9yDygtNQ+Iu6K/yNJBOUfTgD4OQGaaVxeIVwuxfccSktHWPOfTJ1vu/sKJv2vnpYJngP+rPRwVTvtM/GuH1pjDzxyj9sOsDA7ETUCeTnic3920elmh6uGE4uqcFeo32myUtRiU96aW05K38rmUhg9Ibo/RUbA5WStR0MNfbw3Z8lFNkxHxeoUgmo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(8096899003)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bI7CmYnCtqB3i7/aRTm4eWYeZq5IgHsCL4Yoyq8T4iZNAu6jJAzcmx/FbLPG?=
 =?us-ascii?Q?ccdZyg5DuYiQbJ73nAjAgAIWCYlGcZdMiHr+UduS+U2pGi/XBWa3vh0HwScH?=
 =?us-ascii?Q?qMUanWr4rqvUXskReFMpkeZ4XbpC1rTJ1ykLzx39y55w4vQYeY7QQhxetL6f?=
 =?us-ascii?Q?IsGm94AKEm804aDek3puAVNs+oxBcFk0cYBOG1sSOxcJmnIdrZpdSmdiMLLS?=
 =?us-ascii?Q?mO1YrFqI0wJGc84poAlNwarOTE5D4c6BR6QojFD+LOn1LXxUYBjjkrJJL4xN?=
 =?us-ascii?Q?UyITakIFKEGTS8ryK4sr9PNAp1N+y1g6XBc4chsOonq8QFLEOY2uM6OIKZ+K?=
 =?us-ascii?Q?czviZJ61cCOITg9Muv45XZxGk/drMo4Us3Of07tAGAJs06uAEHHbyOFGnXRz?=
 =?us-ascii?Q?TPHkiAcyfC08eckSOGh//dr5Udt0Rcj+6Pqrwfy92CGIhpvi8m+uyrO4Dc9i?=
 =?us-ascii?Q?95Q/1/Nyv1uSWf1UEeQ2RdKiCIMeOr/kwy4IwS+OIVAl/YJ/O9FNnZuoF5gt?=
 =?us-ascii?Q?3PpRBuTtpzvcGRSz7Ar2qIBIJxpQAXuBNtM0vO6qPEzZ4rFZ0uhu36DAs5Yu?=
 =?us-ascii?Q?crcs2GYcqmVLv14xA9PGyTnxm/kZmaXlmX9ZroIifJU114zjK4DhY5W5yXd0?=
 =?us-ascii?Q?ZzPDP239xjwA7ojmoDa0iMWzCizOtGoePvjTLuK9ewba68ctlmgO25hknN4d?=
 =?us-ascii?Q?usMBffEetAR5othJN8Y/CN63SicOFBlrwnySfvT+S/0Nfjt1i2a7fdHKkp9S?=
 =?us-ascii?Q?VvjWKYKHdq/ohjm/31GDJ3XoSOFRXl5LLJbjvYiWJ6EQ2NfDf+/jT4FJ07vj?=
 =?us-ascii?Q?GEEb/Ojspr+Udr8QbQPDtvv3Pa8uXrSTCZUSOmOUY4n1htW0D4S6mbFOsnXF?=
 =?us-ascii?Q?bh5G1tsQ/bkC7POSKT/FdB1R3+nkgJ40W5tXOuf2iLwPmGsY8wm6IDOWifpL?=
 =?us-ascii?Q?sVFyDhCOPdBYcwGG0p3M1emSqduu9rBbkDi2m+c/xWlTMadDctYRK/7omCFr?=
 =?us-ascii?Q?G3fYH0wpBvSxu0smLq/tosIbvnmVGWVeIcD8LPCwXlNNeNPu7oKy5fhSf9ly?=
 =?us-ascii?Q?DEL1LpN5IK/arQSatIxoh2Q7trXz6PElufWGB8u9aadAOJGK90FTC1tMH430?=
 =?us-ascii?Q?qwuJBCpRynKMkbCJ5cTmHhjrOK64noz/2nmi6Ef1phlXnUrBl0UqlVGtwxRW?=
 =?us-ascii?Q?Cwnqd3Pu6UVUYpm2GoMTY3ujnYf8ARMhmVbBh3yltsIk4qe8JRz/mqUYy4L5?=
 =?us-ascii?Q?KOiIeGg3grL1lH1RSj77VpgAeI+VrQ9ijN4ed3Ao0cpZvJb+H6PuZK+kX0H2?=
 =?us-ascii?Q?8YeYhqncE8KpsmZErimXfM3j6XQZ+cr8dYmJdiTrKXmEOqqdjwaHILl+hmMY?=
 =?us-ascii?Q?8A6nek01hkNDiE3AG0p4/Mwtdf0oHgXjOZquaKGguJ3hGjqs52O3XjtX/q9S?=
 =?us-ascii?Q?0Rise5Bh/JKzlqmZZidekIx7tup9juniZwQwEAgjhryhPoP7U5H7neVdDg9G?=
 =?us-ascii?Q?tJn1/M7Cqi4TkjyPcNxdF1/PJmGDeGl5s36EsfNsYjcoA6QgZ8zQ7gh6UA4g?=
 =?us-ascii?Q?y7p42LJbWg4PLgOzg1Z4Mk3kOmit4RMDqIi9TokHl113bFRBfUs/YIeotM7Z?=
 =?us-ascii?Q?zm68tLvVZ5KcHWQM8N+6WPOfugoT3v1xlWNUtbLZaRLNGYIiufKgGA5EwsKZ?=
 =?us-ascii?Q?2321dkEMJIsoG7UIXTROheexf/wNhxprv77pQ5Ew05UKPgWQ0IoKYUSfksrN?=
 =?us-ascii?Q?fyWbfXFTOi/irJF189rvPXvgm/nJT4zfBXcBubkf+Ch4gL6wsMZfNYHgwAK+?=
x-ms-exchange-antispam-messagedata-1: 3MYnqmF4IiIhGtvch1pWewhwe5hHYzLtiX8=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR11MB71510001191037441A2DEDF4E4222MW4PR11MB7151namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GbPSNLNsju/4CK/FPdGJ9daNKAysFxSCH5O9Fw6UzmnIlzV4K+bdiDCDRS+Y0JIy7wTIUoMkxRqlTetZYj+46Z4CTe2f2JTmPUR28GNAcs5A3LEDoSkYj3cQGeF6jnyqOTC+jkSEkJ6SLDhdNGzyni6Gw9dlU3WeQuXM6NDP4dPSoQND2hTKimtyUY7FfQCNFXnXsh/PBNOKYmW52Af7nsElAfS/MpvnNXd7BLesdfyS7wmjl+DvQO40rFMfKZBUnU7kbklMR94dry8dQT9v+PxKfNpnKThl67oQ7rKolKdZnqbkuLYVemPTaCOHtT/BY7hIkudeqIlkhmI9dglmRg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982bfe48-b5d5-418a-adf5-08de9a97f244
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 02:37:32.8414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dxlFeHw7GO2T7P4w+6nz5ngJND43+B2JULhB5IU7s80jx/Vt3+GF617N+RJcCVKkr6MGJYSXEKVynAIj2/kzUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5941
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

--_000_MW4PR11MB71510001191037441A2DEDF4E4222MW4PR11MB7151namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

Sure, I'll incorporate changes once Matt give inputs on patch.

Regards
Nishit

________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Tuesday, April 14, 2026 11:10:51 PM
To: Sharma, Nishit <nishit.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Brost, M=
atthew <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_wedged: Add subtest to validate d=
evice behaviour

Hi nishit.sharma,
On 2026-04-13 at 14:37:17 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
>

Please write a more descriptive subject, maybe use some
explanation from new test description?

[PATCH i-g-t] tests/intel/xe_wedged: Add subtest to validate device behavio=
ur

* Description: Submits a long-running job using a userptr buffer, force-wed=
ges the device

so maybe:

[PATCH i-g-t] tests/intel/xe_wedged: Check ECANCELED after device wedge
or
[PATCH i-g-t] tests/intel/xe_wedged: Check device wedge with userptr buffer

> This test:
> - Forces the device into "wedged-at-any-timeout" mode via debugfs.
> - Submits a hang job and waits for the hang to be detected.
> - Verifies that all subsequent ioctls return -ECANCELED,

You tested only one, so imho

- Verifies that subsequent ioctl return -ECANCELED,

or did I miss something?

>   indicating the device is wedged.
> - Reloads the driver and checks that normal operation is
>   restored on all engines.
>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_wedged.c | 94 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index e1ac629ca..fe6468cc6 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -193,6 +193,51 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>        } while (err && errno =3D=3D ENOMEM);
>  }
>
> +static void
> +submit_job(int fd, uint32_t vm, uint32_t exec_queue, void *userptr,
> +        size_t size, uint32_t syncobj)
> +{
> +     uint64_t addr =3D 0x1a0000;
> +     struct drm_xe_sync sync =3D {
> +             .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +             .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +             .handle =3D syncobj,
> +     };
> +     struct drm_xe_exec exec =3D {
> +             .num_batch_buffer =3D 1,
> +             .num_syncs =3D 1,
> +             .syncs =3D to_user_pointer(&sync),
> +     };
> +     uint32_t bo =3D 0;
> +     uint32_t *batch;
> +     size_t bo_size =3D 4096;
> +     uint64_t batch_addr =3D addr;
> +     int b =3D 0;
> +
> +     bo =3D xe_bo_create(fd, vm, bo_size,
> +                       vram_if_possible(fd, 0),
> +                       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +     batch =3D xe_bo_map(fd, bo, bo_size);
> +
> +     batch[b++] =3D MI_BATCH_BUFFER_START;
> +     batch[b++] =3D MI_PRT_BATCH_BUFFER_START;
> +     batch[b++] =3D batch_addr;
> +     batch[b++] =3D batch_addr >> 32;
> +     batch[b++] =3D MI_BATCH_BUFFER_END;
> +     igt_assert(b <=3D (bo_size / sizeof(uint32_t)));
> +
> +     xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(userptr),
> +                              addr + 0x10000, size, NULL, 0);
> +
> +     xe_vm_bind_async(fd, vm, 0, bo, 0, batch_addr, bo_size, NULL, 0);
> +
> +     exec.exec_queue_id =3D exec_queue;
> +     exec.address =3D batch_addr;
> +
> +     syncobj_reset(fd, &syncobj, 1);
> +     xe_exec(fd, &exec);
> +}
> +
>  /**
>   * SUBTEST: basic-wedged
>   * Description: Force Xe device wedged after injecting a failure in GT r=
eset
> @@ -209,6 +254,10 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>   * SUBTEST: basic-wedged-read
>   * Description: Read wedged_mode debugfs
>   */
> +/**
> + * SUBTEST: userptr-wedge-fence-signal
> + * Description: Submits a long-running job using a userptr buffer, force=
-wedges the device
> + */
>  int igt_main()
>  {
>        struct drm_xe_engine_class_instance *hwe;
> @@ -310,6 +359,51 @@ int igt_main()
>                igt_assert_f(str[0] !=3D '\0', "Failed to read wedged_mode=
 from debugfs!\n");
>        }
>
> +     igt_subtest("userptr-wedge-fence-signal") {
> +             struct drm_xe_engine_class_instance inst =3D {
> +                     .engine_class =3D DRM_XE_ENGINE_CLASS_COPY,
> +                     };
> +
> +             size_t size;
> +             void *userptr;
> +             uint32_t vm, exec_queue, syncobj;
> +             int ret;
> +
> +             size =3D 128 * 1024 * 1024;
> +             igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probabili=
ty",
> +                                            O_RDWR));
> +             igt_debugfs_write(fd, "fail_gt_reset/verbose", "1");
> +
> +             igt_assert_eq(simple_ioctl(fd), 0);
> +             ignore_wedged_in_dmesg();
> +
> +             userptr =3D mmap(NULL, size, PROT_READ | PROT_WRITE,
> +                            MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +             igt_assert(userptr !=3D MAP_FAILED);
> +
> +             vm =3D xe_vm_create(fd, 0, 0);
> +             exec_queue =3D xe_exec_queue_create(fd, vm, &inst, 0);
> +             syncobj =3D syncobj_create(fd, 0);
> +
> +             submit_job(fd, vm, exec_queue, userptr, size, syncobj);
> +
> +             force_wedged(fd);
> +             munmap(userptr, size);
> +
> +             ret =3D syncobj_wait_err(fd, &syncobj, 1, INT64_MAX, 0);
> +             if (ret)
> +                     igt_assert_eq(ret, -ECANCELED);
> +
> +             drm_close_driver(fd);
> +             igt_kmod_rebind("xe", pci_slot);
> +             system("modprobe -r xe && modprobe xe");


imho this should be done in at_exit procedure, or at least in fixture.
The reason is that if test will fail with assert, it will miss those
cleanups. Also, there are igt lib functions for this, please use them.

Regards,
Kamil

> +             fd =3D drm_open_driver(DRIVER_XE);
> +
> +             igt_assert_eq(simple_ioctl(fd), 0);
> +             xe_for_each_engine(fd, hwe)
> +                     simple_exec(fd, hwe);
> +     }
> +
>        igt_fixture() {
>                if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_=
RDWR)) {
>                        igt_debugfs_write(fd, "fail_gt_reset/probability",=
 "0");
> --
> 2.43.0
>

--_000_MW4PR11MB71510001191037441A2DEDF4E4222MW4PR11MB7151namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"font-family: Aptos, -apple-system, HelveticaNeue, sans-serif;=
font-size: 12pt">
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
Hi Kamil,</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
Sure, I'll incorporate changes once Matt give inputs on patch.</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
Regards</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
Nishit</div>
</div>
<div id=3D"ms-outlook-mobile-body-separator-line" style=3D"font-family: Apt=
os, -apple-system, HelveticaNeue, sans-serif;font-size: 12pt" dir=3D"auto">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature" style=3D"font-family: Aptos, -apple=
-system, HelveticaNeue, sans-serif;font-size: 12pt">
<div></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kamil Konieczny &lt;k=
amil.konieczny@linux.intel.com&gt;<br>
<b>Sent:</b> Tuesday, April 14, 2026 11:10:51 PM<br>
<b>To:</b> Sharma, Nishit &lt;nishit.sharma@intel.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Brost, Matthew &lt;matthew.brost@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t] tests/intel/xe_wedged: Add subtest to val=
idate device behaviour</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi nishit.sharma,<br>
On 2026-04-13 at 14:37:17 +0000, nishit.sharma@intel.com wrote:<br>
&gt; From: Nishit Sharma &lt;nishit.sharma@intel.com&gt;<br>
&gt; <br>
<br>
Please write a more descriptive subject, maybe use some<br>
explanation from new test description?<br>
<br>
[PATCH i-g-t] tests/intel/xe_wedged: Add subtest to validate device behavio=
ur<br>
<br>
* Description: Submits a long-running job using a userptr buffer, force-wed=
ges the device<br>
<br>
so maybe:<br>
<br>
[PATCH i-g-t] tests/intel/xe_wedged: Check ECANCELED after device wedge<br>
or<br>
[PATCH i-g-t] tests/intel/xe_wedged: Check device wedge with userptr buffer=
<br>
<br>
&gt; This test:<br>
&gt; - Forces the device into &quot;wedged-at-any-timeout&quot; mode via de=
bugfs.<br>
&gt; - Submits a hang job and waits for the hang to be detected.<br>
&gt; - Verifies that all subsequent ioctls return -ECANCELED,<br>
<br>
You tested only one, so imho<br>
<br>
- Verifies that subsequent ioctl return -ECANCELED,<br>
<br>
or did I miss something?<br>
<br>
&gt;&nbsp;&nbsp; indicating the device is wedged.<br>
&gt; - Reloads the driver and checks that normal operation is<br>
&gt;&nbsp;&nbsp; restored on all engines.<br>
&gt; <br>
&gt; Signed-off-by: Nishit Sharma &lt;nishit.sharma@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/intel/xe_wedged.c | 94 +++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; 1 file changed, 94 insertions(+)<br>
&gt; <br>
&gt; diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c<br>
&gt; index e1ac629ca..fe6468cc6 100644<br>
&gt; --- a/tests/intel/xe_wedged.c<br>
&gt; +++ b/tests/intel/xe_wedged.c<br>
&gt; @@ -193,6 +193,51 @@ simple_hang(int fd, struct drm_xe_sync *sync)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } while (err &amp;&amp; errn=
o =3D=3D ENOMEM);<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; +static void<br>
&gt; +submit_job(int fd, uint32_t vm, uint32_t exec_queue, void *userptr,<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t size, uint32_t sync=
obj)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t addr =3D 0x1a0000;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_xe_sync sync =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .handle =3D syncobj,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_xe_exec exec =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .num_batch_buffer =3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .num_syncs =3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .syncs =3D to_user_pointer(&amp;sync),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t bo =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *batch;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; size_t bo_size =3D 4096;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t batch_addr =3D addr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int b =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bo =3D xe_bo_create(fd, vm, bo_size,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_if_pos=
sible(fd, 0),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_XE_GEM_=
CREATE_FLAG_NEEDS_VISIBLE_VRAM);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; batch =3D xe_bo_map(fd, bo, bo_size);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; batch[b++] =3D MI_BATCH_BUFFER_START;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; batch[b++] =3D MI_PRT_BATCH_BUFFER_START;<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; batch[b++] =3D batch_addr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; batch[b++] =3D batch_addr &gt;&gt; 32;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; batch[b++] =3D MI_BATCH_BUFFER_END;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(b &lt;=3D (bo_size / sizeof(uint3=
2_t)));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_bind_userptr_async(fd, vm, 0, to_user_=
pointer(userptr),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr + 0x10000, size, NULL, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_bind_async(fd, vm, 0, bo, 0, batch_add=
r, bo_size, NULL, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; exec.exec_queue_id =3D exec_queue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; exec.address =3D batch_addr;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; syncobj_reset(fd, &amp;syncobj, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; xe_exec(fd, &amp;exec);<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * SUBTEST: basic-wedged<br>
&gt;&nbsp;&nbsp; * Description: Force Xe device wedged after injecting a fa=
ilure in GT reset<br>
&gt; @@ -209,6 +254,10 @@ simple_hang(int fd, struct drm_xe_sync *sync)<br>
&gt;&nbsp;&nbsp; * SUBTEST: basic-wedged-read<br>
&gt;&nbsp;&nbsp; * Description: Read wedged_mode debugfs<br>
&gt;&nbsp;&nbsp; */<br>
&gt; +/**<br>
&gt; + * SUBTEST: userptr-wedge-fence-signal<br>
&gt; + * Description: Submits a long-running job using a userptr buffer, fo=
rce-wedges the device<br>
&gt; + */<br>
&gt;&nbsp; int igt_main()<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_xe_engine_class_i=
nstance *hwe;<br>
&gt; @@ -310,6 +359,51 @@ int igt_main()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_assert_f(str[0] !=3D '\0', &quot;Failed to read wed=
ged_mode from debugfs!\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;userptr-wedge-fence-signal=
&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_xe_engine_class_instance inst =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .engine_class =3D DRM_X=
E_ENGINE_CLASS_COPY,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; size_t size;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; void *userptr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint32_t vm, exec_queue, syncobj;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; size =3D 128 * 1024 * 1024;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(igt_debugfs_exists(fd, &quot;fail_gt_reset/probability&quot=
;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O_RDWR));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debugfs_write(fd, &quot;fail_gt_reset/verbose&quot;, &quot;1&quot;)=
;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(simple_ioctl(fd), 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ignore_wedged_in_dmesg();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; userptr =3D mmap(NULL, size, PROT_READ | PROT_WRITE,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; MAP_SHARED | MAP_ANONYMOUS, -1, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(userptr !=3D MAP_FAILED);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; vm =3D xe_vm_create(fd, 0, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; exec_queue =3D xe_exec_queue_create(fd, vm, &amp;inst, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; syncobj =3D syncobj_create(fd, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; submit_job(fd, vm, exec_queue, userptr, size, syncobj);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; force_wedged(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; munmap(userptr, size);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D syncobj_wait_err(fd, &amp;syncobj, 1, INT64_MAX, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, -ECA=
NCELED);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_close_driver(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_kmod_rebind(&quot;xe&quot;, pci_slot);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; system(&quot;modprobe -r xe &amp;&amp; modprobe xe&quot;);<br>
<br>
<br>
imho this should be done in at_exit procedure, or at least in fixture.<br>
The reason is that if test will fail with assert, it will miss those<br>
cleanups. Also, there are igt lib functions for this, please use them.<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fd =3D drm_open_driver(DRIVER_XE);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(simple_ioctl(fd), 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; xe_for_each_engine(fd, hwe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; simple_exec(fd, hwe);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (igt_debugfs_exists(fd, &quot;fail_gt_reset/probabil=
ity&quot;, O_RDWR)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_deb=
ugfs_write(fd, &quot;fail_gt_reset/probability&quot;, &quot;0&quot;);<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB71510001191037441A2DEDF4E4222MW4PR11MB7151namp_--
