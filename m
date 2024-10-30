Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E7BD7494E
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 00:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D809B10E3DE;
	Wed, 30 Oct 2024 00:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EV7vz/Gt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884110E3DE
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 00:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730247353; x=1761783353;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ydpl5BKj5swdbJXsXa2jICRq3FnsGXfFpSddBMwNjSs=;
 b=EV7vz/GtlGHJNW1VtM7Fi+DQXsLwwlJ0eyEOGoOFpOeOoFspvlEL6ldf
 xBbnCwCrIE0Kt9RRkqo5bWkWo2Myf6p56Y6tuLydU+y2jKkBEbxXV0fxg
 iWi9iwHr0lcQ7JjPJstsah3fYc6qGO+ju+JJnyxEogkGp9lT1R3d4sCRI
 UVhTm7Ogc10ZPQj1Dvjq21BWTCJcmm19MxJDEKTc+KNtlzewxDmC2wkjV
 qtOG8CjQCiHc1+ahaG8soojLrsDgBbscWBlOzUtoXkz0tudULzTC7V4DV
 7MAfxj3coT06Mma5qGNtkCSZRAcBxlFmt6vb1WLHKmBBlh9oqSBm0Lmi7 w==;
X-CSE-ConnectionGUID: SoJZo97iRrCrYjgl3Ky3qw==
X-CSE-MsgGUID: axXgVhfRSYilS5xd428eiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="47405575"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="47405575"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 17:15:50 -0700
X-CSE-ConnectionGUID: MJb8jmpuT7KSapL1Tfc8Tg==
X-CSE-MsgGUID: JGDKLK59Th6/+eEyh5qbwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="81757923"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 17:15:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 17:15:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 17:15:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 17:15:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B61VwnjBl6NZLAwc9OkVF7yMcWc6JF9avHy5m4E4FB5W1lq+mFgk2KVxpTDexr79mocpU2YFHLe9MPoydThpY5H/8TSshOmUGDoFN5X+0gdMq0BZVefiIOg0FXFBVTCqDGH5vi7S7cBy9dlYZjvxsoQwkSD9vIh8wjWldC6hUsK3anCMQaSvLxHpwq5KMSESKc5C+H8Hot4eXg9TTvXhb7rUDqbSf14hdXCArvg54q+SbHzxbDG7/ikIGunW6bl+N/vVoXyFN5YXc2rBOCI+uHkhnc9cQuP1Ud1bnagM1o4/ruJleC+8ZcyKuUYKUSuyzpFiPgxmbOq9pfei57dwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlQwZn05eoLmh0aKKI5A4qbdIJFupqhI+HUU6K5GHqw=;
 b=id6ri/rrHEt2O7gk3bBvMpJfKxbrR6tqPCCpxAsjFeE4NvYXqLHyBM7AEBHp+yiK18ZXtBnxtqD8ypzeX7waJVZHEwTp80VtA3APYv3dhpTh76w2PlNuxrJrlKZSjt6EdZl2s/e0znSVQayG+FjIFAB8krgGnnGpPMTSSR0zfdaXzvq9nFKg2eOOqUjtmeKq+PZYbecZ/kFssv5D80xybp2ySaeuHVi12shgQeZT+5sXdWEvUmvNPQRdQfR0riyHvbhMlndOpGocK0mkOAAOhKaZ+WJXJnb24jRTqi+Tr/hH8AQ4uxc77BY5QgN5baXgK1xaNPPECWyxJLVkJfgOLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 00:15:42 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%5]) with mapi id 15.20.8093.024; Wed, 30 Oct 2024
 00:15:41 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t, v2, 1/1] tests/intel/xe_exec_threads: wait for all
 submissions to complete
Thread-Topic: [i-g-t, v2, 1/1] tests/intel/xe_exec_threads: wait for all
 submissions to complete
Thread-Index: AQHbKYvVm1pijAXeJUidqBX/87v90LKeZD4AgAAJUmA=
Date: Wed, 30 Oct 2024 00:15:41 +0000
Message-ID: <BL3PR11MB6362C8681468A4532A6B68FF9A542@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20241028225349.1596237-1-fei.yang@intel.com>
 <20241028225349.1596237-2-fei.yang@intel.com>
 <20241029233834.GA4891@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20241029233834.GA4891@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|MW3PR11MB4652:EE_
