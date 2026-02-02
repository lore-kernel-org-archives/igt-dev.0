Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82E5E7314F
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 09:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6679E10E3D1;
	Mon,  2 Feb 2026 09:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y35+cUkM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1AE10E3D1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 09:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770024218; x=1801560218;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5+Pb3lcbH2rLpy149HmRFEb+uoiKR9KMhcB76y3ZT5A=;
 b=Y35+cUkMoZ8vkOTR13pC8Dle7pag91XIewTmlzuRXu2ERlqW0D2eDJL/
 3OE2y3jJs3LSrhIhIjEVMaTjicRU6GtpWxHx05I2N5Vbis2FPVBJrfq3w
 nJM0y8PPiZa2ZU8HCZU4Zwn32XzNSGPzQjpokQJlXsSXC9s1HP/XLvUQw
 cTDIf7OANIOqzrRSa1ycy//jhP4G8F6eJkPDrD879sg+rL21MvbCTNxjb
 +nu31oiaoh5s2hWFy/Es3KLlmTgwLXyR1LSLnCV7D07pI56wJvMH4LOY9
 tkmN2qeT1C5nEBtpaankszYW9K9HghH/2U6aA/p0B0BNc8gultMzRRd2n A==;
X-CSE-ConnectionGUID: TqpJEQ7jTGGXBf5clqU+Fw==
X-CSE-MsgGUID: x//uYjIoRiG8QMJBUVgrpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82604159"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="82604159"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:23:37 -0800
X-CSE-ConnectionGUID: LydETBrvTK2JhM95eTL3Cw==
X-CSE-MsgGUID: mQGjYfRsQQ+Yl/3XU34H7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="208571433"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:23:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:23:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 01:23:37 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:23:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpMi6bqcJl1r5VQu2hiho0dd3Hby8/wS7LHDQtLWoFXSEEaYx77fHZPawHsLlwjuvF+snIpAALkKLs9P8HDKHwFfm6V8dW2wq7LsxwNjrEIPAYfLd7nr5keLkgiuLH63Rvmn8yzPj/S+y1bKVLMw76VdwuiJ5qM6x7eWwKMQjcyTvRGCKnmkcRhKJQNzgjbg0EVzhfz4GfqqhBBMOKEzWelBqa87um0cZydRbwkkWcU8CvfotTuNclitK4oSshzp7mFft0woPDX5jPevaIKC8taM12SjJAgQcw0Ye9f2x0bxVadAbYu7NOz8L4mXJCqx8G4H0TV9bAR74ag/fQJ0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1FAkWKp1/5VsgkB77/w7imETEGSJR77KOe5xkpRvrQ=;
 b=yUnN4mXgUdo83np/KksSe7kKiwolddPCR8H33Yclzlg3O34VTLauo/KPnr71HP29lSb1Da5C/z/Yz6nC5NE8DVTBJ4iMb0WiEQ4iqfI8+87qNtXgzg/mGNaoSCNjXSOty3znnHq9HbLuUhc0t/1A0vvpiGBiI4CF6QralrTiF4X/cddjEvyWqUdKslciHZXRm9V1UScq4X/AieRzhnkr4oFhtfDhQHuAwCKEaxlWis/XN0ixhHeyIs51pJ/Q+BmXOmvmV/obH2anAVwsevU1pljc1Lmuyno37sweeyDri6SDe23HYiUJvHxk1lD88Ig1nd/GEEgslxepekOZqmUsJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 09:23:33 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:23:33 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 2/2] intel-ci: Add linear-reflect-x tests to display
 blocklists
Thread-Topic: [PATCH i-g-t 2/2] intel-ci: Add linear-reflect-x tests to
 display blocklists
