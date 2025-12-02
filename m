Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C015CFD376
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 05:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C6D10E520;
	Tue,  2 Dec 2025 05:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEIW6sgw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3160710E520
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 05:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764653398; x=1796189398;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/FmQpr/iiqJCg7BWagzTaXaCsFbcEXPMuV2G9QNdahw=;
 b=nEIW6sgwRTSwXpBoPYclkHZ3xGG1DbCAgviwfN6/HUtAEgEriv7W4kOy
 O2rX6rPCp4tk4vfzQe+KX+cyY5YCinA5YEIWgx9/+BrDRTYiXn6fpvBv6
 dFO9bkOsOnJsUvUyiurBjd/Z324vnTXgm+nm59FG4vt8kRjnSG4nqGECR
 G/wGiJM+g4ZwhG06KwOHT+B7hB/ddWmLc92cRj8HmTJ3B+Q70EY+wBlka
 xR4EEsdsmFvoQjR91sHqshuq4H5L4mSxwyLWUohdZtoVanVnHfwSWv570
 KNNK9VyPVdkAFA7zYLAPBfeEdQIxOTBLpA52nWNteNCwUS+wSgpQV7gi1 g==;
X-CSE-ConnectionGUID: qnj/lQvVTKaNpUYmOXJDnw==
X-CSE-MsgGUID: uAIKMjS+QauSCUUsaTh9VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="69205292"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="69205292"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:29:57 -0800
X-CSE-ConnectionGUID: jupY3378QQWZ745An8WlYw==
X-CSE-MsgGUID: bVOZBoHXSrW25NNtDPmS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="199400643"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:29:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:29:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 21:29:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 21:29:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vihKMjMeEcwPLyyHur6cA8FCOLjxXcyiB1xauHCC1SiATKzTaa1n5GwfSHte0piZYwlfcQOSW+mn/pX5AhP8ARBiaVH8O0vTQX8NfGb4atP1EryTe0Vpa2J3O/tzsvar/dgFWZ6kcobiX9wAYH/M7snEBG/9GNmWFAqyNmrCX/2Kf6D/eSagaBZUj3oOgcG8rR5+TZJeYITIaUXBJKYRGBCJ+tyxtDtxHCndfkscxznjXYjK4gtwFiSQ4qSSyU5/jwck74mC5y5OvIsnDc8I10wKpUrrcntQlkdeAUqse1yZvFop6F4aQKkE4oERHhXFB6JT9z/h5hGpRJUtJ0ZvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMO+K8eHPF/SGmcSwvcuEPKNkES2jGvMZf2qpymzh3c=;
 b=HRh2DUjMezYlF5oKO5mxqrMTMVTJypEZJJJiSI1Bitys3uYuYW/8EfBZhEFlOL8kJ6PiPT5c4VJZHI9CyjRZwB763ch0ucdhAQM1QuaxjmE3BhLE5l6iz9WwbHGSpYiaMTB0LjonWyyw1rpH8FPBLMmtniik3RExUjfxlgXANybOfGPv6whwEEJLbD7B1zsA748jz3BRYAfAAw5VcVDyCEcevimvkkllNbvzg+NhZx/0YhxrAQX9z5gzfI51L7piEn21Tq9yxHC34JgRxYK6jvHawU0Y3JrvEz8WvLJjGgSEg77LPV6ORBOqUH13bVuFXSTvY+8JZxS0ldv0lOwYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 05:29:50 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 05:29:43 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v2 05/19] tests/intel/xe_exec_multi_queue: Validate queue
 priority setting
Thread-Topic: [PATCH v2 05/19] tests/intel/xe_exec_multi_queue: Validate queue
 priority setting