x-ms-office365-filtering-correlation-id: c0ba5f9a-c5b0-4ad3-d082-08dcf877fd9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wFkj5hftOQKRdNYyu9WtBOh/S2YtIcE9qhvee99wDsnriEue3K1unPiNmbEh?=
 =?us-ascii?Q?5wBFUNdK0Mmb5SsNorgGpjlqce3L5gg+6Obd6OMF8z0TrQu32z93049672G8?=
 =?us-ascii?Q?NAn2BDdmjYekHauN99kG6TD6T0ahOtKtDv6cLFYHbH6No6NocL6I7JSirgsL?=
 =?us-ascii?Q?MLTckZcupHPwykn6KrOtDwQSJjWo/5rAfC0kBCzIFPx1dUg82b6VBLV5Y68d?=
 =?us-ascii?Q?Mhp8zJfEZN6ZX8Mx+EG8qIzXAfG4x/5CVIlQypcfSFFicIwV/qf6waR3LGkM?=
 =?us-ascii?Q?sG0xG+wlE31pw1cotM7OIimzUIyF3zenidHqUrX7TzhnMuMeDL09fbtqHP0D?=
 =?us-ascii?Q?t9k318C6BbmKTW55A0rT+Fh3TF0Y/+CxZCLnlXSPZWDDd18bPdTUsS5wkJ1D?=
 =?us-ascii?Q?C86NUAMSYqiiF+ZIROOOZwtAD7cQ8ViK/LAd00itnlnkrmeyzsuU8QABH8KC?=
 =?us-ascii?Q?nJz765rsm7BczhlpHZdIlhuQRoG16dP7nlplXRXISMK438iyZIN8RaCMEvIG?=
 =?us-ascii?Q?kkXXppEE+1agpdF1ZDc25a/Y7kSjxcB3DeTAIriDfa2b20MLLakej8aFBa4c?=
 =?us-ascii?Q?Ab9uxdyOCNSq3pzhi3xZboALjNLvBplDxbeH0GS+rhkwZb/wt54MFpn0tXP7?=
 =?us-ascii?Q?mfHs0QeLK0nZTMya5Iusw/77tKDZi5IC3PvBj/765D+VX+HkWIuA8zljKPmU?=
 =?us-ascii?Q?T7yEdP0e4qzcvcSBch2nP6ZLv1WmT7KhuXfOZrrDVamgaB4N+Cao9/M4lmUL?=
 =?us-ascii?Q?400+roLqGQbJmABG5Wut6ZisMk0CqhHJZ3VONIHjU6Qbp3zkVRDyhvMuYMkr?=
 =?us-ascii?Q?usP1x6k6LAfUyIQQUTirh5D4xO30N6TPODiQXkcSgCyLK7jOhJ3L8goOyzJ9?=
 =?us-ascii?Q?oVJHkoeT6H+wWPFfFmZ1F1/KzyHDXwCdCr2tbV1IBeKG1jHtoXdLhlC8fj/h?=
 =?us-ascii?Q?K//piWoB8QeAm3sz7o5MwgSd7DZzlI+Wg5r3GsooUp6etKbjOEoQD4I28OAO?=
 =?us-ascii?Q?3RVKIaxwupaXvHRJDk7UgP+oNEC22Hq6+kZNArQQKk63QvWjZeLZ9WBJStCd?=
 =?us-ascii?Q?CYLkdW9/JvE1yshNQI4WtjQ9nbZWB8Rb5HuQy+MNftWad5aHGHmaMUOoZmZz?=
 =?us-ascii?Q?5fDjG1irkbx5jq5n8idFphjfGIUeJbzQKNX9OvjCD0hiIvuzP4OAVgaSZXCE?=
 =?us-ascii?Q?6d+A2bgzPPeOnrrWghstujHYFGD6nlT+5vF81bU67k7i7ZllSk/2D9Z8/em0?=
 =?us-ascii?Q?ZtJ/WHN10/PfWmoilNUvxZhQ2jDZvxNu+DG2uiGO2xaRXUwesqicMMyjLBlJ?=
 =?us-ascii?Q?hG/ud/RZUyaC1LFj3o9Oyo8LPNiwX1WUry+bkmtVgrWhkjZDn+ruFMPGEiBr?=
 =?us-ascii?Q?VkgoxrM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R9wMao3jpqRzvLmzKsZnsNs5dcPSBPEFCojcjv9QWlDn27L5YnT5tQMoiD/E?=
 =?us-ascii?Q?567VzG++hft70jeNabAMmo4/o+hCAXxZKPolArea/taGn5jZOpQPMyKEjZmC?=
 =?us-ascii?Q?ITTUaVN6QNEW/k0BwCYBSDwBVfyqXAhUFqfMhjWpyYf71OsWIBSjIfYmQ3XY?=
 =?us-ascii?Q?XIdHid3kTh9cy30094sNxQ1v817ke2jR2XBvjiAJWfEqTai/ZPSLB99NqLmp?=
 =?us-ascii?Q?8ocNQeLLSQbh/JFGjvQmZuPF5RwNEj3NZq3a7XmF3tMzkjZhty4kokzC4pgl?=
 =?us-ascii?Q?ufsHWNZuUn3il11L0C38klAiRUVgvRrRjGhiYQ0NZTYRR24JXAySUwLTCVUW?=
 =?us-ascii?Q?yvIDJJBqhmUqrHcWvM0mzm1Z9EV2GobHJ/fHmjT1iDmNjS9zGnIDtTXGX9+g?=
 =?us-ascii?Q?8xKrbiQRhRtFpfrFts1wOGCf+GNah4vpC9ThNt0I0Mra1m1/5To3WM4pgP4u?=
 =?us-ascii?Q?1gpEYAot8vPCx7EEu0keVgXgGUTEtrkzfRrsmwOhcc9XmIeJCTa4wrLkVNcc?=
 =?us-ascii?Q?75Kg35Xy+2vRcTg7YdprtwqqL8R95afi7Vxd5CHPOaCQyfcHd0DnLmKhkUxL?=
 =?us-ascii?Q?a0ODjKAtITEGI0Nrxwa2oeISiZYuWTM1RI1Di5kxBnHoYxUWSr15NcI8+yqt?=
 =?us-ascii?Q?Y9SR67TF+oMsKgPTIQvK4cetPUs6ZtuvgHTnM5mSQGjDHgY/zgiL1uHEPhL7?=
 =?us-ascii?Q?VG42M1hm8lsQv3C1+Z3ucBaLawQnB3SPOUXGJ8jK8yKql7YAnEPn3UsmQbpY?=
 =?us-ascii?Q?YJ8+AsL49GWKguUDR++k/+99SnyZ9+XD/Kwyn0Cc5ewafqt6+aASBOextzvu?=
 =?us-ascii?Q?DAloH9AFVk17gLME/ONAUECLe462ftvwMoseBfq/kft8I6TslKRkVTaN63cX?=
 =?us-ascii?Q?FpHs26xPqih3wnniwHIe7Ihgoatu90306tBGTPu/kqcWKPk/WvY0WVwCFHKc?=
 =?us-ascii?Q?H63WODtEFBde1rO+UhM5s1g76mlMageQ/3m14oDz0f+bR6tLVy/lPmR8qzfa?=
 =?us-ascii?Q?rJJ/hkfx8iYm2JGaLgTjmKdkizQ1Zy+T3/4eSnGpdX7884YmcNAHzLtMu6z+?=
 =?us-ascii?Q?eA12i+EdoBbyNrgCjmuT3AVOA07+4wWDVSxhIZrYmvpl7Jcqgvt3/goxOghi?=
 =?us-ascii?Q?of46vRfL5ZWT4xNxLv0i2nyHWibdojOAqERkVjtpXkBaeMCKJDj7sy01bHEC?=
 =?us-ascii?Q?f1leUhNLiXR6qbBHgeA1zh7uda6XzYz+muuzN82vhHHMSj3xUVUHRUBR8cCW?=
 =?us-ascii?Q?s5Pp1XAXTaHvgBoxR3NDh3Ak9FM0vBD1sv3Hp40VXOmEZXhSavhSDeWHWIA4?=
 =?us-ascii?Q?QbjIFZtdpK4gVNiljDIs6sKHrXrZ5XrNe+4Brwk71VVs5jd+abW11aHqzjWb?=
 =?us-ascii?Q?8Mph4eIm9/TRnY7OSgWhEEefxk9R+mPPT9BjK0hWd7NT/4qPgl12fcrf8s2w?=
 =?us-ascii?Q?VtK0ntxCx3Mv6FIvJA+Zfv5ym0BOugZOSXhud5Ha3v0yTpAQ9ISlQwAN/Yw8?=
 =?us-ascii?Q?g+p81APz9xLthCjGvB97gf4Vrf8VBNMNO+xoTU/fRNEISYUKnUAnBa88R0kS?=
 =?us-ascii?Q?IfZ8OGlWJYSnAWi+4Lc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ba5f9a-c5b0-4ad3-d082-08dcf877fd9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 00:15:41.8905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mU7tcWjlqqxBZ/G6VjTUaiHyYZND2CYwEyU/9ORKcEoX+js0C+uuvvwhbZjUN1yBYhH7xzlQi21anZi8dum9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
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

