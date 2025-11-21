Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A124CFA46E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC6B10E058;
	Fri, 21 Nov 2025 05:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/brRHr9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A4B10E058
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763701494; x=1795237494;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nBT6Eh82aWq2VGZu92v4pqeyNcLjm4fyMmM2zB15rUE=;
 b=U/brRHr9lIKe1dWtAu/Xd9yHQp0XcCLZW2GOQTZ/lOlqUI1jMwpo4/S2
 OuecK3yuTh6Y+gJGzU+jYpKfeBm22WJzRNYSzK7Ag/itIrte80XVWN9pS
 fsvG/+krYUx8NTlkJdRiFkKra4qqHsMJFOkkUxg+5FMuZzgXMV7TRhP3A
 wCvGbbaoAQranJsHIr/g99YMzh5mD95+oY5cnE6880jj9BL3Szva7d+tQ
 PeqKmtoKUgbPMuB7cWCCP44anYKIR+pIc5kwaJH0oVbZjy7/g8ZC2XlzA
 UIbV0jFBeZW5lpq19yXAawV36qRXOaBgF64P0mhRIkmM63MneoYkyMuyP A==;
X-CSE-ConnectionGUID: yi+Q1Qe+Q0OYfnHOaKRYsw==
X-CSE-MsgGUID: M87IJLukTK2j8ldX+x/QHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69656197"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="69656197"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:04:53 -0800
X-CSE-ConnectionGUID: z6MXm6SRSLu0x4npVOCkbw==
X-CSE-MsgGUID: ACqK8xEhTMyvAxFz6+AkUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="196064703"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:04:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 21:04:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 21:04:41 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 21:04:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZsQhnT1PDTwzId5peCiGK14pcWTNdQOsYAqQDsBXRBYJEaVZ1aKvU3dXYvK/332W/btnngO1gnivVRuayHXWMqCV+JMoT9WgFToF+XHDx+tE1G197PdCchjR85PjgIyJ8ybRjxPGMS1gK2N+z/DVbYOF5s3eL3QkffsVhpPlh7HIruyrZhEfjsqk4R2EOs1l5Xgv8pgWzR9oKHUjifKD9MtpWkmL0G+B4Gvm0NwBQGqu8fflrUQDZH2VnplhOL0fNrxJ+i91HKlPhs+fR12qFC3RNamHVWM8F49/l6si6aKynencf8ZBUZpGMS+GOm7HAb7KBFkgAGKx9ATvr7g7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTg2JIr/WUM5kp5yC78afc2DzPc8msdWYqzi3lCeoVE=;
 b=gg4YaQg3QzEn4YDA3OHhClVQJKZapkj4bEJmmCGgOkrC6OZtqqCfsqMW1M5FlHvmAVO70RQZE7p07HK4lTr7FQCFZCR3Hq2qLCeFtclksCmiXV7h1JA7q1k8KNox5c1y4ZgdleqRdvcvqBfJ3A44NYjgjaqSJ5/2h7tBqbGVWDhr54IE6vbwpsGa0vHGg7iPU8eLFv1hB7dMcmW6+d7qy6vntReWeCPZUdIyJKO7ERxp4U1GLyslJxXab9asRHqQ4d8K2iFGVPRiDNuxl1+hID5ugIwoonXA++9RLMP1Q+urPHGvCemJ0XtxVboHy6fdmK0cMaKHEKugX7HThofqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by PH3PPF018EB8BEC.namprd11.prod.outlook.com (2603:10b6:518:1::d04)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 05:04:29 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48%7]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 05:04:29 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v2 12/19] tests/intel/xe_exec_multi_queue: Add fault mode
 test
Thread-Topic: [PATCH v2 12/19] tests/intel/xe_exec_multi_queue: Add fault mode
 test
