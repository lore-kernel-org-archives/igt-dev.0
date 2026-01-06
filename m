Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3412CCD043F
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 06:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDFC10E480;
	Tue,  6 Jan 2026 06:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+5MhtzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334DD10E480
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767681021; x=1799217021;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KZslZ9UuRNFW1E/b24RniqK6L3TFAkqyCxBu3bWIUMk=;
 b=f+5MhtzHRABNLnwcRIqEdPH9Kdss71srQQ6ZMbwNv+1OIEYb7wbUQimp
 ynrHJZqE1Axvpyw0odp3mV4WfV8sEITaogFlgd4ZwW9+J/gbT/hyvgEIu
 4Jq2SFxed2DZvld5RS5bVBbim8pC22+fQhhB1MA4Ky5h9kWpq2KxIqkMa
 Z1B/jW7RujqjeZaRweAPBOF5My0LsfQATTI7nRwLCU6/YF8dJwuh8vJyR
 xUrqe8vrbYwJx23vcrd5U8Km7SWDPoKsKxvfv952qY7dhvdNcHLXyLdRA
 bNDnPyQqCcQOxqY4XE30ehEOtytrueqh0aPJauGAyAEU4X9/x1Jv29kr+ w==;
X-CSE-ConnectionGUID: cedF1hz+SAKi6Q4kyBaFzA==
X-CSE-MsgGUID: qbxC1OHkRwKJvSd9rVP6Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="94516189"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="94516189"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 22:30:20 -0800
X-CSE-ConnectionGUID: qR2l2ZAuQ/WMNk1NW9H0aw==
X-CSE-MsgGUID: PghZyx3UTd2i9H1k05N26w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207460170"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 22:30:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 22:30:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 22:30:20 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 22:30:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaYbfKIJ/KGsfFIUkLMMIE5gvrKi/SxxE8H9Wzj5c23oUCcoE5w+TDZUqEyJuj2pjgpKJB1brgL+cpnJRqn5xOKCyUbpcj2oPspIPsegSdWvrygAZpjtXykV3UFDZpHZ7/F+5goPnBl57lRh8E5GDuh9ZoJOWxk6Joapv8H39b8VKkV7M7LEydl2LKe46ZOHKNfStS1X2gcKUnrdmbra+jj4O4W6gn2FGHh4JS87urWfjcc0YMwfll7PtjbU2joQWhYyoCdafzLKvGCLj9uRs+2rOAN05fG3Z0j7DIEv30XyN6Paby3bSbz2+T5lljdFmgQAC1YsuqtXitWCWQhkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDMXblMf3Cwh0p4ijl6SPzNYLLVUZAk/elweTc6t+uo=;
 b=N2CWtGk6Q/K9BMkCyf6gCb4Sc/wrihi4SIakkRfCna4dSMo4OkIULwVVM4MeZpYuREeT6ZxPNUABJ5vTyOfxKgZdt3trMTlQpJV/oDOXBd0HQl4R6RQJjvazmMCyr4ZqNJMvpMg9CxkNbBT5uolqRDANE2AIrM5D0jLFXjrmxBh9yVTYu/zff4zuKYTY0eQ+pnYKBBkGeq5hXOlu39SYZU8YxYvzLnFfVl2dWQa7Ac8GPkUo72XJSnS6x7nJediobxdBOK7p/Z/gW+xsKL3M/BNBWaIFswzJCfv9rGk4t9azpxAz8UCIK7XsFhezbmec4a5R7Bea7G0kEyaFKRGimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by SJ0PR11MB6815.namprd11.prod.outlook.com (2603:10b6:a03:484::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 06:30:15 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::112f:20be:82b3:8563]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::112f:20be:82b3:8563%5]) with mapi id 15.20.9456.013; Tue, 6 Jan 2026
 06:30:15 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Girotra,
 Himanshu" <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_multigpu_svm: Add test documentation
 for Mega MultiGPU feature
Thread-Topic: [PATCH i-g-t] tests/intel/xe_multigpu_svm: Add test
 documentation for Mega MultiGPU feature
