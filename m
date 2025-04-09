Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619FAC369A2
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 11:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D0C10E85F;
	Wed,  9 Apr 2025 11:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3tvcC7Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78F610E11F
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 11:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744199426; x=1775735426;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8S2vDf4VJOJBwcC6vx9oAXg8qs/958KVtx/iBGy7Gyo=;
 b=C3tvcC7Z2okn5SuDXA6zQSGsnQMfWm/K7GVWAIsLG20G1x9+zTzoocP9
 hNIXTeQQ1Dp0dNlv5cw/AEPbYwjoJCEYMNR2XZELqdWm12uzZcnsR2qD2
 ZXAEwkNsGXb4+QFgzKNF8GeVGk55bgWH8Wk5EhzIt/hlY83e0EJUGyPbA
 jiB1W+HxdbVd+0FHIGbuJlBFSDieqzIYF2mnz0kwjySCBU40mp4zlnpjN
 PTecsWtGDz20mBi5xI5hnY7Ib6AxXt8RI5S9flfMcVCmLfVeofQOIg9gc
 DvfTkpx13s7O2jfHw+3oSg7FUtS5OUpM6iwL76ywrdyqB3sz09qTq+M6s g==;
X-CSE-ConnectionGUID: 0PvhJJ8wQDyTnfQd651Jhw==
X-CSE-MsgGUID: UQFdzqwZRq+KRGgpW0VaKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45561269"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45561269"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 04:50:25 -0700
X-CSE-ConnectionGUID: P+SrH3QER1KoInR0eNdhtA==
X-CSE-MsgGUID: kd9BG2j0RM24Smi34rECbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="128426990"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 04:50:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 04:50:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 04:50:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 04:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROvsju3qXzDjpzMEDwZVFcLt7nrnkZF5LsDcLjVuro+I8WnNR3h3rbL7zJ1HCypAJJPrM/eyvdl0yToegOEjEkhP/IUbhmYJoX+zz6wBmdLXWt3gnb2kDpdxzE1c5oD7+lmrdvrGfmyj6xur/I/Sh1TZGkw3zeqyrFPZqcONKrmoY6kX+XgJ6sY0r/vkcABhxiscbPZth2Jfx25zhwXY0GmXqMQSqKd/K1etpDFVZVymlKFfeJImHJ8jCBMiKD3l3+vMoQ02NJGhq6K1l9wnsZEUrJZixOHYhd1MULoLM38tDLn3K3VR+Ojf7WgHXFtAwHs1jHSwTtx/HfmPrwWyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRXEfFNb8nrLA8OB8LXKz58nyr6NRb0DYnByltrwpfk=;
 b=L4bFF+hQ40/4Gta+l3oYTInLSsbLFkvIiHwp7Xs+683V+qvmNxUp/rSTfwPZNpx94bbleBAjGL4yq8Fa0DvjTbVPFnze/ECrGObGGpK2Pirfa0uPINxW+SlON5zKTqzuRD7V2IWqloerNQvtZGauPIueQ+i+/A6/qoDeDdbPMrx3V4xSLjxL+5YdzFnvQLa0rQQD3APqKQ0K5K+lwDuv1tRM9wcoyo1ku9OvtTA2LkK+P4VYBNBJq1MFLUQG7XNcpqkkiqdn2UlC46T0jOqIAAi6eI6jBT8PJuchmnlB211r+9IN95WfWc/Q7teCkkHG2nh/uRFTF4rq4JeNBZ/leA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 BL1PR11MB6049.namprd11.prod.outlook.com (2603:10b6:208:391::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 11:50:22 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 11:50:21 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH v5 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Topic: [PATCH v5 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Index: AQHbqPhs/8PFNtSfy0ySGl3mc8QiyrObOMOg
Date: Wed, 9 Apr 2025 11:50:21 +0000
Message-ID: <DS0PR11MB7264042E8655F25CD8DCD7D3D9B42@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250409022217.2292395-1-sobin.thomas@intel.com>
 <20250409022217.2292395-2-sobin.thomas@intel.com>
In-Reply-To: <20250409022217.2292395-2-sobin.thomas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|BL1PR11MB6049:EE_
x-ms-office365-filtering-correlation-id: 98e57ddb-af2b-4a28-1d85-08dd775cb541
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?qIGfEbfcWbVud5O6ZlFmUKSMXZSwo7O1wszjI6CLD20U3ZMkC7ISHz2Qzg?=
 =?iso-8859-2?Q?Q82wZQpTcWNKIY3IvKvW8+H3HMB34deB5npqCj1gOpTO0IrjGV2X0+AtWX?=
 =?iso-8859-2?Q?Pzct7EXup5c2ZSIbC+GMDYyO0QxBoAVwTlUp9yPGtnef7CeS9y2jf03o+E?=
 =?iso-8859-2?Q?QTdJ7KdbJPCBUz8ebQsjNNTA6rAH8kstIudooMtqv7KF3VKlcg1YrqfGc0?=
 =?iso-8859-2?Q?4geraR5DF7o8ZnLinuROCK5LjvrQA1QWfsDOE6hnsEccIMGtcN9ykRQ6wS?=
 =?iso-8859-2?Q?e9CkiJHCYv4Y4ojTwT02fC9LTDAaf5TFAQYx+8Y+3mA/g2OK+tUujeoeEY?=
 =?iso-8859-2?Q?JrUjvWB/lZl0Yt4QhF+WZmA0YvR5U0f4wjQs5t51xfZ0LSoehErY1yBzPH?=
 =?iso-8859-2?Q?9Zc+5LcPysXZZ84LG8GtDCcci0JaHQiU9oyJT12ffk4An3NrK8wVMZOhDN?=
 =?iso-8859-2?Q?EEF3SLdSelmxeiVKwELfOB+pxkyksL5aQ9n8nzxr4EY6BZMhUb9666SVJ6?=
 =?iso-8859-2?Q?tbosUFBP+5rm7oNNYu5f3u2Ol4tifHIUDHQWIrEIfc8EkDwqGf80Izljy5?=
 =?iso-8859-2?Q?gtSHAAffvfoiTBu9waghtzLK5tWvSPzX3dq9L54xrlZma8uDkieeniPNF3?=
 =?iso-8859-2?Q?1TK89Wy3Au1rT3ohp6eOZCS3WeAaipTWkZS3or3qidSoZnuupNPH6OGIfn?=
 =?iso-8859-2?Q?1xgZsFKNYa2QA4m0hMdLkUnYEZCODgUORwbxv+9AVDbHFxj0+rYxEaIi2t?=
 =?iso-8859-2?Q?MTvkzHQ0gd3RWoaA83jKrV17gXdo2NwzHtvSrUx78AQDcRNVOhKG+dFvCE?=
 =?iso-8859-2?Q?aPWbu99YK2Rago2Iwb9m6SGys3Ef52txLMI5iEYh2hTM9aJGOUPR0fqlO7?=
 =?iso-8859-2?Q?L59hhS2QT1rDcKfz1SQ2rJtHtPePx+JeYfrUdTKgh3uP4UmSwXdB+vOg3A?=
 =?iso-8859-2?Q?gdvJTFIJA1cXj0z03f0mB1Lny1Q4IS2+wDGe7+tVgaAfefXNWDjZ88toDS?=
 =?iso-8859-2?Q?PA5oQFwSRtLEcN7Aetx9mFIKA9kQhMAQrewpYtYhV1zcqCN7q2S9ZWsgj9?=
 =?iso-8859-2?Q?pBzhO2JQtKMYsMpC+bi2XWOYMxP6izZ3Ljl13VBEQuZQZyWLFKD+DSIz4Q?=
 =?iso-8859-2?Q?eUM+4s9iW9U3gx8Kduxywq2RqSztTZO8e4IQeXRMXiBl4Fs/5tVsvJQqXW?=
 =?iso-8859-2?Q?+2zxj1rAmV3Fm3eg6AzDqlVaYxZbVyOY6TupEo99xXdJTCt14Q5fMRrHoH?=
 =?iso-8859-2?Q?JuXcjOswQ9ZU1mqvZX46uVo+8lVIUJfM4rEJ0MXDBXZ90U3WZduosDqIII?=
 =?iso-8859-2?Q?pYLV2RrZvlDcfso4BnXOagHy5HrA0VkRuteyXNOFqHCE2o4ApwTwh/rfVl?=
 =?iso-8859-2?Q?0sjUnCx98NIBR0HYJl+Qp0AXYDPo5x0c/mAY+lQ0bWWQUTswLkb+sqvLMr?=
 =?iso-8859-2?Q?245mYTfn7nB7mpCTlE0R2cBpw+5q2CF/niloJyaknAzS7OI5H9PdId4v1q?=
 =?iso-8859-2?Q?GhDoN6bdswiKnRpZditSwa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?87yDpIzf1upYZRVOH2BVV85BAGiomfj0hl46jRPADsUiOC7lbbhBhhMplc?=
 =?iso-8859-2?Q?KiSkMu3NRpIzwxM8SsTtFEJhd0T0XIHz9Q+0gDUjcv6VDbHg6D/ToorpMP?=
 =?iso-8859-2?Q?RhMK+b+JLEqEq8QBjlpbH4M090zhkBa2UFV0wNbsnYjexSRa8B5SlDFATv?=
 =?iso-8859-2?Q?EaEtxhhjVn8DyZn9C2/AplCTFcGQQIfomLkAofwm3mInSKDpCd9nKYyj1h?=
 =?iso-8859-2?Q?46rya5FzjHYe5OSNz6P0pAf27CXuwm8RvIyob/aipbor2fSPhC9c7hPvZx?=
 =?iso-8859-2?Q?ICSg0T0r5tBaUc6fnrwqSASvbDTngHLoFOpmB351dOvMgpHkwAUf4D6EYj?=
 =?iso-8859-2?Q?79nIoknHaXO2rdsti+BUCP3pPPb+zd8iCwe9Nud+buVHRIpIjVRp4AKYJc?=
 =?iso-8859-2?Q?O7SqxpiPi7PuR9nEV+cTqHIhrasX6c0AQY/QIb8t5SnxCR6Q2aszyjOUUL?=
 =?iso-8859-2?Q?QPJbRu7GlMbdsZKkIuFqyyQSzQAhhvu5+IVadxJXhY0khHZlDnTAWAoYd0?=
 =?iso-8859-2?Q?rT7TjdsAxpJHsKxBH8Mw6I2TTS2iwp+jQTe2+m2zJ9kHt+nX7LFYpojoov?=
 =?iso-8859-2?Q?B37aRRDn6sPC0neqpfvH8/yTzetH2RyAUA5btk9VUs3/99xZOH3Hg15HxU?=
 =?iso-8859-2?Q?dHHJuM4eusyRTBjRLT6d0s6K39VVxJBtbs3PQSJzEj2pRJ2gyf3tkuadsl?=
 =?iso-8859-2?Q?x3+BYUGGpWQvQiYPimUik1jy8fcrW4SmrB7VcWVmLr++YJiD2/3mXmyn1s?=
 =?iso-8859-2?Q?OUZryuUFy6YPCXfkb8tTg9ASqV12wX/eck/zPTIbpAY5SBi/GRfO248nlR?=
 =?iso-8859-2?Q?oeSZU1iwqMYViNQIJYzSTK+ay+dyXYZ9R6FCCvNXiYnanUegKKc/9H6nFd?=
 =?iso-8859-2?Q?p1NUyittWbW6Y8gSnU/iwmVwnwvSUfDnuVJWy46E4aBwOtUyavbgk4DNXi?=
 =?iso-8859-2?Q?n4pwYzFpnFD7S7TG1BHfloEaNJL1D6WUCTMc4F5IR6IpTXQ17VElC036JO?=
 =?iso-8859-2?Q?I+xitl1eXJhuuHR8dxQF22ZisvTkPRlpYVXhLYEyxKCFJ2d/WGQUhfB7Rt?=
 =?iso-8859-2?Q?FCnyd5BH1Lczld0bRT4QgHiRyjnttCkck9rWpKTRqPRPqf1/E4u2Al6Ow2?=
 =?iso-8859-2?Q?HriJW+M6dyvduEEO2Ye0LY8XG3mHLy1SWOzp9quOZOzfY7yHBdds8Xi2JY?=
 =?iso-8859-2?Q?Q0pxTXGB1XWlzvNJ032vcaQpipJzQ/GR7fJk8VsbMNlGQyvf9B3U6RlXGL?=
 =?iso-8859-2?Q?voR3U///atS3q9ycIqNvzJRI/p8GX6eMrA9z4bb9kORPc26+k9j44D1kc8?=
 =?iso-8859-2?Q?lOgqsm0EauLLQU4XrXiiuoOZh9jU1bUfPNkrAv97Oclmcl1hHj2KCjAbUY?=
 =?iso-8859-2?Q?A0x0eA5bg+/nCyd6E4CYAF0kizeOtbHUKsKzqvog9uF7EilHeJpo9R1W4c?=
 =?iso-8859-2?Q?FW3n12Qd8zcF0GRoEXLcC2LsOqIEjFHdU1QbdSklafkOtERrNl0yyQzN28?=
 =?iso-8859-2?Q?llXC49nYIsFKWlrtSoIVtTL0QbNweLzz5Ek3bKo9TtgxIUYYO1Ydpzjaow?=
 =?iso-8859-2?Q?UyScPzqFVYXpgpUkYWYXAX51E6a4/GnI+Lthr95OBmiVSVdlFUQCBtdPOv?=
 =?iso-8859-2?Q?e4joWYga4e3ffWsZzEQ2qzArdTtU9sdWFa2ggtUKtr9grkunwceb9TOA?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e57ddb-af2b-4a28-1d85-08dd775cb541
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 11:50:21.7946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4zmMhHct9LLE7F0CWLHIyABgfPi1iHAoAM/VCEuia0g1Cotb31lurZa26puF5RBZtGHdEZY9P/XGryBLBmKYIA3qrFza09b1zSfvqc7PeWxXKloYTR/YaUf8QPIY+Zx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6049
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

LGTM,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: Wednesday, April 9, 2025 4:22 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>;
> Konieczny, Kamil <kamil.konieczny@intel.com>
> Subject: [PATCH v5 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid=
 string
> test for engine sysfs properties
>=20
> This test validates that invalid string inputs are correctly rejected
> by engine sysfs write. It ensures that the property values remain
> unchanged when invalid inputs are provided.
>=20
> v5: Fixed documentation and fixed error.
>=20
> v4: Added subtests to test large (4k) random strings (kamil).
> Replaced igt macro.
>=20
> v3: Fixed the test logic. Fixed the tabs
>=20
> v2: Added error check for return values for igt_sysfs_scanf and
> igt_sysfs_printf. Removed the changes for fault injection in
> tests/intel/xe_fault_injection.c
>=20
> v1: Initial changes for checking error string.
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_sysfs_scheduler.c | 98
> ++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>=20
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_sche=
duler.c
> index 4fc764f82..c4386ffce 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -15,6 +15,16 @@
>   *		unrepresentable intervals.
>   * Test category: negative test
>   *
> + * SUBTEST: %s-invalid-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + *		invalid string values.
> + * Test category: negative test
> + *
> + * SUBTEST: %s-invalid-large-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + *		large invalid strings (4k).
> + * Test category: negative test
> + *
>   * SUBTEST: %s-min-max
>   * Description: Test to check if %s arg[1] schedule parameter checks for
>   *		min max values.
> @@ -39,6 +49,46 @@
>  #include "xe_drm.h"
>  #include "xe/xe_query.h"
>=20
> +#define STR_LENGTH 4096
> +
> +/**
> + * generate_random_string:
> + * @str: pointer to string buffer that will be having random string gene=
rated.
> + * @length: length of string to generate, excluding null termination
> + *
> + * Generates random string that will always contain non-numerical
> characters.
> + */
> +static void generate_random_string(char *str, size_t length)
> +{
> +	int type =3D 0;
> +	int digit_count =3D 0;
> +	int max_digits =3D length / 4;
> +
> +	for (size_t i =3D 0; i < length; i++) {
> +		if (digit_count >=3D max_digits)
> +			type =3D rand() % 2;
> +		else
> +			type =3D rand() % 3;
> +
> +		switch (type) {
> +		case 0:
> +			str[i] =3D 'A' + (rand() % 26);
> +			break;
> +		case 1:
> +			str[i] =3D 'a' + (rand() % 26);
> +			break;
> +		case 2:
> +			str[i] =3D '0' + (rand() % 10);
> +			digit_count++;
> +			break;
> +		default:
> +			str[i] =3D '_';
> +			break;
> +		}
> +	}
> +	str[length] =3D '\0';
> +}
> +
>  static void test_invalid(int xe, int engine, const char **property,
>  			 uint16_t class, int gt)
>  {
> @@ -121,6 +171,52 @@ static void test_min_max(int xe, int engine, const
> char **property,
>  	igt_assert_eq(set, default_max);
>  }
>=20
> +static void test_invalid_string(int xe, int engine, const char **propert=
y,
> +				 uint16_t class, int gt)
> +{
> +	unsigned int saved, set;
> +	static const char invalid_input[] =3D "999abc";
> +
> +	for (int i =3D 0; i < 3; i++) {
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u",
> &saved), 1);
> +		igt_info("Initial %s: %u\n", property[i], saved);
> +		/* Assert if the invalid write is returning negative error */
> +		igt_assert_lt(igt_sysfs_printf(engine, property[i], "%s",
> +			      invalid_input), 0);
> +
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u",
> &set), 1);
> +		/* Check if the values are unchanged. */
> +		igt_assert_eq(set, saved);
> +	}
> +}
> +
> +static void test_invalid_large_string(int xe, int engine, const char **p=
roperty,
> +				       uint16_t class, int gt)
> +{
> +	unsigned int saved, set;
> +	char *random_str;
> +
> +	random_str =3D (char *)malloc(sizeof(char) * (STR_LENGTH + 1));
> +	igt_assert_f(random_str, "Memory allocation failed\n");
> +
> +	generate_random_string(random_str, STR_LENGTH);
> +	igt_debug("Generated random string: %.10s...\n", random_str);
> +
> +	for (int i =3D 0; i < 3; i++) {
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u",
> &saved), 1);
> +		igt_info("Initial %s: %u\n", property[i], saved);
> +
> +		/* Assert if the invalid write is returning negative error */
> +		igt_assert_lt(igt_sysfs_printf(engine, property[i], "%s",
> +			      random_str), 0);
> +
> +		igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u",
> &set), 1);
> +		/* Check if the values are unchanged. */
> +		igt_assert_eq(set, saved);
> +	}
> +	free(random_str);
> +}
> +
>  #define MAX_GTS 8
>  igt_main
>  {
> @@ -129,6 +225,8 @@ igt_main
>  		void (*fn)(int, int, const char **, uint16_t, int);
>  	} tests[] =3D {
>  		{ "invalid", test_invalid },
> +		{ "invalid-string", test_invalid_string },
> +		{ "invalid-large-string", test_invalid_large_string },
>  		{ "min-max", test_min_max },
>  		{ }
>  	};
> --
> 2.34.1