> On Mon, Oct 28, 2024 at 03:53:49PM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> In test_compute_mode, there is an one second sleep waiting for all the
>> submissions to complete, but that is not reliable especially on pre-si
>> platforms where the GPU could be a lot slower. Instead we should wait
>> for the ufence to make sure the GPU is inactive before unbinding the
>> BO.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>  tests/intel/xe_exec_threads.c | 29 ++++++++++++++++++++++-------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_threads.c
>> b/tests/intel/xe_exec_threads.c index 413d6626b..03043c53e 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -340,7 +340,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr=
, uint64_t userptr,
>>              xe_exec(fd, &exec);
>>
>>              if (flags & REBIND && i && !(i & 0x1f)) {
>> -                    for (j =3D i - 0x20; j <=3D i; ++j)
>> +                    for (j =3D i =3D=3D 0x20 ? 0 : i - 0x1f; j <=3D i; =
++j)
>
> The change here doesn't seem to be related to or explained in the commit =
message as far as I can see.  Right now every time the outer loop is on a n=
on-zero iteration that's a multiple of 0x20, it does this inner loop to wai=
t for those last group of execs to complete.  As written today, the test is=
 accidentally waiting twice for some of the execs (e.g., after exec 0x20 th=
e test waits for 0x0-0x20, but after exec 0x40 it waits for 0x20-0x40, acci=
dentally waiting on 0x20 a second time).  It looks like this is an attempt =
to fix that by starting the inner loop from i-0x1f instead of i-0x20, excep=
t for the special case first time to ensure we don't miss out on 0x0.
>

Yes, this change is to avoid waiting on same fence twice. I can separate it=
 into a different patch.

>
> The logic in this test is already pretty confusing and poorly explained.
> Maybe it would be cleaner to replace loop variable j with a running 'last=
_wait' variable that we use to catch up with all necessary waits?
> E.g.,
>
>         int last_wait =3D -1;
>         ...
>         for (i =3D 0; i < n_execs; i++) {
>                 ...
>                 do {
>                         last_wait++;
>                         xe_wait_ufence(... &data[last_wait].exec_sync ...=
);
>                 } while (last_wait < i);
>                 ...
>
> That said, this change still seems unrelated to the change described in t=
he commit message, so maybe this should be a separate patch?

There is another line of code inside if (flags & INVALIDATE && i && !(i & 0=
x1f))
down below that does exactly the same thing, I just copied it over because =
it's
correct. I think we should just keep the code consistent.

>>                              xe_wait_ufence(fd, &data[j].exec_sync,
>>                                             USER_FENCE_VALUE,
>>                                             exec_queues[e], fence_timeou=
t); @@ -404,16 +404,31 @@
>> test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>>              }
>>      }
>>
>> -    j =3D flags & INVALIDATE ?
>> -            (flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
>> +    j =3D 0; /* wait for all submissions to complete */
>> +    if (flags & INVALIDATE)
>> +            /*
>> +             * For !RACE cases xe_wait_ufence has been called in above =
for-loop
>> +             * except the last batch of submissions. For RACE cases we =
will need
>> +             * to wait for the second half of the submissions to comple=
te. There
>> +             * is a potential race here because the first half submissi=
ons might
>> +             * have updated the fence in the old physical location whil=
e the test
>> +             * is remapping the buffer from a different physical locati=
on, but the
>> +             * wait_ufence only checks the fence from the new location =
which would
>> +             * never be updated. We have to assume the first half of th=
e submissions
>> +             * complete before the second half.
>
> Doesn't this assumption just bring us back to the same bug we were trying=
 to fix here?  We don't have any guarantees on scheduling order or speed, s=
o the earlier execs might just happen to get scheduled later than the more =
recent ones, and we don't really know whether the work is finished or not i=
f the sync's aren't reliable.  We can't tell whether they're still truly ru=
nning, or whether our copying of data from the old buffer to the new buffer=
 read the pre-completion value a split second before the GPU wrote out some=
thing new to the old buffer, so when we switch to the new buffer we lose th=
at racing GPU update.
>
> It seems like the proper solution here is really to have a completely sep=
arate bind at a separate location that doesn't move or get clobbered that h=
olds the syncs for all of the execs.  If there's a bug in the driver, we'll=
 still see it because we'll get faults from the 0xcoffee data write.
>

Yes, there is still a chance for the race here, but so far it works in my t=
ests, so
sent this as a quick fix and left a comment here.
I'm working on another patch which separates batch buffer and sync data, bu=
t don't
want to have too much pressure on this issue, so my intention was to merge =
this first if
possible, and take some time to make sure the subsequent patch works perfec=
tly.

-Fei

>
> Matt
>
>> +             */
>> +            j =3D (flags & RACE) ? (n_execs / 2 + 1) : (((n_execs - 1) =
& ~0x1f) + 1);
>> +    else if (flags & REBIND)
>> +            /*
>> +             * For REBIND cases xe_wait_ufence has been called in above=
 for-loop
>> +             * except the last batch of submissions.
>> +             */
>> +            j =3D ((n_execs - 1) & ~0x1f) + 1;
>> +
>>      for (i =3D j; i < n_execs; i++)
>>              xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>>                             exec_queues[i % n_exec_queues], fence_timeou=
t);
>>
>> -    /* Wait for all execs to complete */
>> -    if (flags & INVALIDATE)
>> -            sleep(1);
>> -
>>      sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>>      xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>>      xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
>> fence_timeout);
>> --
>> 2.25.1