Thread-Index: AQHcWpsCAdzjPsFpxUaysJ2yDi8AiLT8kWew
Date: Fri, 21 Nov 2025 05:04:29 +0000
Message-ID: <SN7PR11MB7489E4B8AF02FB7DC17746A285D5A@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-33-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-33-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|PH3PPF018EB8BEC:EE_
x-ms-office365-filtering-correlation-id: dac1ab67-e1dc-4eb9-eb62-08de28bb734f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?b4Amg5I4xH2XQ6Pkz5IqpQPcY0yhnFjLQpJ+U/HpuwlbEN0gaNu7mBIq/tOI?=
 =?us-ascii?Q?EVbzFE0wknDOW0JdRRW+lzN6h9c6EaPYp6zTSaHxQVSd0WAhnQOYIoJtzjLi?=
 =?us-ascii?Q?vCQSapV1Ua+jkGq5lscNlFlrHwWrzvtpbPqeX5Piop0PGZsrW8EnbeHiJuB+?=
 =?us-ascii?Q?1wcANGLNU0a5xUWDI1MgHUdcA3p5xkmaVIgPJthkiQmCTqwyJrtcNxiFZVwe?=
 =?us-ascii?Q?v/CnEfda/qvrK1+90pt5hIvSoTYjMtMQ6QbLO2ijQQ7Qcf8YJwxjBKhyimzK?=
 =?us-ascii?Q?p0vMjFydlkZwAhcIP24LXnGI2yxYvdFFnB9xvNC0gE5nrhBMFS6nbyjpH62Z?=
 =?us-ascii?Q?N9ozpKtGpuY337MKHHh0rDd+ihodKKwXdveirH2qF4ReEkJDJeMdXzhcosHo?=
 =?us-ascii?Q?saCcTvtAUuFjwCrMGRg/FZ1ymafluh7ug2yJCheozpVz8PlmGppDX+zPYq7H?=
 =?us-ascii?Q?dtttjL/7eBUWwhEzrzTsCoTrNLn3JcUWcBIOv/d72OWaIwhgG2JN91joeHUF?=
 =?us-ascii?Q?c+8c1ZuIBNQW9MmNtznC2qbcP7vE9bJr/IHcvEpIG4GqPSWxUKBlLXJa5U2U?=
 =?us-ascii?Q?0x/HZIVPLz5/FjmLmh54k/WI7TWWzNmu55UVJFEZA1EACiu4dmkXYa9laXnY?=
 =?us-ascii?Q?fKdQ0tHvE71iIzeTdXOG9ZjG5RrP8UbHfsKWTittMDpVICU6416k710VhUZa?=
 =?us-ascii?Q?z7Z4vIyX7aDb2HNooXi3sWZU3MbUavZYY4kxMsB9mmbamdEZ8bEOsWgM1qYz?=
 =?us-ascii?Q?iPjiBL5UJkgvZC1hETTb4yGTphj9h8FpvwmO8pph4eRtnzo7qDQq6H34cRYl?=
 =?us-ascii?Q?uMkoo04G9vjkO3j0ekZrh20cQWR8nElcd9c7S85w1eObvQK1g7QuUrOq5qQY?=
 =?us-ascii?Q?Rba/3ve0U35CpcHVLV3Es8pFIlZweM8tGso9/a0jPL5Sr24busg4GvOlSvkp?=
 =?us-ascii?Q?YbEmWdIx9F1UA/VT3/43OY/MRDpthf0PRz1//FMu7xnfFF1XeiOA+GGsVgLH?=
 =?us-ascii?Q?l3JpWYQVZ2+q8YxDTUH67Zwda76A9YALrNoX6W3rrX50mSGuQb4spUqcFke0?=
 =?us-ascii?Q?e4ETqLfYbI9Q825biHMkBSfCK9fR4rzaRjwiz/NvsToNHTi3ueJqNnMZ7Cdm?=
 =?us-ascii?Q?Qo+D6dGvRyeN5VCjSdk4DDb4wRD5/uPvpMPuxNroks0pxOg8Ra0A6Zc15iCc?=
 =?us-ascii?Q?giI2gGHia5CJD4xvwDdH3i87a1CPfhRHcxEtF539Oxz8tbgT1MMPJP/Mp2In?=
 =?us-ascii?Q?SAed/TtxPZbRoE6Oq0KeTpctJqIVM5QP7b7UafiPSVg2Wu3Ord5NsX+L6S4K?=
 =?us-ascii?Q?QARJsf7WJ6yeIBeftt3XqEOiNZnig51gnGsUlovQW7cVvPMZ0l4KycxJDWrz?=
 =?us-ascii?Q?E4Iah+VjGrDsvuDzTrN+lD0aE/L3MxivPKvFVKX87z6Pi55RSl8hQK3etnBH?=
 =?us-ascii?Q?mO5FVHMP/8RTIA0PpLlRTFLSF70I/v8S1V28Kt6zY3Icm4qNd2NuPxYziKfK?=
 =?us-ascii?Q?MoFm5SfevS6fL2TP/iXRh2IjQYuOSmzbMHeE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OiDo/K/Z6MEsHtNU/U8qiviH1wQBJMXoIMgiPAs5m5wQZUYNDV8qA1tXbE6E?=
 =?us-ascii?Q?pKceuJkhuKtI6/oqbC7yxjA0e0UUAKX01vxITAg+zHgjGiKxqHTOJ5QMKaFo?=
 =?us-ascii?Q?0mHp2/hbSApNW3dyMc74k8HS3nlwsi+GzO6APG7UoBdLHudeVlQaYzP9wMPy?=
 =?us-ascii?Q?17wQHOBbver0snBucQKlx0xJXSOT9js+9s7L8zg6HlUpF1fjEPZu1XoKpK27?=
 =?us-ascii?Q?mG/+Ak4xCAm90LI4bSYDzq4kEa3xdX9W5NnYk6p3Hu/rLgEvDmFylS5W6wRJ?=
 =?us-ascii?Q?Q+j9KA1eRgVs20Ap2Pq1+Ed6fVEcgF2EUufwtHeqXxLAWPmtp0HBIRCVpypa?=
 =?us-ascii?Q?IsXyKmZp7acIHotYuB0lmkTBOy5Why7Q6SDEijSKfSw6rVGKIfxPa+Br2IIj?=
 =?us-ascii?Q?ZGz5RQpM2y1fSBoGi5nQt7T5TMdSzWz6/SQvHhQqDE9RSb9AheirQLLpV/ux?=
 =?us-ascii?Q?QomjM6csFRBy0XefGHmYfpKCX+TPA4bgNaCtKGyINtBDPIOY+jgTDiMayjlR?=
 =?us-ascii?Q?3Im3yP+vq5OcnIYqzsj+oEocnbTT0VTwfKYqUsTHtioPs3xHYzVaU9n9DIaf?=
 =?us-ascii?Q?HTUJli4z/SqDU50bwwfEq8xzyoWF+V12P62WMbnQqTp16BGHmh91zSyrgxw4?=
 =?us-ascii?Q?thPG3IzNdFJfrD7BcZUhSHdN03KE9uG4Osnvh06oyr1Yfq7XdrB/f+Gq6ZsG?=
 =?us-ascii?Q?jWGAEGNdOIAXUPSZncEWSmrmpBV4unNKX9oHMbSC1RZK1eTJFjZA1gkwRta8?=
 =?us-ascii?Q?nA4amzs3qdZz2lq6YzPmLSOXt9/qN5DEuoqjgdEye0bHc3CIODg3wvhd2ZIM?=
 =?us-ascii?Q?Ki5oaSX7Q5idMVdxdGxw1lnllZlwmL5jgXPlNP3+1SY/LLfusdtebeGpIyEZ?=
 =?us-ascii?Q?HVXGCuZnGIZQmthksdZXWCIi2iau3He80M4zFr/kbBIPyjmm2idWzV/1hmO5?=
 =?us-ascii?Q?9PNvtJSVyvE1pdHcCdzHAgeOj2vo3+US7vWyzUEnuotAIA1Tq1JQqaYjALo5?=
 =?us-ascii?Q?5uUXyWJKdPa5uWFbvwuieYJ7OyYcrVwSNqdKrovGQXVypjYoGfLtLFIW1XSH?=
 =?us-ascii?Q?MDq/VDc/HlYiuJAl5/oU2yVlXm1wcowl5M9bhq7W1GNKkA0XzO5FMXDV5UHa?=
 =?us-ascii?Q?mWXswajBy0UzT0rU4DB1FJTxG+W42+yT8N6Y3k0NEMHaDjdZYEEgJ87kjPh7?=
 =?us-ascii?Q?5H4fwd5ctCBSu8ZqqP6IjrK4CxA6jEeuzCUqstrYvYdHtLxAk8eParf8liBR?=
 =?us-ascii?Q?bgWuq+Oa+9c8bF1hTEFkCRFqThGD3P8k9RMjSvwHf/4u/0K15iG0UBarbljx?=
 =?us-ascii?Q?SaJ1ac5WiQyEld/GGtKdwPq//Cyw/Mf9Y4nnkH7ya2quR7ORie0CiMZIB86Q?=
 =?us-ascii?Q?D71OevjrExEHz4XhHCwz9r1ul7ALl37dZvj/Y3YoXgY79urWIUCYnaCj3ROs?=
 =?us-ascii?Q?x5/siwnWtN+ftWM3Rgno7NJ1WFzTI5x5c+wmmbWAjlCSxL7rIrL/hvSM9RJ9?=
 =?us-ascii?Q?MdBk3jKXoP8bq+MP0aFWnMNKGyCOk9yXEPWLsXOn/X4YR24El3dbC9HFmpIa?=
 =?us-ascii?Q?URXPHF1e8s6G9ZgiLWX+NzmDsigXH0PogY2jvUHCPvKO9MK29GoeqsfSGWcC?=
 =?us-ascii?Q?cSaGLMjL9wfepW9BHggK4IJ40/guApHTxxS6Xv7sagMF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac1ab67-e1dc-4eb9-eb62-08de28bb734f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 05:04:29.1381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcBGFyzylYnL1SqqCLSth8utOmo597+bqENQ9ADTs4hT4qGuxqQkH6W1Cx/5/NlxWKN7G6OQpK7fWG7//XZQ++pELaZv21tVT4bdVArbt58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF018EB8BEC
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: 21 November 2025 09:27
> To: igt-dev@lists.freedesktop.org
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH v2 12/19] tests/intel/xe_exec_multi_queue: Add fault mode
> test
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> Test multiq functionality with fault mode. Adding a flag check for
> xe_vm_create for fault mode test cases.
>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
Looks good to me
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