Thread-Index: AQHclB8juoxJ8MjNL0aiWS/3JTOGVrVvIuQA
Date: Mon, 2 Feb 2026 09:23:33 +0000
Message-ID: <DM4PR11MB631205248CDF98D4EC195E12909AA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260202083300.647462-1-karthik.b.s@intel.com>
 <20260202083300.647462-2-karthik.b.s@intel.com>
In-Reply-To: <20260202083300.647462-2-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB7766:EE_
x-ms-office365-filtering-correlation-id: 0d8c230c-4fd6-4628-79c5-08de623cbc6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?QwBQLeE2I7KwpIBSyOSO3NS2v2sdu2eHnzOj7gAyAWGNxwib8goX7D2Dm+5W?=
 =?us-ascii?Q?KxWEWZYt7wdeHvfxT+qN0j42Jd1bBr/O7DZWQaufXRsK5MM6RM4hazUtrVEa?=
 =?us-ascii?Q?jSTznDGrp09+VHhj3FJSgdkSV8h6IhPDenal8Fv8zj3vur8LmDGzbhnmXaYV?=
 =?us-ascii?Q?vGeEVSJH3d7T2/SJyV+NmMyW/o5ZqxqwfuZ7443UXYzb2qQjODk06jCG68uS?=
 =?us-ascii?Q?vVvKbYKfuyCnNwMiRN4D2bnzTsJP1Hj518PSV47sSKVkCH/1yMm8cyV0HSC+?=
 =?us-ascii?Q?Ssm5a84EDlFyf0u5VjQFJ2AUEQZMLArVRRRAzX3I8qJAHarOzwTM08X97Xzt?=
 =?us-ascii?Q?IxyPx6ib9yOUH3HvNveu8ML7/i3+L/WIP68pYfTn7iU7yfDlCK1hV/2Kclp4?=
 =?us-ascii?Q?pA9RRCcGCehc9S1oY4WZ0v6Jj/4t1MMshMyDUK6bhfa+IFOQX/hIcUN2FbWQ?=
 =?us-ascii?Q?WZSkutlR/nXJ25+hRInC0cPFutWfUom3M1JeqhHFZrqyKUHi406xuc9eizQE?=
 =?us-ascii?Q?kiUyJyToItJeJQgkzIzb9cdKAD9V2chdfVZEVS/ZWeE+jwplNlUV1YYEoXXv?=
 =?us-ascii?Q?vMzYYxTjeZV56GF/Dimp9d3RBJQICBEqV+mO+xL1BZOx5b+uRNz9NTGWNVTA?=
 =?us-ascii?Q?d8d80rLxcgB57dUkpvwC6hIVxC/ttrJ1BmVybQsm9S7ASvG/ZObN/h8Eqb7Z?=
 =?us-ascii?Q?7wSLfhWbx1CQzceArfFN1dZYuvBynSOtjSYqwMrd5XoSkmu9lO0A/SBlvFct?=
 =?us-ascii?Q?9G/LqctsQEsY2Jl+pAwdc3hpGopl7jY5fL11l5cpoV0JjGZsKroym+CJPlkJ?=
 =?us-ascii?Q?4xeOzS0ZhjP7TfgGgWJYWmheOwy8o7JHd9/5eZzLHXE5yA44yXipawaSAsPP?=
 =?us-ascii?Q?Orm4bDvoHo7xYWNQY0NGZWlX/vkhxsNGtdlY5oQJnJW2hwxFhk+E+fyedT5K?=
 =?us-ascii?Q?+0nGa2Madip3gLuaMr1Uglmwa2mB+fQU1JSzRs2qCoGrKA0tAZcxIPdVflPz?=
 =?us-ascii?Q?PCE/3yfgTqEQNzJxkmwQYdn5i1/xk0n3nwY4Z1duYJACIUXT1650Yy6wFo2S?=
 =?us-ascii?Q?0X0Tsfuie6IWMmkG6ou+HeGioxYr1ucXlcd9jPwmsKjbbUY0Cvx75D4iy9OP?=
 =?us-ascii?Q?QIX8X13VAWFgsrE2eWxUF18YKJHV3PmnhUDW8uWcT+Cj+mc+ldEZwFdJa0Au?=
 =?us-ascii?Q?SMHaw+NS8BqWdymc47i7MIUVrcjJkHGjfYQFdvbq3KXQmrHMOFKA5tKZkiFJ?=
 =?us-ascii?Q?I0cRG3wWa78sixYlju4Crox6mYdvBu30pF3+U52p9LB/cgpqmuLLxKTEmazG?=
 =?us-ascii?Q?9cl+qHWDavnWpLfS9yKCOwGy1CmaZob9JV7iLMZrmRJdHpQN/HC/7v8vawZG?=
 =?us-ascii?Q?xcs7kfOdsj07UWpuTjsrjjflP1iBLrNZ/Y2yQNKSGTM13TwPwMeO0J9uSIw2?=
 =?us-ascii?Q?/be9S/VDSFiNZSA8USjXzFagX7Ly8tQvlQ/0niW2YrjnuIPuvLhwmLObIDaA?=
 =?us-ascii?Q?ty8vlLZ5yppzH+nASpff9AY+unpsa8XG2anMfGzTjIegqN7g+CJTit4jynx2?=
 =?us-ascii?Q?2VlUxQZHts/Ql8r2TQ8qPx1S3Yi2IQgzK0HEpnd18zZcGvYraHL+zTHemIUn?=
 =?us-ascii?Q?QCku4SN9YdYlyN9lsbbJ76w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?reqdTDb+IXKOKwqyTa8RKccT76dzG1x+eqV1Yh1bVZO287gl4n5Bdflw9B0T?=
 =?us-ascii?Q?/lFVyLnDkxEzv0JCwI5J579Nfn2Bos/uRqIu0F8V+aEnC8b0GsE1CCaUPdA+?=
 =?us-ascii?Q?CUg/J3Fqf7YtZBX8VBo4RnAgvTu/WQGByo+asZ/4bJgEIAzJFnPdbpUpz2Sq?=
 =?us-ascii?Q?ETNPQg41dHX6TPiBeZkphCxs5xN3iZ/bOGAm97yhbQV+cp06/r/Yno+NkCvJ?=
 =?us-ascii?Q?20BvO4SY33DgVN6tmvMUZxuYCgjl00suGhBNJex338GtUoT5GZERyPkupOjL?=
 =?us-ascii?Q?SW5bvlJqXt46iXeZwHOSPHVv5Ia5eMqyv+iRs+v1zu7zR7w9I9ud9YC64Khq?=
 =?us-ascii?Q?+r6u+WHUc4fJ6sqQBgVA76cneuReh8l7PTl6iU/QPndJfXfv3cWQVS+qQppb?=
 =?us-ascii?Q?uvmUPHDBhr4Jpso8NvBxbMJioc4GVtrjA3yVfe1kAghf5OTtQ30DVX9tmwhz?=
 =?us-ascii?Q?IomFN+FqyKxMNtqocoZxFpWYGZOBK11MUvTZVJib3iIBcimt5IM+7bEwynDM?=
 =?us-ascii?Q?MWnN/5tvNOPolZlyDJBgdUdcTN9tFJEw8m7PGape1M2BDs8aA8WE3a222ph2?=
 =?us-ascii?Q?0mkuYqKIQejpT4Kr68e9R7nKz+bb+u14Veszd7k1T5ppGaDFHOvAyYNH5Pbw?=
 =?us-ascii?Q?m+eWVOK49afLw/CPFGqPQH7ITgJTFSPrrJFaIskiW30ln2lkgRZUVheFdssC?=
 =?us-ascii?Q?sqlGOGH6AI+RKKR1B8vd4acGOY4pgTW4Ty2Tovr6oQ220wrVXLeZ+V4K+0Kb?=
 =?us-ascii?Q?ErIs54N7r1WTs6y77kY9WSUJQMu7hVrCKK4Pir6EJG/r3YtnrNIUwg8D9pCI?=
 =?us-ascii?Q?dW6HqvPuMLkmqNgVfivU2WKBZehuhJjIXVa4StgTofrivHSeQB83Q2ZfBMCY?=
 =?us-ascii?Q?wSuygVmlUwfUUlhm+KezUJZuvWhr6YIosHpNF+6y1w/oN7USKIoAZR/TMrg3?=
 =?us-ascii?Q?zcQKUhIa+8Aj1dWdIrkHlcHmo6J236jc7I3+KPhuQV3fnpyVgqnK3Io54g6A?=
 =?us-ascii?Q?UzO7LEb9EwlTW04nTQRmmHwm8IW9F9tBmBAim1lsgFWnBej6Rh6XyszAfAfZ?=
 =?us-ascii?Q?EOflEmEweeIJSfdHGW2h54+D1CU6ffCZSXkrfRXPk/5+dxPJnV4/uMviBHfq?=
 =?us-ascii?Q?i8xh7v9AL6CxcWqfeKBoZsxBYkrjCT+m+vOCs351PkUT31xEDiSoTsObtfZF?=
 =?us-ascii?Q?fRYdXsaAxtxoXuoph1XXBEkfW/AXEe6aUlOpLVoB0mlf7QRdrxsRRpZjfl4H?=
 =?us-ascii?Q?iBX6AcrIlXOTKOowlkgkW4WpfXSQoDV3VZVp3WX/T80SBJPQr3GG1RcEp1yT?=
 =?us-ascii?Q?iBINDmDUmFE5TuZVedMJjZgV7qsN7Ld2DMOof3TIgJUvmv3akbd7MpDs6mUO?=
 =?us-ascii?Q?acUA17xYNMY38BfWoysrmT1L8dQ6ca5Zu28gVICYz+zbIvBsMGLOyLCcdrI2?=
 =?us-ascii?Q?iTAmsK1pUB6GQZ40+ml9zyGgnOGG5eVQdPF+Pr0fpxsYfwjyntsx7fPUrAxN?=
 =?us-ascii?Q?f/Jdpi4rqQQTlRzocRYCWGgPjnirJj+6wXU1cqDyYJWDXcs/BUTPqnIS/DbX?=
 =?us-ascii?Q?xD6dkEJzosC+sd7SiHbwdjj3juazTOQgTYiU3sl4v2N7Wv2ol2HXsZUgthOF?=
 =?us-ascii?Q?Gb+oJr393XwB6V9zBgQIXYkqeLveCaZsoVbcCKj9HfOhdRwuhIVk+iOl2twz?=
 =?us-ascii?Q?fDFa+TBdHHK/TvIezjS0AL+kaMhqwNLHLix7QM/tOpuJWACk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8c230c-4fd6-4628-79c5-08de623cbc6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 09:23:33.1328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogc3jjUcDnlh7vtG9HFbCDXCE35JxVeAtot5bXHdrgbnW5NhiLNlEYfqzW3EEl/ztrm7+f4Lkcv66t0XbMPPTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>=20

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Monday, February 2, 2026 2:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t 2/2] intel-ci: Add linear-reflect-x tests to displa=
y blocklists
>=20
> Linear-reflect-x modifier is valid after display ver 35.
> Blocklist these subtest for older platforms.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel-ci/i915.blocklist.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.bloc=
klist.txt
> index 583df28e3..25f57925d 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -205,4 +205,5 @@ igt@kms_color_pipeline@plane-lut3d-green-only
>  # Valid skip :- For display ver >=3D 35
>  ##################################################################
>  igt@kms_frontbuffer_tracking@.*argb161616f.*
> +igt@kms_flip_scaled_crc@.*linear-reflect-x
>  ##################################################################
> --
> 2.43.0