Thread-Index: AQHcWpr3GWbUCg4mgEaRB7PSXtHTo7UN4/ZA
Date: Tue, 2 Dec 2025 05:29:43 +0000
Message-ID: <CH3PR11MB8434DBF84B736439C2F414748DD8A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-26-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-26-niranjana.vishwanathapura@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CH3PR11MB7323:EE_
x-ms-office365-filtering-correlation-id: fc047e1b-cb3f-447a-fbe7-08de3163cc9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7zf9vPk7mmq8I/Oi+9Jk3HUHWaOQR4UnWJ/YW8dMXPbaoJyDUFhqd91misa5?=
 =?us-ascii?Q?P3FibjfLKF7uKwuDkVcs6Zf6ODVZslb+pDnynNh24IWKG9+FqOBUXNMeU0ux?=
 =?us-ascii?Q?uVZ7LzhcKmzaeFWPlH+8se7dIlHy9tGx2rxAlokGBaYQiGtkrlWt9SkdCIyk?=
 =?us-ascii?Q?Sh5iEC4zdPZbhwJIsVAyQEi6PKstmICsHJGFulxqGr/njd0Bzj6ccBmT4S3o?=
 =?us-ascii?Q?Bt8hYX/DMoD9alotcMU7ZZRGvKAkldJ5ne/jKaXoiIyYTeUqn2jYnZbry88T?=
 =?us-ascii?Q?Hyevbs0PzvqvaExZv1EtiaLW4OnsJu0dHN3HS2trDCirmRPhuASvOysV7Ryk?=
 =?us-ascii?Q?ziX8NF33MSKQ83Ee/diKngvzJD5scXLnqfHAHcKdUfjoJ3H0lrIFqK79Zgxd?=
 =?us-ascii?Q?yfxtsaXqu3jiSCT9Ty6OjNXeYW7itlJK1X7lxzqMJgiAmAJpLr4VVTwTFHxD?=
 =?us-ascii?Q?gZojd82IZVIAgT8XgIFAgcPACUeqHb/OavvUnTYOYaD0D3ourd6iXHYxetcN?=
 =?us-ascii?Q?8cgXfGLN7O+bi27OJHcjrOXseytL90237GULERCefav95M6d2IgIDOHCKnBY?=
 =?us-ascii?Q?cJSef8jQGNwGMhkXGj7sm6O18p7UH+jK3rR+RFywaSey2LAPun4B2wwiaFjV?=
 =?us-ascii?Q?0CqnXc5c6yLtW+YPbVKjCwqAet8eNBvNWSj9TiAhP9ZL2VW6GF3GkRy4w9/I?=
 =?us-ascii?Q?nSM+wG9PSBllWojn99RElSiZZEC5fG2Vo7FNZXOluzjPsv3XgUR8r2iRHIej?=
 =?us-ascii?Q?7bz2dHn+LcAtIl9nby4klssFleorddhdEdIflA0WYb4PQWn0fYGlU2uNLNCK?=
 =?us-ascii?Q?dLQ8hofEIyN/4Zd/dhQG1jg+qQMnts81Z3L2mk6TFlk5SIkHlZ1KoR4aqycv?=
 =?us-ascii?Q?ePfP6c1t5R98dxQcefb5WXzyzwKKsSf6hXf5SR4rXDZLQfWysC87ciGiIQ2I?=
 =?us-ascii?Q?pLu53s8tASFICrfNcgAdo/Bx0qQDIA+JoKC+nL1lEAlgj9MPm/8/0E3JcO1N?=
 =?us-ascii?Q?tCJCQBzRZczO3k6/MqsmHFwSOYhheabfH8iu8u9+s2PnpkWLP9JdhN9hLQzk?=
 =?us-ascii?Q?SfdTUypFDVgjVRqlNwoxdG64ZOr04E60H3EtFrabdLQ14WA1gHXi93jAWlr9?=
 =?us-ascii?Q?lNzJiK8Mgomr8+Hnxh0c01jvFUzZrMrSGCFCeCd4VOFoQw+R2GAq2xdFkWAG?=
 =?us-ascii?Q?LKxDxSvvS5xpbOHYYYKUquUZ1pMOogiY/WXYucJdEaLJ+WyxcNe8pczIL1G/?=
 =?us-ascii?Q?H6gxG4zYJXwq0OGD4s+D1Zn8d4brFnJ142HZo5Lj/xRIiVUblIfaEfsL+rgC?=
 =?us-ascii?Q?yBBv8qdQheIa4RzOJ/3n54/rTfCQ2kWve7Vv4IbrV2inB8qx0wI9yWI/e9Ik?=
 =?us-ascii?Q?CIsjEvu/M7YWqH4CLweQk0lSj29SY3CEZ7ee0JINah40ZcvJW1W9E58AWGK9?=
 =?us-ascii?Q?sacjtmSNVBM1GWzDOfgklv0Rlm5gVvTiDpgn0PapQu3Ul7zm69XNbvdJ7uAq?=
 =?us-ascii?Q?jkIc52LOfgog7me4+VXCQOWYBXEh1OHf0cU9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XBykbpwJaBmvNoLJCpSMSchOJxn6uluhQUsv9OUR5KrXZJTn4crnHuhz5OR7?=
 =?us-ascii?Q?WWQ8VopHamYNCig89beJ172zPIy1W/QTjFJGj2470vF4uAV9yA3xPoDXK4IC?=
 =?us-ascii?Q?MdAqfFOuuNKM+Q1HROO+52xnkkU31Q7oC8k6DN5Wxr5fImyVu4cuxLQLYzaY?=
 =?us-ascii?Q?ujuYY5ajxbNkCueH73JfJAqLwWsM8IfuN5E5/EFN6fo3pNiDHXm1OSwW2Eh0?=
 =?us-ascii?Q?P4G1+8YHj2gJO4IfyIxijK55mqcP5zhyQFZfe+Caab3kIiqwJ+F8Czzd1L64?=
 =?us-ascii?Q?6UUeT3+d0nntMPNQFa/va8gO2YVoVNoHzOcXPAJWEh5+zXh42PiqEWMMLdBF?=
 =?us-ascii?Q?Pb2w1+3GUztuYIRp2lJJZDA/ETV+wMZheVXpISqPAzTaM9KrGBcfF+ls3VzS?=
 =?us-ascii?Q?+d1Izv4oU1EuYPvuKDPjJ4yUK4xgzt6Rq1N3q2IqfhLUxro++YNLT4YW3kDc?=
 =?us-ascii?Q?JPpb0SY5gZWz5V0D0GCEwF0bgVFZ73nTdR/DQc1y43Kf+ELQ8h5VJJ0gSpDI?=
 =?us-ascii?Q?9Gy4vW+2sT0K+Odx0KaZayNyzqLK8NWp/py7uFTUFSKItvFuWqkfqtmD3jP8?=
 =?us-ascii?Q?fhyX+nkpJV5k4gPPVHCmWwBebgjX9m8pzW1QUhIzb09PSIHOxAPN9H/pWePx?=
 =?us-ascii?Q?CBzQd26uMxd0pJ+lGSFhwFcG4VQ6M0/DJ8PcK0ESTGwFAviHZDYvUa5XLZQL?=
 =?us-ascii?Q?i8DvfqZKQ8k/FJPGdysT1itWQxP1qQNP0D1bs5Av7vL+0BEX+IdiiyUDJ/3U?=
 =?us-ascii?Q?Uiit5YHL20SPgemzN2b/onfD7HgTvmFa1fprckfhAEB9GyltwyHHyChDGOID?=
 =?us-ascii?Q?sJHHWH95W+ZfGGX0RVejltaCNfaX49c1sP+MOnPBokY0k4tOZ6KFOwhPetk0?=
 =?us-ascii?Q?/tphtON129/4iX6XyEU3Dm0vg0wMOcFHK4bKj6TeOfBH9f+hd88IGK2KnUPi?=
 =?us-ascii?Q?7jrlIgnb+KpJ6jdSRi5oY3YGMp991lYChEzY8km17gg8WGJ2qQpdsWFNe9bg?=
 =?us-ascii?Q?rChqox02BrcQMi7lv8p/g8J0TISt2kaz4sXvJq4BzM8MsXIEBUWc32t3qPhg?=
 =?us-ascii?Q?8D5SxmDf8JpZZas0hUmVDQsWt4IZa6sBPx5uvfsk+F3+8QQpMIdt3EG11lJ7?=
 =?us-ascii?Q?s9WelND6g95WEJ+H+oH4iVeZX31vjSEIFoZs138ce6x8u/yrvNXS+DLnV4+c?=
 =?us-ascii?Q?S7faN2jEky8ss5NS1cgWsinLQFmPnnASIdZKy80tcUI5oE4lFaXGCz4TviYJ?=
 =?us-ascii?Q?G8BtR2zD0AS6XQGRyPTkOYX4x7lBTrpe1SQZ6aoKKj0RJAgvn7J8Zirk7U2t?=
 =?us-ascii?Q?btrWFIeOFaEeS3/p1N5pJKaw7S8iNLOwiOnUvkZj3ngqIP06w0gG1jKsXciZ?=
 =?us-ascii?Q?bF6aXWBdEzuziNXCHZW7uPQATUprd9qkpQ0MGEqHLDviHDORGN1S8EMxEn1o?=
 =?us-ascii?Q?ubl5TfpdsT95JmLMVWjAO2lAl6VRYj3BoIym4O3Qj9BXj160/nhci8K47f36?=
 =?us-ascii?Q?vequHV5WKXvfluxx20/H2GepR14TyyxQ+mmGfcxl+H1lz0CfkqHukD3VaaeX?=
 =?us-ascii?Q?PFvJLzKw9Zl1nVfaHR4uB9UPTJn51K4zsiDKME1dHoyUEUZG1/I3oLPlzcqu?=
 =?us-ascii?Q?QAxBj99KpqSKD2rnmVJySrkZZ4mS93Ncv/2fjBmqCWcFDnEZOgaB3rfB/Yh3?=
 =?us-ascii?Q?w/nTzA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc047e1b-cb3f-447a-fbe7-08de3163cc9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 05:29:43.7211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xDlmCcfgVxOyIeGHffEvOu6qU3qJfskDXK1x7X4FdxKMWHSyryPlezaoOTaHaUb0XSZgk04W6KSMu04tIoFA5ns47LIOvo06W9WMo2flyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
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
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 21 November 2025 09:27 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH v2 05/19] tests/intel/xe_exec_multi_queue: Validate queue
> priority setting
>=20
> Validate setting priority of queues within the multi queue group.
>=20
> v2: Add and use XE_EXEC_QUEUE_NUM_PRIORITIES (priyanka)
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 67
> +++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_multi_queue.c
> b/tests/intel/xe_exec_multi_queue.c
> index 977b4e7a0..3bbcf7975 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -18,9 +18,15 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
> +#define XE_EXEC_QUEUE_PRIORITY_LOW	0
> +#define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
> +#define XE_EXEC_QUEUE_PRIORITY_HIGH	2
> +#define XE_EXEC_QUEUE_NUM_PRIORITIES	3
> +
>  #define MAX_N_EXEC_QUEUES	64
>=20
>  #define USERPTR			(0x1 << 0)
> +#define PRIORITY		(0x1 << 1)
>=20
>  #define MAX_INSTANCE 9
>=20
> @@ -37,6 +43,15 @@ __test_sanity(int fd, int gt, int class)
>  		.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>  		.value =3D DRM_XE_MULTI_GROUP_CREATE,
>  	};
> +	struct drm_xe_ext_set_property mq_priority =3D {
> +		.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +	};
> +	struct drm_xe_ext_set_property priority =3D {
> +		.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> +		.value =3D XE_EXEC_QUEUE_PRIORITY_NORMAL,
> +	};
>  	uint64_t invalid_flag =3D 0, ext =3D to_user_pointer(&multi_queue);
>  	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>  	struct drm_xe_engine_class_instance *hwe; @@ -77,6 +92,11 @@
> __test_sanity(int fd, int gt, int class)
>  	multi_queue.base.next_extension =3D to_user_pointer(&multi_queue);
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -
> EINVAL);
>=20
> +	/* Setting other queue properties are valid for Q0 */
> +	multi_queue.base.next_extension =3D to_user_pointer(&priority);
> +	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +	xe_exec_queue_destroy(fd, exec_queues[0]);
> +
>  	/* Adding queues to group after primary is destroyed is invalid */
>  	multi_queue.base.next_extension =3D 0;
>  	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext); @@ -105,6
> +125,11 @@ __test_sanity(int fd, int gt, int class)
>  	if (n > 1)
>  		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n, eci, ext,
> &val), -EINVAL);
>=20
> +	/* Setting properties (other than MULTI_QUEUE_PRIORITY) is invalid
> for secondary queues */
> +	multi_queue.base.next_extension =3D to_user_pointer(&priority);
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val),
> +-EINVAL);
> +
> +	multi_queue.base.next_extension =3D 0;
>  	for (i =3D 1; i < MAX_N_EXEC_QUEUES; i++)
>  		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, ext);
>=20
> @@ -135,6 +160,37 @@ __test_sanity(int fd, int gt, int class)
>  			xe_exec_queue_destroy(fd, exec_queues[i]);
>  	}
>=20
> +	/* MQ priority is not valid for regular queues */
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
> +					     to_user_pointer(&mq_priority),
> &val), -EINVAL);
> +
> +	/* MQ priority validation */
> +	multi_queue.value =3D DRM_XE_MULTI_GROUP_CREATE;
> +	multi_queue.base.next_extension =3D to_user_pointer(&mq_priority);
> +	mq_priority.value =3D XE_EXEC_QUEUE_NUM_PRIORITIES;
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val),
> +-EINVAL);
> +
> +	mq_priority.value =3D XE_EXEC_QUEUE_PRIORITY_HIGH;
> +	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +	multi_queue.value =3D exec_queues[0];
> +	exec_queues[1] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +	xe_exec_queue_destroy(fd, exec_queues[1]);
> +	xe_exec_queue_destroy(fd, exec_queues[0]);
> +
> +	igt_fork(child, 1) {
> +		igt_drop_root();
> +
> +		/* Tests MULTI_QUEUE_PRIORITY property by dropping root
> permissions */
> +		multi_queue.value =3D DRM_XE_MULTI_GROUP_CREATE;
> +		mq_priority.value =3D XE_EXEC_QUEUE_PRIORITY_HIGH;
> +		exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +		multi_queue.value =3D exec_queues[0];
> +		exec_queues[1] =3D xe_exec_queue_create(fd, vm, eci, ext);
> +		xe_exec_queue_destroy(fd, exec_queues[1]);
> +		xe_exec_queue_destroy(fd, exec_queues[0]);
> +	}
> +	igt_waitchildren();
> +
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> @@ -197,8 +253,17 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>  			.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>  			.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>  		};
> +		struct drm_xe_ext_set_property mq_priority =3D {
> +			.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +			.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
> +		};
>  		uint64_t ext =3D to_user_pointer(&multi_queue);
>=20
> +		if (flags & PRIORITY) {
> +			multi_queue.base.next_extension =3D
> to_user_pointer(&mq_priority);
> +			mq_priority.value =3D
> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
> +		}
> +
>  		multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
>  		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
> num_placement, eci,
>  						     ext, &exec_queues[i]), 0);
> @@ -299,6 +364,7 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci, int num_place
>   *
>   * @basic:					basic
>   * @userptr:					userptr
> + * @priority:					priority
>   */
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
> num_placement, @@ -316,6 +382,7 @@ igt_main
>  	} sections[] =3D {
>  		{ "basic", 0 },
>  		{ "userptr", USERPTR },
> +		{ "priority", PRIORITY },
>  		{ NULL },
>  	};
>  	int fd, gt, class;
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.43.0

