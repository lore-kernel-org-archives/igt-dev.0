Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED94D116EC
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 05:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB8710E02E;
	Fri, 25 Oct 2024 05:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IafFpIBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557DC10E02E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 05:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729833316; x=1761369316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SWbIf+zc1Hcb8sXIdRF8B4HOP2/uPYhJxa7K0GL5ljA=;
 b=IafFpIBAKn6J4UwI6nfZR6Q3qsgWoI+8zHshmg8l2Aayc1Bk6ClJohjq
 AFn2Gk2/8JWrYCi5HXiFWTNJBQ2FeI5Eo6KG8nMS8Z++fQkxY3BTQE9UI
 Di9AY0HoYKlVcu2R93rlMjmDt/hIu5flkYzwYogg/HCFMY4FBdXE2N5pv
 1IcbT14+b0eMRt/XRs7wpNoupTNPc2daOW9eYumDp/aSqlTiS0PJQ+IrB
 IOpiQs5dpqRedWL1UI4xVxlMv9L72NzIPsjwoMTPlrJq78b3EKYZioCOx
 uMJpMZH5F8HZZkNECL0RH5FWYxYRpvBCnyfyh95hcRpiv3pxs+6NiV4f9 A==;
X-CSE-ConnectionGUID: 90jRZlnTS369lwFe/I27Nw==
X-CSE-MsgGUID: 0WnsROg6Rzqyk8m/+wbESw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40110541"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="40110541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 22:15:16 -0700
X-CSE-ConnectionGUID: ssjoyUOKRuCqzSYeYFVQzQ==
X-CSE-MsgGUID: InM1m0eSTRSTCiMc6A+4Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80724183"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 22:15:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 22:15:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 22:15:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 22:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfdFoYxa8KhSfK0JlDNNEZp6uKIgHrP7ETLLbLt8rT+2/1kzAYJZLkY2VjWf7xXfGa7QqywpSSvaUZzSWCpI9O2RgZScP7WrwK+xusGS3so1Ogs2vDjhMsKrOg5ZAxt120UuK8TSv6e2LVvgysbXEjx+WxtI98ICYoN0BzTcCyUmK/vBK40XdrCL3NX+rCZB4oAW4Tz9P03MTQ43Vmen+7HSYcRP/xCDz1gRAV5P3mMnSj+rPKD/RgWaHUkS4iLHy9rvY1ZfMis5FmphxL/bpp4pQOfA8RFlNRBYQupvm0b7+hcE652u2K5qH8UVqMFZJtCsKvqqcAXE8/cQBclz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVnDjPNoYPEU2vtOi95daEiA/9v50RXlUIRN6J9PJaQ=;
 b=RAM4hi7/q7SHoWl1BZNXBIL3XyIyWWDdaeuRpCpxtLQJio9Ji4rwQ5t4d8XUlNg822rHy5HfdDbsS9ttV7FkRVvMQGM6ZKoZHwi9AZtwcmYu4FgCxzcCuAxDKNI/aUeNxiyGk0rQtPbrKi8/h4gODcQorAK17c5Kr2FxfwefnpC8wTV67O+7YTGtrzgj7NqkeSw8DqxMf/vOrs0KPyKcLWjY5IhrJUSk8QlA/M2h+vLp7PnY2nNdYmjkHGByXXWapK6XUy6vxRPVMWSbaZ9wo4V4v/XGFe2qMtSeqCBkQEkfyJun56QWfb/SIOQiXskMJZxTh4jfsa3UiJAoQsDEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by SA1PR11MB8475.namprd11.prod.outlook.com (2603:10b6:806:3a3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Fri, 25 Oct
 2024 05:15:08 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%5]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 05:15:08 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Singh, Apoorva"
 <apoorva.singh@intel.com>
Subject: RE: [i-g-t 1/1] tests/intel/xe_exec_fault_mode: wait for the
 completion
Thread-Topic: [i-g-t 1/1] tests/intel/xe_exec_fault_mode: wait for the
 completion