> ---
>  tests/intel/xe_exec_multi_queue.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index aa86f8a38..da8117d57 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -31,6 +31,7 @@
>  #define PREEMPT_MODE		(0x1 << 3)
>  #define DYN_PRIORITY		(0x1 << 4)
>  #define INVALIDATE		(0x1 << 5)
> +#define FAULT_MODE		(0x1 << 6)
>=20
>  #define MAX_INSTANCE 9
>=20
> @@ -244,7 +245,12 @@ test_preempt_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_plac
>  		fd =3D drm_open_driver(DRIVER_XE);
>=20
>  	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	if (flags & FAULT_MODE)
> +		vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> 0);
> +	else
> +		vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +
>  	bo_size =3D xe_bb_size(fd, sizeof(*data) * n_execs);
>=20
>  	if (flags & USERPTR) {
> @@ -583,6 +589,12 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>   * @preempt-mode-priority:			preempt-mode priority
>   * @preempt-mode-close-fd:			preempt-mode close fd
> without destroying exec queues
>   * @preempt-mode-dyn-priority:			preempt-mode
> dynamic priority
> + * @preempt-mode-fault-basic:			preempt-mode-fault-
> mode basic
> + * @preempt-mode-fault-userptr:			preempt-mode-fault-
> mode userptr
> + * @preempt-mode-fault-userptr-invalidate:	preempt-mode-fault-mode
> userptr invalidate
> + * @preempt-mode-fault-priority:		preempt-mode-fault-mode
> priority
> + * @preempt-mode-fault-close-fd:		preempt-mode-fault-mode
> close fd
> + * @preempt-mode-fault-dyn-priority:		preempt-mode-fault-mode
> dynamic priority
>   */
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement, @@ -637,6 +649,13 @@ igt_main
>  		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
>  		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
>  		{ "preempt-mode-dyn-priority", PREEMPT_MODE |
> DYN_PRIORITY },
> +		{ "preempt-mode-fault-basic", PREEMPT_MODE |
> FAULT_MODE },
> +		{ "preempt-mode-fault-userptr", PREEMPT_MODE |
> FAULT_MODE | USERPTR },
> +		{ "preempt-mode-fault-userptr-invalidate", PREEMPT_MODE
> | FAULT_MODE |
> +			USERPTR | INVALIDATE },
> +		{ "preempt-mode-fault-priority", PREEMPT_MODE |
> FAULT_MODE | PRIORITY },
> +		{ "preempt-mode-fault-close-fd", PREEMPT_MODE |
> FAULT_MODE | CLOSE_FD },
> +		{ "preempt-mode-fault-dyn-priority", PREEMPT_MODE |
> FAULT_MODE |
> +DYN_PRIORITY },
>  		{ NULL },
>  	};
>  	int fd, gt, class;
> --
> 2.43.0

