Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830DCCCF9F8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 15:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C4A10E0E3;
	Fri,  7 Nov 2025 15:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJ4/h2ns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF1C10E0E3
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762529100; x=1794065100;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kLY77kUUXtjtc67v7DR4aSHWqmfVxEUniBMj/rf+zWc=;
 b=NJ4/h2nswNLgJU1MbZ5NRR0dPR8tw1H4oJcvDko2cT9iSigLD9W2Bx1e
 qlqSFRtd8p68UoNsrkDpWJpNQFn0POg6E3tONtmWxeOgVgLHHNVyeunPs
 YX76ohZfZmsUYtsHjlFsMZ/pAF2KqszVRJfvV6E0skWmh3u+lGanIXLwS
 /TQsgc2n8GfDh9yVl4ebgcmrH4HNBKJyDo4epZ2RytqTUidYefL+5HL7M
 sIYzrdHU2Uqr3Bo0djThgLm3nbpcJq+H8jCCsNFCye4n7il4+ke7CKu3E
 FutPvG9NRqM4k6kZ+9GqAETN37BX5l9Yq31GKbp6SKVt1M5tXmSc4RxZJ g==;
X-CSE-ConnectionGUID: Wz6yWcfSTz+JNh5Zf8ZEIw==
X-CSE-MsgGUID: Sdo3a5icRkmHPPMrm/D7gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="75289853"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="75289853"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 07:25:00 -0800
X-CSE-ConnectionGUID: g/eOpAVqSJePB6La3dJ/tQ==
X-CSE-MsgGUID: FQwPP54QRlKxbeqHJD50fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="188228362"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 07:25:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 07:24:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 07:24:59 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 07:24:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzmBBSqziDr7axB51t8kd1LubayZu70RCnd5vOLe9Gh9Y0VDAeBGCqbME+JCoMJLiu/NNVO/W8XLtDAHIyM1M5q0uEpLf8L+Uja3sjNJ3yEWz16+mBFkD+cCfhJs9Os50bL1kB418u5JxpaWo97H3QXlcZQzBLnKdkO1izonBH7zPoxNC2heBJN8uBBm0+7gTx/LxA+aNsGwye38rmgvYAp1ZJ3MOlW00cPAHYNh7US+O8/OBCOGpenQ+wT7cjBHnd69MISe9sEjudAYzyHCSHcV0C7V+O0tu/+DPZvjjaSoQ4AkMUYIvQdjDMXRUOGtLZKeDpGzqnCeCTe6VTD3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUClT02VVhw8ULxi74nSZJUzQhKqlA+JBrhEkmM7Ik8=;
 b=POoJdLKHzD9u5kBqQoY08uNUlz4B9h8oypz6zqUGyHXmO0ewl4WLNXHqzTaThlEWG+rPbfwXIf4YdCfCBIQKrGXtoiKrtB+ZaPHdsFWYQ3l40tNYL1q0+V0H9OWGatv3USNBwB3k7ajUT0nQusYWRbIhaz85JqOZaHjHTuXsyxn7RP1kxNGLQSZQaZIpj5SXWT3MjfG00wrfOWPWFaF/26sk02qQo9k7rZxebD5jW10gMxw+F7OWoQR80NxYl1nLmsNEHbx6hSj3JZlOgdRWlJHpv5KDY5yR2m4NSTrHouVAb+By+FCpD03g9mNir7hoCrR6BU7RylKM+2C4qXp0Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB4944.namprd11.prod.outlook.com (2603:10b6:a03:2ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 15:24:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 15:24:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
Thread-Topic: [PATCH v3] tests/intel/xe_pmu: Tie preempt timeout to exec
 quantum
Thread-Index: AQHcT/kADgKDmXOxhUq9V+/UTW1MV7TnVNAw
Date: Fri, 7 Nov 2025 15:24:56 +0000
Message-ID: <CH0PR11MB54445C9848315986AA8F11D8E5C3A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251107151251.6323-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251107151251.6323-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: riana.tauro@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB4944:EE_
x-ms-office365-filtering-correlation-id: a5085827-ef56-460f-4e53-08de1e11ce8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YNgcu3zKIyF0EmXqyjLQxrXns0GTKjV2S3EHz1YY7d2ciGD1kImsghzHD+of?=
 =?us-ascii?Q?3HPJZ9u4V8NINc3o6eMsHDdAS6zxnIgW9kd8J1KLRMjCrUDer1dvAvYe1AYo?=
 =?us-ascii?Q?b+C79JxyNYN2L7igbGzAu1RXcEN8nmkpC064Cdg70EVASUG+yrgtsc4YyGUT?=
 =?us-ascii?Q?feA8v8eJ0bF34ta0j1skO0/KzmDehalJRwmEUyM33b8AU2YjXlWL1IowZSdL?=
 =?us-ascii?Q?vHw65/UsNjL574Z7HHVJpqhYELGX2nQwa1eECYvWVt3W1JjiWpJP2+HHO2G4?=
 =?us-ascii?Q?v8oWdPlQs/l2kfQOOKfLoui39AqyB6Uw6J87OWq81ZopwCiHPRznHXH2dxTp?=
 =?us-ascii?Q?nbRo6ycpdnMdingC8FTvsvN/Uhj1N4HU+FDfP+d3sFRNWGwcekJIH/mAHB2X?=
 =?us-ascii?Q?PefYtzSNAYmTj+3W59vzSz+tYQ6WKADQBeg7v2kNqMV3cuxa+S93z0HjHwmf?=
 =?us-ascii?Q?KrQq7ySFz0U7x29qGp80iot+4gqT+l6v36zFqnBnFFJg5GtFz3U8G4KL0sbr?=
 =?us-ascii?Q?9kTV9BbVsV407IY12Cz3r9eNry3rMkzFtpjdEHqRe68QD4QQrDBhOo6OsVqj?=
 =?us-ascii?Q?3N3yV++r9Mc1SyCyD6jqpvAjCcT/NY5jSKZgQ1h0rUAdblr+OI/2QrZWg15Z?=
 =?us-ascii?Q?JruuSDJeYFKgGijy0F3QaiMdXWo/e69+3up3+nS9vG9d/O8UR+FEem8NAGAm?=
 =?us-ascii?Q?MByGTJTYzCU3aTViMBiLqhPftV9xzsVK0C18YcXLsEKVnn6OV/U9chNxV3RJ?=
 =?us-ascii?Q?WjuW1wecsIc1Db0vnDg58d4lVY4WY8GFQYQL7guwV9hyTJCUiLCd1wlSkcqT?=
 =?us-ascii?Q?O7GG8zuefNkktkXzFxm/xfqvQeIsyYYozejMFbOotp9F3zWXj5LjuA2NK/Ft?=
 =?us-ascii?Q?KhM4yOkBtP9F2NLGP2mXt4eTOLkOfnY8Xq8tCz5EDOchA9zfynNjKwDU4Fqt?=
 =?us-ascii?Q?GmdX8KufaegLVYKnXgB3WOMJFO87OszQIK2Ei+rYEh2dyf0R7ssWpiYOhUn/?=
 =?us-ascii?Q?Hx/xMOAg05vjLfGfVJbmj2AnGWLCreJ3irSvrNDZGhcuAv1CzY/l5YJTDMm8?=
 =?us-ascii?Q?dv4QHy17y2hADRwhDt9lO79thBsBudWEU9Ub3ABEqED0LxhTz1xGmw49Y8SS?=
 =?us-ascii?Q?HOO46+MrybsH6gfh0FpLnoCzo9JIt6WduYPOUz6uzlIDhse6/0iN8U3BXXdj?=
 =?us-ascii?Q?hVzw/cY0PQaxAqWdB2gh8IplduA54Hon24j4prSXD04piEQG0BO075AVMsKR?=
 =?us-ascii?Q?d6/SFs5D/uGdukam6mknN4kx787+asirVYd3A+UBOkZclkH7lr4bxkJ/ReWf?=
 =?us-ascii?Q?dHjv9baxhYORBXLKiBTESVdOa116y+fiM5oIqfFYh0YcGjA8riH3MK0mc7jo?=
 =?us-ascii?Q?SQ+sihb5fvdX2NUrjhBfDaeyuu0YRWlVjmqGuCtprjkpRQkGkB/4+gJYaGf6?=
 =?us-ascii?Q?wLNJIKxJWffH+Jbuq1cPN9B1tc2i/TAhsfr/2MhM0BVbsFPSNjDL2bVwS0ZB?=
 =?us-ascii?Q?yHSX63haqp5zogX1xNwr4PZyOUGCZ+P62rHg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kAScouv3sPV2g4Ta4IdHKz/ba6ezHYXra9PT8jJtgLnzidZtIeHYCbK37bZY?=
 =?us-ascii?Q?CdYyfKaGaSk83JY/bhb4VjPwZJhbGJ2OPZ4xMRjbvsbUVXSIOXW/8Ch0gPnw?=
 =?us-ascii?Q?CwQItmVHUXNpQDIutkIzxEmDw4w/eCaqbQHMvPSU8gugCIJOGAu7b+Zhc6Ii?=
 =?us-ascii?Q?N4aOnRFOsWSYFGV32JIN5YAdVH6KWNd0LRVLnpx65gudPwntditSAXxcoxS6?=
 =?us-ascii?Q?6hQld1bFVYz9WET/ms3x7RehulGmPEmKLv29uSwdeUYpAe9XrIFtjncSYnBF?=
 =?us-ascii?Q?/Bkb3+53piTLo5MuWix1fLgHtjcf2Yn9q2CGJbH44SMwlxXuLwRc3n2FKh/3?=
 =?us-ascii?Q?TiD4mhdKcO+daydQqa/hv9NQz3pmiGWCJWthfdCj86Wefr/U0I8n4qYbl2HG?=
 =?us-ascii?Q?yPMptk00/1jpZb3tzD08T6idb26bQfFmFjCYfiDPp/2j7tVvWbpVty8bzHAn?=
 =?us-ascii?Q?AMotliZO+UzeYmYt+WAJRNI33oeEmB+Lw7xYf7oH/wPZcwg8+t6ALAv/BcsL?=
 =?us-ascii?Q?eJvF/B+pjC5YAs8d05bndHhxs7hzHjqpIrQgI3KTpOewKx/4NKvvcg2Nyux+?=
 =?us-ascii?Q?ce3kh3HHyFd/DSxI6kcZJkIjhPQdqNYplSuEeKGlsygKqUXAKJHJhYtzUFeN?=
 =?us-ascii?Q?MUJYrxvlu8aExMtu6Sl6vANuW1fZRbXhtRZY6vtBBUnYONyNlwIFMHAs0OjE?=
 =?us-ascii?Q?4Go5tmUYha3d1e5tDy/qMJ1TGeJFk+3aUfBLeoluHd/0i8/0iwCpXLLwZrJb?=
 =?us-ascii?Q?ylv6qdwjrqaUs6aWXM8jUdCECitfwIQw6lypuZwhlt1J8amsx1qSDUSrn9H5?=
 =?us-ascii?Q?rqsEshYueeZsAiNUDZAV6f/iriwj41RkMAssiiGVAld9xkXGXi78O+2sLeOK?=
 =?us-ascii?Q?AnPpQVdjZDbhHsqC39hYJUGMOJYkH1xjdE8LYGwKPtrkcR1WgCl6nGdgXuum?=
 =?us-ascii?Q?CHB4LmFr5qJ8COzfVOrD7dD0HeqpGAmBYONhQAxx2STDlLoS1fLXGr0Lg8XZ?=
 =?us-ascii?Q?HoXV1vo4Gg4pEs+tK8LsnW4D2J3uWhmJpdegzQYW6zFWNGbrXLL6l6IdUCK6?=
 =?us-ascii?Q?vXH/P5RGXUNhWfvfYzfQE9AJBx1Z2IVfqNX+7Owxvjs8VblZbQ6lB3PuF0Qb?=
 =?us-ascii?Q?xvfPEZqnxw4Dwv30KXfSQOcydPQT2eg2aiiRl+9HlY44pWKo9UleyNIm5UOs?=
 =?us-ascii?Q?m24126RziMMwPkn27+EBeIPL+iTebEv2DsGOPW4OCSiZDhGv1yB4DJ7qs7WP?=
 =?us-ascii?Q?ohUZRf6PhisP3Zdc8NYPzN4GiAlhYkvCA2Yt7i3VYzx1aDEdUGGcZbrsctWZ?=
 =?us-ascii?Q?5LpgI+97MzPKcBy9oh7uz7IhDCjPUw7e2fElTf6WRnL4GsoJOl2vrUZSWyFG?=
 =?us-ascii?Q?v6mnUy00ybXJ9tBfW7bILtl9PZ5HY0maLGq0folikutG303RYHFgQSib0E6I?=
 =?us-ascii?Q?+cmIo7yrzmLzFO4+xXhhpFVZIztAm21ln7B0ixrO7Xm3Nfq73YlkBeXC5tC7?=
 =?us-ascii?Q?/kF0bfFJXPHQtlC7PgM275zwpnx/vGP5K8t4V3NlmFE547zIvjGnKzUree7N?=
 =?us-ascii?Q?DbQ9Iy9Z0iDTZhxfHKCUEAVgqEHTEFHNzjIIvAKOxoG8nJsmT2pflhFHBWhk?=
 =?us-ascii?Q?psCYpXlKn/BIINnKtushHPhrHyylvUw2XkvISLWR5hhL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5085827-ef56-460f-4e53-08de1e11ce8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 15:24:56.1517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9VB5blZoIWO8sFtOx367nMYC+xy2CNAnUX1OI55GOII+SfitsnYV6fLEDYrukVgo4CMfEriwILjmGob/cUoGgFgNGzrlPuPiyAmJJ8dApk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4944
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

Pinging @Tauro, Riana for confirmation on if the preempt timeout
values look okay.
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Friday, November 7, 2025 7:13 AM
To: igt-dev@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg=
.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Wajdeczko, Michal <Micha=
l.Wajdeczko@intel.com>
Subject: [PATCH v3] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
>=20
> When updating the exec quantum in enable_and_provision_vfs, update the
> preempt timeout value to be equal to the exec quantum value.  Also,
> reset the preempt timeout value on test end in
> unprovision_and_disable_vfs.
>=20
> v2:
> - Multiply exec quantum by 1 instead of 2 to get the preempt timeout
>   (Michal)
> - Compress the vf and pf exec quantum and preempt timeout values into a
>   single define (VF_EXEC_QUANTUM), and operate on that using a
>   PF_MULTIPLIER and PT_TO_EQ_RATIO to generate the requested values for
>   xe_sriov_set_exec_quantum_ms and xe_sriov_set_preempt_timeout_us in
>   enable_and_provision_vfs (jcavitt)
>=20
> v3:
> - Revert conversion to defined macros and just add pf_preempt_timeout
>   and vf_preempt_timeout as variables (Michal)
>=20
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_pmu.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 9525655ba2..bc6688744f 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -974,6 +974,7 @@ static void test_gt_frequency(int fd, struct drm_xe_e=
ngine_class_instance *eci)
>  static unsigned int enable_and_provision_vfs(int fd)
>  {
>  	unsigned int gt, num_vfs;
> +	int pf_preempt_timeout =3D 64000, vf_preempt_timeout =3D 32000;
>  	int pf_exec_quantum =3D 64, vf_exec_quantum =3D 32, vf;
> =20
>  	igt_require(igt_sriov_is_pf(fd));
> @@ -987,12 +988,18 @@ static unsigned int enable_and_provision_vfs(int fd=
)
>  	num_vfs =3D igt_sriov_get_enabled_vfs(fd);
>  	igt_require(num_vfs =3D=3D 2);
> =20
> -	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum =
*/
> +	/*
> +	 * Set 32ms for VF execution quantum and 64ms for PF execution quantum.
> +	 * Set the preempt timeout for the VF and PF to equal their execution q=
uantum.
> +	 */
>  	xe_for_each_gt(fd, gt) {
>  		xe_sriov_set_sched_if_idle(fd, gt, 0);
> -		for (int fn =3D 0; fn <=3D num_vfs; fn++)
> +		for (int fn =3D 0; fn <=3D num_vfs; fn++) {
>  			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
>  						     pf_exec_quantum);
> +			xe_sriov_set_preempt_timeout_us(fd, fn, gt, fn ? vf_preempt_timeout :
> +							pf_preempt_timeout);
> +		}
>  	}
> =20
>  	/* probe VFs */
> @@ -1011,8 +1018,10 @@ static void unprovision_and_disable_vfs(int fd)
> =20
>  	xe_for_each_gt(fd, gt) {
>  		xe_sriov_set_sched_if_idle(fd, gt, 0);
> -		for (int fn =3D 0; fn <=3D num_vfs; fn++)
> +		for (int fn =3D 0; fn <=3D num_vfs; fn++) {
>  			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
> +			xe_sriov_set_preempt_timeout_us(fd, fn, gt, 0);
> +		}
>  	}
> =20
>  	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
> --=20
> 2.43.0
>=20
>=20