Thread-Index: AQHbJnOiHaj4rHAKXEunHJ4espbM6rKWoHsAgABMEzA=
Date: Fri, 25 Oct 2024 05:15:08 +0000
Message-ID: <BL3PR11MB6362AF44F412F6B33E948CFB9A4F2@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20241025002322.1422552-1-fei.yang@intel.com>
 <20241025002322.1422552-2-fei.yang@intel.com>
 <ZxrpVF3N88rDpyvv@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZxrpVF3N88rDpyvv@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|SA1PR11MB8475:EE_
x-ms-office365-filtering-correlation-id: 4ada5663-18c9-4bd5-2f1f-08dcf4b3fe4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?WcOXsrgpTurX15rAMgrEeeafhEwITRRe933tqp2qvgoP3aejy8jQY3JORdAd?=
 =?us-ascii?Q?67zEKlhh87w+WylW8unrk8WgW5dOI/WiR5luqMNsmVV5rw7ih31lg8KbQxhd?=
 =?us-ascii?Q?JbTF9zwA2CfdlB2UTKGyu5ZVV0stFJ3K7x0tC2J7G9uzVmKmG3zsVJwgK648?=
 =?us-ascii?Q?zS8SpAIMic6pn4WUDuTlaYKNfmRALSrPsxAG42k4FfCjekGSP9jRiH6Df3Ee?=
 =?us-ascii?Q?F4qIcsmtx91q5xSE7528LEKpc8SRVdCcDT5j3/ndwRuegyO0/JEXhtf4E1kg?=
 =?us-ascii?Q?0ReGiCVZMZqyDvBlxWVtHTUW2CFlkIXUoWiQm5nRnHKNlCsDx1ed7CX1difZ?=
 =?us-ascii?Q?+2oE3wHgAz978+uybXIlzyq+uZ8FsCpH99s7PNJvqLiIROG3K3uQ98HIgrkW?=
 =?us-ascii?Q?3W4XSkMtJHFZ0zNI4j9VX2DeX3ALiPC35+k2QlYHNZT+9T7dLiCV6pygU/0S?=
 =?us-ascii?Q?ACdJ4t5XlPN7Lh3CCIKo0jwBdR51gfT/NzyX5s+s9BZTtsfr1mZ3orc0e5Jy?=
 =?us-ascii?Q?9ZInrawaJK5bJQnuOG4FJdWLq0YgNIo6HSdDqe4lphrNyzqd8uCveBEtn/ck?=
 =?us-ascii?Q?W/RMFDGLqXPRJBhUwLJBBmR2qikiPL2p2jW/eRVNpgs2WZQdQqXksBG0cR7I?=
 =?us-ascii?Q?OeSiu20evGi7xggPlW01k5IA9rNx+US/Llkkvc6uC7cgH4c+5pTRiAzBA2fz?=
 =?us-ascii?Q?KrTq4rbCUw7OAlQpBTYEWZLm7+3EkaTFjQRzJoo9O3udNz4YlB4fXeVdrAMz?=
 =?us-ascii?Q?jaKFgXrq0g9qMUbg+JYQRaTUkaG6ICxCkMEcw99yPOMuH04DlAwXIqmQOHjm?=
 =?us-ascii?Q?jTx+1dfAgnTL6epNTdwCOjLeSJl4NlnIUvF7vfbZDCwBLkKM9yK7tbM+7xse?=
 =?us-ascii?Q?SqVuqK1eE9UGgi3UeHdOUU8suQK7Nb2/65REBVf4C5HJaGqk7QLcsee8Fcdm?=
 =?us-ascii?Q?4mVD2EPrpfJRxwmGMomvPyrkAl/Iy6XubCVxpBvl2kn7tEW+3kPKntY84lqQ?=
 =?us-ascii?Q?PIGiRxh6LBRf2br4FloFYUlViO7pchm9hbBaLXC70SM8YiHIiM595agEFWHn?=
 =?us-ascii?Q?ry2vazrByayigKwNQkl5W795nNcXc0GhFEL/ns+/aoxy1ksc03pQ6Nk4Bpud?=
 =?us-ascii?Q?lpbXxzrBkE+KRyq6E6mw5lJZ6qurX5Dw98NUZWKw/vdcakULiUjhKFUXjnee?=
 =?us-ascii?Q?wVfiWmhA9gUlkv+QnBNetQ4zSWNPfWTSdTpeGlX9994gOrV8upS1guQ2p/sf?=
 =?us-ascii?Q?6Cg1Wv9POtExaQ5MpTTKWQvtBr4cQL9Ww2/w3WCMTttUh5h0itlIChs1J3JG?=
 =?us-ascii?Q?1C8KARpifWkl2Fp1oqas8fXt0tOAA3THQvWKNKosRaNnWKZXfhQnf3t53eb3?=
 =?us-ascii?Q?v9HNaQg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hsdSVuYT+lHDQ5qNzbbmwwYnLDvJRXyJNt3u8N6KRiF14Q8ZlGX7BYQdY/U6?=
 =?us-ascii?Q?gLBCM2FgY56g4r/Xbl4LZxdEPBfURBq0tqFkOWx+c78ZUv92DMipUBWDKWRN?=
 =?us-ascii?Q?ul8XQK2kHx4fnL3Qw4JyXL0D4BOgwI9PAHRMf8GOOX78/aAfmsFv/Sj4nl76?=
 =?us-ascii?Q?Bre7xdTlonx2Dm505UBUqwln3WspRS/BTHCsw9G56YlQKYUBwqTSjvLQ2r7t?=
 =?us-ascii?Q?RAhNwr3UQEDtVfEAsA2IAUSIfTehJEmGBiBqgk3ZxhvSjn3l8rI6NfKjFBdZ?=
 =?us-ascii?Q?135XumJOk9quQpI7myrAsom9AxaJNcVYFzWArPw8CB6wjgbLoJEUyJSFE8lp?=
 =?us-ascii?Q?Gl5peK7s41yaWDVe+2kBCM0nKyUV8SgkV3Zj/sG6t8sNtOPJkjv4WZOeSM6H?=
 =?us-ascii?Q?+rmtLbaSc4S0vN7StyQB+FZHVrJluy7G0A6DQj03IH/TDCEOauA6wHeE8Okl?=
 =?us-ascii?Q?6TBKa/AnjLZfZOxuO5x8Kt3QyZmHs0gbxK86ak4cdSBPwmTZaDN3coJEnmZ3?=
 =?us-ascii?Q?ao6DQoSHMokNJpNw8o+vhnbSW67NOTSQWcd90tNt0oCmvBoGNZfRZ/ccddyD?=
 =?us-ascii?Q?KFDcxNU0fTCA5oYSOSgWYkdQUYIE3w/B+4f+8BUiVnZoTdwLf97SfDQUd86N?=
 =?us-ascii?Q?OmJn80/feo0W1ZoypnR+E2jrLMNyC5+lLPuxWU1jgYDyG4gssE9gz/btk/ad?=
 =?us-ascii?Q?YEfzPNRt8X1/p3vAeIOTSPiBbvI4MWdGAM+PT2K8QoAnqE7xIdDTsOi3q3S/?=
 =?us-ascii?Q?pbmchh2xZj/6ZuVVg83EnqeEPpz0Hie3OuHP5dSARjIEcQnGxZm5cLE+EpUi?=
 =?us-ascii?Q?NWdMTuRNFHp6bygdm4ALEyaNNoYi0y5JhlFUXiRBRrb2qYyGZy/RYtE5OBZR?=
 =?us-ascii?Q?Dl60UUtRo4tPypduTPeyy770r7xj33DNMlsojMgwybR++ciI6W23Gcj/Gau8?=
 =?us-ascii?Q?uD/DoCDgL40tsr+gexfJszjTGAJhhvnxD4zLrdfsS6405SRv+MLI0f1yeZ1f?=
 =?us-ascii?Q?AdPYJ6nJjv+VaJMirCEC1tdePxCPowUix2s6Q0ud4TQ5CIzwGyzE9bPZkqLu?=
 =?us-ascii?Q?wjiDyf5QqcItIdljFWip8e3O3FaViRNsxWVtyorGCWHmagEZsfkZbPBj9oCZ?=
 =?us-ascii?Q?X4SS7d2FonByqI9QjO3qw6uOhwnIqb0pFvq8YLFx/2Gh7329LChxVxAe6Foo?=
 =?us-ascii?Q?+/4fUvDe1IXBHqihga3y9Rswdafh+biLMQZSSU/n5daFC9uDaF1oXzSyOc4X?=
 =?us-ascii?Q?Uqxj95WDq6EDaX1Eg1DGKHLrIs8i8fJwT3ofqpjRhLdBeA9pnZLzUJmvAF/E?=
 =?us-ascii?Q?ax8PX4mbsUUUM4wifre45ylnhLfKAQvBV4iXz5Vl91+/wqqYY7kvMYr4+hLp?=
 =?us-ascii?Q?JtTN9B1nypJFG17OQLN6muXq+RndAOEI/kcc0orQGdQ/0JsKFyQk+aR8HBZu?=
 =?us-ascii?Q?UNJO5lft2rmrXXUhGcM80HgkXPLgAPlS8nhf8VGI8U651v4L5axMbgcahGD7?=
 =?us-ascii?Q?6q0B+TcaEo8gd7lBWAoyGgDGbKK0oUO52Y3cO79emfXTPtYM6fP+9uGEdFIU?=
 =?us-ascii?Q?ELrFDWInFf4/fj9gi0w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ada5663-18c9-4bd5-2f1f-08dcf4b3fe4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 05:15:08.2209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f8lyiwlRuNu41YEYMcvW60/84kWIyxDLp0kxyaBZWchVWT5sBNadO6lwekdGMXt6sykCpXvKWNTScEsMs+Cemg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8475
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