Thread-Index: AQHcftLxC3xXPPl65UK4K6eu1UPGjbVErgyg
Date: Tue, 6 Jan 2026 06:30:15 +0000
Message-ID: <IA3PR11MB9013BCC5275470F672143DAB8587A@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20260106060846.353980-1-nishit.sharma@intel.com>
In-Reply-To: <20260106060846.353980-1-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|SJ0PR11MB6815:EE_
x-ms-office365-filtering-correlation-id: d80856b8-6fe1-461f-14a0-08de4ced0dc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?duc5UfaSUo+LwpeZKS9ZBNehTB7rMZK+zwZK8txMFh52EIV8+8mynza+JHw3?=
 =?us-ascii?Q?XK1pmw/kqrrxB2ZyFUAstzdO0sghpvLqa8EAl1wfwykpNFmTU9mWzhFsdQsd?=
 =?us-ascii?Q?uUZDTvyz8irm9MBSg8xR5GkPfegMwszXUR3MhjxnT5rmfkvK++x58xzqldd9?=
 =?us-ascii?Q?lpWqM+ooT4793oopoHrfh/CQsHLCGNFNsBZXGqkd129vkYS2yIWO55bGrjMz?=
 =?us-ascii?Q?4zZIuAY+MXgiE05v1B0ggwiFNjKv1cQfaZGMTUl85x22sYfr7beQhj9Vpnz9?=
 =?us-ascii?Q?OjvjkkEQ+q3UXGTVxmjuL4uuwJkW7TMllDntfPJPI1ywj2jeLk6yWvfFEz/R?=
 =?us-ascii?Q?TFGW03b3w4bITwA2NMILSallwy37f3aDlpa7WDV0tBmJ3wO2pPPizaXYAV6G?=
 =?us-ascii?Q?KFNrAwA4Bw6Hklp1t5KexlSmRIdnBZrxXhthLR+8DTI6hPHkhI23pYPd6L8d?=
 =?us-ascii?Q?iqNVwUhdlPahrDB8BiUZvGCFEa44Zaaaqo3WV1eCG9KHjn/IUvbZGpj/ykym?=
 =?us-ascii?Q?wrCsjXL/0Gc1NKFqI7Ewoq+rTgYNmFici7yQ4hznRDZdOvELMs0iMBDB8jhE?=
 =?us-ascii?Q?GtpvvsThhFTVe4IloKjNe4Khe1y/mT+DdQFJ9xAVegbijnA3YahWjFJeoeDs?=
 =?us-ascii?Q?vqwaNamFBblrHKlu6orl7t+/yiYuFT4QtfqS4EloTGhRVv603Z9HQ18Q171L?=
 =?us-ascii?Q?Yw2nbaMNYCRyYiglZWBgAH8odeU0/YJxJK3RDGhx2S7EY1d+kWTT1LfMsFvi?=
 =?us-ascii?Q?KzizVYi2lSmgTmrNzyIE4of9YH7jPOGAB7GYf4TFeTQbxtKV4owqmdM9QweG?=
 =?us-ascii?Q?yhceVlwSoboEuD1qcGfOHP6rgRLCjjgoduqE1Ch+JOOQZgz+aHd4oUeztR7V?=
 =?us-ascii?Q?KZnDrpx+b77unWoSkHETSMBBCq9FgrhVj0r3EUaYy8TzrXxnyk6YTMw/atYq?=
 =?us-ascii?Q?oK0Huju9hchqq3Nfrss67J0dZrnI3pRTkG4FTknRgKPG13O8UuKUlXvLr5ep?=
 =?us-ascii?Q?iAbVNCLsGSxanqHOMSKzTbDinjXVTPERkF5jfp8LcOgwg7rIXCbNxvhhvLYH?=
 =?us-ascii?Q?e4vjjg3AZOV5jEfh0adKryiaE3ghc0TerCjjjA0cxywH61mnWDuu94MC3gs9?=
 =?us-ascii?Q?MjvbA3nHnUzLS8KC3UpIQkzAfM8nawdUid1QHLfSJmyDA5FYKfVr9O09u9IM?=
 =?us-ascii?Q?yi3b7OqvZFkO1+7nr5Bus96Z/DOa4W3F1kOaib29K5cjEt96Ns2Hsf/jIdMB?=
 =?us-ascii?Q?n6GVkDQipp0R8M0C6Jrb4DQ62HdWk/FUaPH2Bm3Cp0Z+iMitSXOSroVDh4/l?=
 =?us-ascii?Q?mNFzAf+i5HKvB4p0As43OHqVq2LndDgFKffhGi1r9EZflS4Jqu1m0Y54m6MX?=
 =?us-ascii?Q?KnEckg1jSG7LtPLCjPTNwC+K0nVDNNP9i220l1hpWqATmVq9B0mWjDB/GrVS?=
 =?us-ascii?Q?yZlMCIuUMJ6wVk7cHsFGoWxD6jAPIKzHhtDGYcCy1erq0GEcRdD3TfgxPCVb?=
 =?us-ascii?Q?F9D4tI631qME+WqVzmmeCcQC9D3WDwqpTWE6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fQeY1UQBsVh+OIQ9NeEFHKLZYxIDrfQT+DQqG8XF1Wj957BQKmyVl5r0pVPj?=
 =?us-ascii?Q?FH/McN3zrEjAqChDIWylm6i4LefFwwxiXQezrZvVvid8rHFdXUzc9OjxDukj?=
 =?us-ascii?Q?KAUCaYr1FnPJV0Z0uEHEALtnXUX5are/JInU+cXC/a9hMXuQhJ874iFI/VCg?=
 =?us-ascii?Q?p1h11Baiewel5PIrCzIJI30RveU2xNh0/EeL6IRATGEPOU4j/0/w01Yf3ozi?=
 =?us-ascii?Q?Nnn0Zk36SLdIKm2QEN59vGXSQQo8hNjoYcux3vuh3KPPFPJ3Dpy6Js8MQfNi?=
 =?us-ascii?Q?CJTMWXfjLA7OMabFRxh6VM0tV+w6TyCQtFmEXahWI5qanUQZgBTDtpNBFUo9?=
 =?us-ascii?Q?2dJE0GFDRr3C2vYRvHlu6vXiMNnWU5+wLNbZ86yi2UsVlof3New2FkNKaLG0?=
 =?us-ascii?Q?Pjz0ysikDwVXciPLbwcpWXiq2sb5HNUktLchCcrdSvAQ5QHI7CCoxJ68eXF2?=
 =?us-ascii?Q?jU+qbFlH3x80rtaXsEqhVfCZReamV8YVOjeT3lJhYr4jkf7FiWx7sJ8dOMPn?=
 =?us-ascii?Q?X9cdv5TyqGrqeetIGw3qcOpZ5qVODT66W+kDbx2AZ2xXbAFyiQeigN8kMbe6?=
 =?us-ascii?Q?GYlSRk3eSxObfifVmcDBiNOGmjf0VluoaW2cPyuViM8okhks7CJWmz+kJDkq?=
 =?us-ascii?Q?fZlVxRX/Qm3a3pBveg322b4lUoy8DSfOdowrBuNuB+quku+VN5gDH2m+xuQ7?=
 =?us-ascii?Q?LZS9ZogPmNGHtD+ZSFHlECXK3eZQJgvndMq3U6qfugsVmZQPQONnsf99y0k/?=
 =?us-ascii?Q?J+WhX7m8fwSL9hI8ZnTiEPWxiVT/5FjrvxupdWWnNNKqRNRy8bVGFwtuKpII?=
 =?us-ascii?Q?vsbA39k9p84KyJHcEE/w58rUIswiqRyloBbnPmjWxUbkJNi4vpo/sPQmQyuK?=
 =?us-ascii?Q?SKNvM8wLeEZ5o39ReNJwyDSsSONwJoNZaqH0+A7a4sKpGcrINDQ27NSRuV86?=
 =?us-ascii?Q?Ez1feW8Btkc0n1lF7/qu2CIoVlvS+NonsFyWjBdxh+XQdzhUnpWS4H1q/kta?=
 =?us-ascii?Q?cX0azVn4UOLCh5cZC7oXjkJqBJncT7GCemz5UkvJ848EhjOvME8BF/3+O3qd?=
 =?us-ascii?Q?Q73kP5cVDom6mOnXyWocz1BQtVU7w7S7sScMkJGwnKn/IhlcgN1mmwbn8gLe?=
 =?us-ascii?Q?BiIYVUjg/d0fsxzSRwMAzDniT4iBT4Fn/Q8eJwBQ0UucoCVlukYMSgh2VCef?=
 =?us-ascii?Q?QjN77hEVk9YjA8MIbThWs+zHRsRRGx9INY0HU5YiUgXxEvIrA6Lz8bSW8BVK?=
 =?us-ascii?Q?j5fqUmsGds7XLHU7U5tbMoYpaC43eZwM4flDR59XinqafFKJCQAOhDo/cFT6?=
 =?us-ascii?Q?HKXWl6rwfN7OBDr3MMa8tP3UOT2gZ96JniNPwu2u3E0N4Tw/qa3lPM66o8PK?=
 =?us-ascii?Q?CcZauFTp0OyVUCzQvYQh5n0cOxC/wdy7iJN7ScF2mjAEbkVmI2otmRoKEoQ0?=
 =?us-ascii?Q?QzHS6y4D8DJJBgN6QsbIr56WRZ20oyzuFs3K1mSkeNe5HOXQK+X/6l4EjVHm?=
 =?us-ascii?Q?IjMrPLaOefj+OCQn85ULY3nNW7699AMw1I2SZjoADbB0zibJEUiZXYlRWzFK?=
 =?us-ascii?Q?nPVn4DKiJUxfh0Er7UAvKfEdMrxCs4nQyV0sbxp5T0ZfQVwqiB8w5kHDBTCr?=
 =?us-ascii?Q?RDwlgggj3K27ItuwWZSv6Dpj7qabG/Yvq5+EAbQFQ4DVxgTlGkIJu6RCc9py?=
 =?us-ascii?Q?1KP96KCo63etsMzfNdv96r0rvT32WKgOvmMijGOD8MCrQZ6Z7bNRcKlFocWM?=
 =?us-ascii?Q?+9IuB/KVLQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80856b8-6fe1-461f-14a0-08de4ced0dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 06:30:15.4885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlsJitXC4hC/yoZVOuXfwtEl4c+nUTISjcXMJNMW7pIFrCgI6Be8of8nYfLK8V2MaYYcsh1j1TiMVmktzv63/JTdr6hjkpCNqAT6y3Mpr0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6815
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

LGTM
Reviewed-by: Gandi Ramadevi<ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Tuesday, January 6, 2026 11:39 AM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_multigpu_svm: Add test documentatio=
n
> for Mega MultiGPU feature
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This commit updates the test documentation for the xe_multigpu_svm test t=
o
> clarify its requirements and ensure proper tracking under the Mega
> MultiGPU feature. The documentation fix helps users and automated
> systems correctly associate test results with the MultiGPU feature, impro=
ving
> test coverage visibility and reporting accuracy.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multigpu_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.=
c
> index fee738035..4766ad7fb 100644
> --- a/tests/intel/xe_multigpu_svm.c
> +++ b/tests/intel/xe_multigpu_svm.c
> @@ -27,7 +27,7 @@
>   *		including cross-GPU access, atomic operations, coherency
>   *
>   * Category: Multi-GPU
> - * Mega feature: SVM, GPU virtualization
> + * Mega feature: MultiGPU
>   * Sub-category: SVM, memory management, performance
>   * Functionality: Multi-GPU SVM, migration, coherency, atomic ops
>   * Test category: functional, performance, stress
> --
> 2.48.1