> On Thu, Oct 24, 2024 at 05:23:22PM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> The execution on GPU is out of order, the completion of the last
>> submission doesn't mean all the jobs are completed. We need to make
>> sure all the jobs are completed before moving on to unbinding the
>> buffer, otherwise the test would run into CAT errors.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>  tests/intel/xe_exec_fault_mode.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_exec_fault_mode.c
>> b/tests/intel/xe_exec_fault_mode.c
>> index 9cc51b7d3..d416c773b 100644
>> --- a/tests/intel/xe_exec_fault_mode.c
>> +++ b/tests/intel/xe_exec_fault_mode.c
>> @@ -305,7 +305,15 @@ test_exec(int fd, struct drm_xe_engine_class_instan=
ce *eci,
>>              }
>>      }
>>      if (!(flags & INVALID_FAULT)) {
>> -            j =3D flags & INVALIDATE ? n_execs - 1 : 0;
>> +            /*
>> +             * For !RACE cases xe_wait_ufence has already been called i=
n above
>> +             * for-loop, we should only wait for the completion of the =
last
>> +             * submission here. For RACE cases we need to wait for all =
submissions
>> +             * to complete because the GuC scheduling can be out of ord=
er, the
>> +             * completion of the last submission doesn't mean all submi=
ssion are
>> +             * completed.
>> +             */
>> +            j =3D (flags & INVALIDATE && !(flags & RACE)) ? n_execs - 1=
 : 0;
>
> This makes sense and xe_exec_threads has similar code to this in function=
 test_compute_mode() and given that is threaded test much more likely to hi=
t this race.
>
> I checked xe_exec_compute_mode and I believe we need a similar patch for =
that test too. While you are here can you fixup that test too?

Sure, I will give it a shot. The code looks a bit different, and there is
a 1 second sleep after the submissions, I guess that's probably why we are
not seeing a problem yet, escpecially on real hardware where 1 second is
sufficient for all submissions to complete.

> This patch LGTM though, with that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Could you help merge this patch too? I don't have merge right.

>>
>>              for (i =3D j; i < n_execs; i++) {
>>                      int64_t timeout =3D NSEC_PER_SEC;
>> --
>> 2.25.1
>>
