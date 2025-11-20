Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380FDCF8542
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 06:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C792D10E6E3;
	Thu, 20 Nov 2025 06:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d42f2mrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D171010E108
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763619543; x=1795155543;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=vMcsBfplcf5UkBSXEJ1nLJHodbAU/qw9kUfCqpcdUwU=;
 b=d42f2mrQA3eWjYxxYGniwlClFWz74ccfkNpOd1MOT5CXnPlTSNj72Eix
 xrbozYeGytMuI8qfBdxcYs/Q6Y0+bsZDBwyQszaLNuaQp9+jTMrj1rKF/
 KhiEbzZ+zFSrjSmhMQY45EkpjVUl1gDbxpIqA+rTyFYjeY13wqz1FAxXm
 kh3L0vTAbsxBbAYkV0X3r3EXsSggguPwH/fXmISn1h3BKVeOdqO+qPW8f
 7ZIa/NsG27vyPWmhgKygE2/zVPs7hR5ZDySe4c9uONTBGcQxxzr4LTmLf
 HECFCbjjXGnQqN7ZaZMwieKbkLPYY+UyYDdavMjX3gWMfxna8xah/apgc g==;
X-CSE-ConnectionGUID: 1uFz4R+CT6eBVfMuRsnNWg==
X-CSE-MsgGUID: hmsVDYYpSmOucmKQF/ydbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77035607"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208,217";a="77035607"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 22:19:02 -0800
X-CSE-ConnectionGUID: GP0Z4zGJRBinOmRghRbntQ==
X-CSE-MsgGUID: a+xvMsuQTeWqP583A2pxjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
 d="scan'208,217";a="191532552"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 22:19:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:19:01 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 22:19:01 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:19:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrAviKxtj+cQZa501iYzqE6aNBE+NMt44seuBeX3b19ONNFbqAZNQFwTx6DaoH9XCYdMKUhFtaUDhZDYWGTDGmL8g0iDqq4WE5REjCYM/k4OA1ThUjINcVGIcHC4i6TF7bD3e8c1dKHyNl+UnXkP44aITUEj6gPu/PALmnkleMaSkHI7REJ8zMy3mvb2dT6XlLBjyBPjjFvVYykLBdQTn+b9aMLA8/In6n+2M5fb4EVfwOykuT5un9IbQVH+fNhRjtHlGyeDcTeIp+RnWyIvEZnMHV5HKfJQEzkjWRTc23DUW3HooZzOulpE07bD3amOZFRcDd1UuxAeS4adRyyUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmTebEiC5F8N0kLo0lE+owzx4p7H8XxlybrD8ppMBfk=;
 b=gq0oE7xRvPzZowmSSXB4+hYSnsOyiRXC77I/JZTJEjF4rVphoczxknuBHERDdJHRCpofaj/P7UEmiOrOvEFFeyqwJ3VxkgQTS9rVV2JCBheYnQWNHahimkw6zrlFTY5dr9Kqk9YpPU07bqnk5U7scZgMGgfgnUPwiqj0rQZheAPo4OB3TJl0dMBDT+5DEO1IBh6VfQn8iVxnNZ6FgYDKUqLvhizE58retDlVE3GxzbYXdI0mSYmEthnMQS1vhxzWmp2DSxRWgyNheMAmDEseLdj81A7MhQkkpeEfVZatbqBSrQW5jin5XbjaE6zqOWY1j1po/Kzhfz869rrwM7kOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Thu, 20 Nov
 2025 06:18:58 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 06:18:57 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Kempczynski,
 Zbigniew" <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v3 2/3] tools/intel_gpu_frequency: Add multi-GT
 support
Thread-Topic: [PATCH i-g-t v3 2/3] tools/intel_gpu_frequency: Add multi-GT
 support
Thread-Index: AQHcWZflfmGlX2tCQk+jQY+wPic1M7T7Fxre
Date: Thu, 20 Nov 2025 06:18:57 +0000
Message-ID: <CH0PR11MB542706DDA9AC50E8261604A498D4A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20251119204530.1357940-1-s.sebinraj@intel.com>
 <20251119204530.1357940-3-s.sebinraj@intel.com>
In-Reply-To: <20251119204530.1357940-3-s.sebinraj@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|MW4PR11MB5870:EE_
x-ms-office365-filtering-correlation-id: 725e661c-bebc-4823-2d79-08de27fcb07c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?u6ze7IzlMnc9XM/SSBXizzz/T8eKBokCkxtAE88a9jt6J7m8eaodDKud9M?=
 =?iso-8859-1?Q?Mbp3PhUQUuql9sYnr7BV8Zro7QAd6ETZ4Yfoh2Vs0q66A/vIN5mA/wpn+L?=
 =?iso-8859-1?Q?KqerfWlDo/FQExYKidohtNtvwW5ZH8wQOwgGgyYZ8sUIflOcW7c5hwoeJ8?=
 =?iso-8859-1?Q?QibtikWr/wafIBDvKOpSyIltbhpL1FVzE9c5hTBy75i6Q1ULIJKOV/hPh4?=
 =?iso-8859-1?Q?ggj/CLUGzfd2w+Z7ycGv8zgLp2PSIpscwxQWpiEDljBVfSze/GEuy7XnMS?=
 =?iso-8859-1?Q?YLlqKeK0h++1dVfoc9cBSk5Vpej5vokb6Tf32qtXUQ65Ldo3bkjpfujnOl?=
 =?iso-8859-1?Q?zFpveK9lTqwfNdvWfUGxhG8FtvQAtQa31RSndMPonY8oss9OJxASxv6orr?=
 =?iso-8859-1?Q?FhHkfdxNiW0CU5DtEPjuqNpFM44yJ4TH7vOmpNWGnQYaRlPi67Yja2BNSu?=
 =?iso-8859-1?Q?LenrRUsLpnEjZY9YVuJ9m/AqMS+QnoTpk4+sq8H6EDLoqtKJBqYQNQG8K0?=
 =?iso-8859-1?Q?3Rtig3EMehN/yC77diBdv4YlWyCOjfXxh4EikR/ydbZZvVQSvwEk87h5Ey?=
 =?iso-8859-1?Q?tBwkOlMxohSdYEi2UYICZ9/n7A2wZXOhXaiEVArx0lFEQ6h+PujtlS4fuf?=
 =?iso-8859-1?Q?Y5oLAs/7nmEn3eZdltkIF6NuUzQ6qwKGcjOb5L4Uxe8Igiuyjl9QwK6fgA?=
 =?iso-8859-1?Q?4DmvmvuVCjSvZEmN0sV3FlD/1krB8IMgLg4at/XI7IkjeQdUYHO3eqSDKz?=
 =?iso-8859-1?Q?V7gmG+kSC6ATvjyUbf3veYaAbUO5j273GXPWcNQ9OEIt+urxEtsjbOJsMA?=
 =?iso-8859-1?Q?a6ceYjpaSTeiXBYwZgDCP6Qf6PakFbzyqqR/HmmFvyn+4ArzvBij0jLtzC?=
 =?iso-8859-1?Q?DL5xZxEOSHYnXPD+Pft5LfgY6iWsHzETceG2ndFNjINCGPOO/YBIoanbRs?=
 =?iso-8859-1?Q?73OVBXTZK2xvw8V++waszBfV/WPy2ZBEIJkzQ4fNRo+kZ6cjcgtq0GQkpM?=
 =?iso-8859-1?Q?5+Tdebqbe1OcBUib7gtbCbh1kzDAbXzYUTq53SrP6PUJ916JVjsBDkjQYh?=
 =?iso-8859-1?Q?67DwKFfWLoS2txaDzZdmh2Z4Q30/kmSKEEAtDr1WoIEGGnrtU9UJNPn2VN?=
 =?iso-8859-1?Q?7vo0x7cOw0lwO9AAJK8lDURxEzFGIZx0+gZLEuXDKH5ScNpMBc0CBzSBd3?=
 =?iso-8859-1?Q?UbxHXS2zCQpxjEZdnAKyISAEjFVAmmqy7N2eAZXO09vOr5FIaAOqWJMwox?=
 =?iso-8859-1?Q?K2A6vQ80S/jq4PckBy3ENs95RgDzLpJGPXz42Dyva8G6oXhzHdwVCv64bE?=
 =?iso-8859-1?Q?NXMQVF7noH7UrLhreXI8eLrGtYDrybnGAahsRoURGOjRCAZndLbXxmMz1j?=
 =?iso-8859-1?Q?S+XJU/8HPq1AlUekClLZpu7JifCJ9cFi90k1gon7gma72qHIChWZlgZgSn?=
 =?iso-8859-1?Q?gz5kWTvk1ahJyF1RHP4UmydymLSJ/3YTzKBdbUbh6Bc6rBMepMDBZVLFZX?=
 =?iso-8859-1?Q?r/aJNDI04H4mYgpwtTWGltRFDJzI0+IV+1L1mkD1/Hdw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(8096899003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?H8oZCGX4B7kiFWJ4UhCH4r2fbqhC7kX4Y2STkThmk0Bh10heCBk9GyMbsD?=
 =?iso-8859-1?Q?ipDae9ldqCbUkKutrXkxDPNcOOk/GQ9y2Sihc0/CeywLmcAmxNxlwglpAb?=
 =?iso-8859-1?Q?2FW2Vy65zumqIuoO2wMJokwvsrEJ5Z/gnyK0AfQYR6r0pUJM5XukBYux6h?=
 =?iso-8859-1?Q?jJf3goHsF8kB0Ennxi/VFt6Tzxh5w8l74WBDuqQgsPS6bZ57P3gzGtsOrV?=
 =?iso-8859-1?Q?NtvYE5QEXWu6ufc5ZNfZH8ccDll2JzpNBsYVRlaQCgiFc85AMnMceqKKXQ?=
 =?iso-8859-1?Q?A93vjbKUqsogwGK+BLEY+eRQbK8tFA+/1tg6MUgLpR0uoDvp7rOGGmGuBn?=
 =?iso-8859-1?Q?v4tKTimbzyp9RhL/CAu0s5MqHtX9eQc7GrBPkakraTG4OiwVEpjqjNzMAz?=
 =?iso-8859-1?Q?mM7OKAG521oEBXBjvhovDQTrSocakFMljAJXLpJl5dH63FbT9QG1vNcQoQ?=
 =?iso-8859-1?Q?91gm65v+bNnqW2+Rc7Wpod38PhHYHkZlERuF8Uc+/DBPha3nr8vFHJP3eb?=
 =?iso-8859-1?Q?r7khtX1WElPALXfLJrvP7zRDhwwGKfvFfEWKietss9NgAIJyxs9EDRJfOw?=
 =?iso-8859-1?Q?yhnIYF834LzYHxIc0By1ap5xD2/H2Jpink5IV9FTbtHbxba2l/3KGpi3xR?=
 =?iso-8859-1?Q?5Ec+1NnaZN+4poaSIbDXfShGMMJuFC6kWwkh9Ikl7kdQotWaOBEsTDnmqJ?=
 =?iso-8859-1?Q?+nQG78gVmp4V4G40p2XuzoR1q2EhGtFpfqs1Korb6PBYGv1xabXqffTKMT?=
 =?iso-8859-1?Q?egSBy/4ZSw9olsRSoziOP01L4CF3xVk4lYccPnEtbMX9m+n/k6YKXp6EUR?=
 =?iso-8859-1?Q?UB/KgJXFjYwvGb/7yNNRJ/tz+27THowkm4RrGeeHqpbfLKW2Mgg3w1OdZg?=
 =?iso-8859-1?Q?wS5q8LxaHe5x8lc9x1Cf0P04O0eGegWYy3XkqrlmCyLUhXSZw+xbuw8NLq?=
 =?iso-8859-1?Q?PuUm8S7ZU2qx2GmZuUigkuJcJI8KTdllhcwx58p1SN8eaCXhPoyZhq6hzy?=
 =?iso-8859-1?Q?V4Wo1MXy5SRgC7FOYomaxd9lOf8OHw0aPR2nkv23M7by3r3RYvLCZWjqjY?=
 =?iso-8859-1?Q?sdJliTgoYRpZB47lqqTd35PRYnx5JSNaDXWouMY8/N3gaPlwqKHnJnyQl1?=
 =?iso-8859-1?Q?+RTk/3kVNZCa77X67t7+x/rToriNWsnew0EW8DBR1CR+5WK9UWJmH3ymcJ?=
 =?iso-8859-1?Q?j5xwCpqmwlFg+NBleRqGyoD7OIYcsuh1EH0kOc/pDQvmE97Ya1IeJYCFnc?=
 =?iso-8859-1?Q?loeoa7SWFW7j1nEy0V5i9LRBbcmWZlaKuBcAxOMvSWWKcJS9T8M6ht/VfA?=
 =?iso-8859-1?Q?FIBsLBDCrOnzNooyK0KYytKlUapnxFd8N9VNpl/dk+fUTCAnNM+srjLmRs?=
 =?iso-8859-1?Q?J+QVC42LhFxifR0ejHvKC8ffVPXzVTnzrhx0WU3KbtLnRQc10gB28rsWtQ?=
 =?iso-8859-1?Q?AKCC11WWuusOqAphnsfvtaV8ioBz6+44bLPsRR3igsavokSKVmpNRhrAcI?=
 =?iso-8859-1?Q?ticxdv89wjrA7omne48wcd8/XKatP2lXyNFyGukaH+QhVzNEUsSEsACoqi?=
 =?iso-8859-1?Q?P1S5ofdi0NjfFXFcWkeEJIm2vRfvdPKtRZLLlarLKS84Ld6oie7ruZprpv?=
 =?iso-8859-1?Q?4VywmKkkVzvzP2/fY46e9R/5FUPZbLaMLa?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB542706DDA9AC50E8261604A498D4ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 725e661c-bebc-4823-2d79-08de27fcb07c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 06:18:57.8306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbvUMSWZb+x2wAT8mR3o9Y/t0/HxxrTubLyUHWYaaew5krZ2VHbPh3eGvHy/tq+mEnkM7CD/0OR6LgPxGaxV2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
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

--_000_CH0PR11MB542706DDA9AC50E8261604A498D4ACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________

Hi,
Seems there is Ci.Build error with this patch, due to patch not getting app=
lied properly, I guess
I missed the rebase before pushing these patches. I'll share a v4 version w=
ith the changes
Rebased with latest sync.

Regards,
Sebin

This change enhances intel_gpu_frequency to support Intel GPUs
with multiple Graphics Technology (GT) units.

Key improvements:
- Add runtime GT detection using igt_sysfs_get_num_gt()
- New --gt/-t option to specify target GT (defaults to GT0)
- New --list/-l option to display available GTs
- Update sysfs path generation to use igt_sysfs_gt_path()
- Update the man page for new options

Usage examples:
  intel_gpu_frequency --get --gt 1     # Get GT1 frequencies
  intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency
  intel_gpu_frequency --list           # List available GTs

The tool now dynamically detects available GTs at runtime and provides
error messages when invalid GT numbers are specified. Also by default
for set / get operations it acts upon all available GTs unless
specified.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
Signed-off-by: Jeevaka Badrappan <jeevaka.badrappan@intel.com>
---
 lib/drmtest.c               |   2 +-
 man/intel_gpu_frequency.rst |  34 +++-
 tools/intel_gpu_frequency.c | 318 +++++++++++++++++++++++++++---------
 3 files changed, 269 insertions(+), 85 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 590c4671a..7311f83af 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -310,7 +310,7 @@ static void log_opened_device_path(const char *device_p=
ath)
         item->path =3D strdup(device_path);
         igt_assert(item->path);
         igt_list_add(&item->link, &opened_paths);
-       igt_info("Opened device: %s\n", item->path);
+       igt_debug("Opened device: %s\n", item->path);
 }

 /**
diff --git a/man/intel_gpu_frequency.rst b/man/intel_gpu_frequency.rst
index 92f039645..285870857 100644
--- a/man/intel_gpu_frequency.rst
+++ b/man/intel_gpu_frequency.rst
@@ -38,7 +38,8 @@ OPTIONS
     Lock frequency to the most efficient frequency.

 -g, --get
-    Get all the current frequency settings.
+    Get all the current frequency settings. Displays results
+    showing all GTs with their corresponding frequencies.

 -s FREQUENCY, --set=3DFREQUENCY
     Lock frequency to an absolute value (MHz).
@@ -55,6 +56,14 @@ OPTIONS
 -d, --defaults
     Return the system to hardware defaults.

+-t GT_NUMBER, --gt=3DGT_NUMBER
+    Specify which GT (Graphics Technology) to operate on. GT numbers start=
 from 0.
+    If not specified, operations apply to all available GTs. Use with --li=
st
+    to see available GTs.
+
+-l, --list
+    List all available GTs in the system with their sysfs paths.
+
 -h, --help
     Show help.

@@ -64,14 +73,29 @@ OPTIONS
 EXAMPLES
 =3D=3D=3D=3D=3D=3D=3D=3D

-intel_gpu_frequency -gmin,cur
-    Get the current and minimum frequency.
+intel_gpu_frequency
+    Display frequency information for all GTs in table format.
+
+intel_gpu_frequency -g
+    Get frequency settings for all GTs (displays in table format).
+
+intel_gpu_frequency --list-gts
+    List all available GTs in the system.
+
+intel_gpu_frequency --get --gt 1
+    Get frequency settings for GT1 only.

 intel_gpu_frequency -s 400
-    Lock frequency to 400Mhz.
+    Lock frequency to 400Mhz for all GTs.
+
+intel_gpu_frequency -s 400 --gt 0
+    Lock frequency to 400Mhz for GT0 only.

 intel_gpu_frequency -c max=3D750
-    Set the max frequency to 750MHz
+    Set the max frequency to 750MHz for all GTs.
+
+intel_gpu_frequency -c max=3D750 --gt 1
+    Set the max frequency to 750MHz for GT1 only.

 REPORTING BUGS
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 2cf3cabb6..aaadd0857 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -24,14 +24,17 @@
 #include <assert.h>
 #include <getopt.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <time.h>
 #include <unistd.h>

 #include "drmtest.h"
 #include "igt_device.h"
+#include "igt_sysfs.h"
 #include "intel_chipset.h"

 #define VERSION "1.0"
+#define SYSFS_PATH_MAX 96

 static int device, devid;

@@ -61,29 +64,51 @@ static struct freq_info info[] =3D {
 };

 static char *
-get_sysfs_path(const char *which)
+get_sysfs_path(int fd, int gt_id, const char *which)
 {
-       static const char fmt[] =3D "/sys/class/drm/card%1d/gt_%3s_freq_mhz=
";
-       char *path;
-       int ret;
+       static char path[SYSFS_PATH_MAX];
+       char *gt_path;
+       int path_len, ret;
+
+       gt_path =3D igt_sysfs_gt_path(fd, gt_id, path, sizeof(path));
+       if (gt_path =3D=3D NULL) {
+               fprintf(stderr, "igt_sysfs_gt_path returned NULL for GT%d\n=
", gt_id);
+               return NULL;
+       }
+       path_len =3D strlen(gt_path);
+       ret =3D snprintf(path + path_len, sizeof(path) - path_len,
+                      "/rps_%s_freq_mhz", which);

-#define STATIC_STRLEN(string) (sizeof(string) / sizeof(string [0]))
-       ret =3D asprintf(&path, fmt, device, which);
-       assert(ret =3D=3D (STATIC_STRLEN(fmt) - 3));
-#undef STATIC_STRLEN
+       if (ret >=3D sizeof(path) - path_len) {
+               fprintf(stderr, "Path truncated\n");
+               return NULL;
+       }

         return path;
 }

 static void
-initialize_freq_info(struct freq_info *freq_info)
+initialize_freq_info(struct freq_info *freq_info, int fd, int gt_id)
 {
-       if (freq_info->filp)
-               return;
+       /* Always close existing file handle and reopen for correct GT */
+       if (freq_info->filp) {
+               fclose(freq_info->filp);
+               freq_info->filp =3D NULL;
+       }

-       freq_info->path =3D get_sysfs_path(freq_info->name);
+       if (freq_info->path)
+               free(freq_info->path);
+
+       freq_info->path =3D strdup(get_sysfs_path(fd, gt_id, freq_info->nam=
e));
+       if (!freq_info->path) {
+               fprintf(stderr, "Failed to get sysfs path for %s on GT%d\n"=
,
+                       freq_info->name, gt_id);
+       }
         assert(freq_info->path);
+
         freq_info->filp =3D fopen(freq_info->path, freq_info->mode);
+       if (!freq_info->filp)
+               fprintf(stderr, "Failed to open %s\n", freq_info->path);
         assert(freq_info->filp);
 }

@@ -97,31 +122,126 @@ static void wait_freq_settle(void)
         clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
 }

-static void set_frequency(struct freq_info *freq_info, int val)
+static void set_frequency(struct freq_info *freq_info, int fd, int gt_id, =
int val)
 {
-       initialize_freq_info(freq_info);
+       initialize_freq_info(freq_info, fd, gt_id);
         rewind(freq_info->filp);
         assert(fprintf(freq_info->filp, "%d", val) > 0);

         wait_freq_settle();
 }

-static int get_frequency(struct freq_info *freq_info)
+static int get_frequency(struct freq_info *freq_info, int fd, int gt_id)
 {
         int val;

-       initialize_freq_info(freq_info);
+       initialize_freq_info(freq_info, fd, gt_id);
         rewind(freq_info->filp);
         assert(fscanf(freq_info->filp, "%d", &val)=3D=3D1);

         return val;
 }

+static void print_freq_table_header(void)
+{
+       printf("%-15s %-15s %6s %6s %6s %6s %6s %6s %3s\n",
+              "card/tile/GT", "BDF", "min", "curr", "RP1", "max", "RP0", "=
RPn", "(MHz)");
+       printf("%-15s %-15s %6s %6s %6s %6s %6s %6s\n",
+              "------------", "------------", "----", "----", "----", "---=
-", "----", "----");
+}
+
+static void print_freq_table_row(int fd, int card, int gt_id)
+{
+       char bdf[16] =3D "N/A";
+       char gt_label[16];
+       int freqs[ARRAY_SIZE(info)];
+       int i;
+
+       /* Get BDF (Bus:Device.Function) for this device */
+       igt_device_get_pci_slot_name(fd, bdf);
+
+       /* Format GT label as card/tile/GT */
+       snprintf(gt_label, sizeof(gt_label), "%d/t0/GT%d", card, gt_id);
+
+       /* Read all frequencies */
+       for (i =3D 0; i < ARRAY_SIZE(info); i++)
+               freqs[i] =3D get_frequency(&info[i], fd, gt_id);
+
+       /* Print the row: GT label, BDF, and all frequencies */
+       printf("%-15s %-15s %6d %6d %6d %6d %6d %6d\n",
+              gt_label, bdf,
+              freqs[MIN], freqs[CUR], freqs[EFF],
+              freqs[MAX], freqs[RP0], freqs[RPn]);
+}
+
+static void process_gt_frequencies(int argc, int fd, int gt_id, bool write=
, bool reader,
+                               bool *targets, int *set_freq)
+{
+       int i, try =3D 1;
+       bool fail =3D write;
+       static bool table_header_printed =3D false;
+
+       /* If we've previously locked the frequency, we need to make sure t=
o set things
+        * in the correct order, or else the operation will fail (ie. min =
=3D max =3D 200,
+        * and we set min to 300, we fail because it would try to set min >
+        * max). This can be accomplished be going either forward or revers=
e
+        * through the loop. MIN is always before MAX.
+        *
+        * XXX: Since only min and max are at play, the super lazy way is t=
o do this
+        * 3 times and if we still fail after 3, it's for real.
+        */
+again:
+       if (try > 2) {
+               fprintf(stderr, "Did not achieve desired freq on GT%d.\n", =
gt_id);
+               exit(EXIT_FAILURE);
+       }
+
+       if (write) {
+               /* only reset and set max & min act_upons flags
+                * if a read operation is also requested
+                */
+               if (reader !=3D false) {
+                       for (int j =3D 0; j < ARRAY_SIZE(info); j++)
+                               targets[j] =3D false;
+                       targets[MIN] =3D true;
+                       targets[MAX] =3D true;
+               }
+
+               for (i =3D 0; i < ARRAY_SIZE(info); i++) {
+                       if (targets[i] =3D=3D false)
+                               continue;
+
+                       set_frequency(&info[i], fd, gt_id, set_freq[i]);
+                       if (get_frequency(&info[i], fd, gt_id) !=3D set_fre=
q[i])
+                               fail =3D true;
+                       else
+                               fail =3D false;
+               }
+       }
+
+       if (fail) {
+               try++;
+               goto again;
+       }
+
+       if (reader || argc =3D=3D 1) {
+               /* Print table header only once for all GTs */
+               if (!table_header_printed) {
+                       print_freq_table_header();
+                       table_header_printed =3D true;
+               }
+
+               /* Print frequency row for this GT */
+               print_freq_table_row(fd, device, gt_id);
+       }
+}
+
 static void __attribute__((noreturn))
 usage(const char *prog)
 {
         printf("%s A program to manipulate Intel GPU frequencies.\n\n", pr=
og);
-       printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz=
]\n\n", prog);
+       printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz=
] ", prog);
+       printf("[--gt gt_number]\n\n");
         printf("Options: \n");
         printf("  -e            Lock frequency to the most efficient frequ=
ency\n");
         printf("  -g, --get     Get all the frequency settings\n");
@@ -130,13 +250,18 @@ usage(const char *prog)
         printf("  -m  --max     Lock frequency to max frequency\n");
         printf("  -i  --min     Lock frequency to min (never a good idea, =
DEBUG ONLY)\n");
         printf("  -d  --defaults  Return the system to hardware defaults\n=
");
+       printf("  -t  --gt      Specify GT number (0, 1, 2, etc.). Default:=
 0\n");
+       printf("  -l  --list    List available GTs\n");
         printf("  -h  --help    Returns this\n");
         printf("  -v  --version Version\n");
         printf("\n");
         printf("Examples:\n");
-       printf("   intel_gpu_frequency --get\t\tGet the current and minimum=
 frequency\n");
-       printf("   intel_gpu_frequency --set 400\tLock frequency to 400Mhz\=
n");
-       printf("   intel_gpu_frequency --custom max=3D750\tSet the max freq=
uency to 750MHz\n");
+       printf("   intel_gpu_frequency --get\t\t\tGet frequency settings fo=
r all GTs\n");
+       printf("   intel_gpu_frequency --get --gt 1\t\tGet frequency settin=
gs for GT1 only\n");
+       printf("   intel_gpu_frequency --set 400\t\tLock all GTs frequency =
to 400Mhz\n");
+       printf("   intel_gpu_frequency --set 400 --gt 1\t\tLock GT1 frequen=
cy to 400Mhz\n");
+       printf("   intel_gpu_frequency --custom max=3D750 --gt 0\tSet GT0 m=
ax frequency to 750MHz\n");
+       printf("   intel_gpu_frequency --list\t\t\tList all available GTs\n=
");
         printf("\n");
         printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-=
tools/-/issues\n");
         exit(EXIT_FAILURE);
@@ -151,10 +276,12 @@ version(const char *prog)

 /* Returns read or write operation */
 static bool
-parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_=
freq, bool *reader)
+parse(int argc, char *argv[], int fd, bool *act_upon, size_t act_upon_n, i=
nt *new_freq, bool *reader,
+       bool *list_gts, int *specified_gt)
 {
         int c, tmp;
         bool write =3D false;
+       bool gtt_specified =3D false;

         /* No args means -g" */
         if (argc =3D=3D 1) {
@@ -172,11 +299,13 @@ parse(int argc, char *argv[], bool *act_upon, size_t =
act_upon_n, int *new_freq,
                         { "max", no_argument, NULL, 'm' },
                         { "defaults", no_argument, NULL, 'd' },
                         { "help", no_argument, NULL, 'h' },
+                       { "gt", required_argument, NULL, 't' },
+                       { "list", no_argument, NULL, 'l' },
                         { "version", no_argument, NULL, 'v' },
                         { NULL, 0, NULL, 0}
                 };

-               c =3D getopt_long(argc, argv, "egs:c:midh", long_options, &=
option_index);
+               c =3D getopt_long(argc, argv, "egs:c:midht:lv", long_option=
s, &option_index);
                 if (c =3D=3D -1)
                         break;

@@ -233,7 +362,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t ac=
t_upon_n, int *new_freq,
                                         "FIXME: Warning efficient frequenc=
y information is incorrect.\n");
                                 exit(EXIT_FAILURE);
                         }
-                       tmp =3D get_frequency(&info[EFF]);
+                       tmp =3D get_frequency(&info[EFF], fd, *specified_gt=
 >=3D 0 ? *specified_gt : 0);
                         new_freq[MIN] =3D tmp;
                         new_freq[MAX] =3D tmp;
                         act_upon[MIN] =3D true;
@@ -241,7 +370,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t ac=
t_upon_n, int *new_freq,
                         write =3D true;
                         break;
                 case 'i': /* mIn */
-                       tmp =3D get_frequency(&info[RPn]);
+                       tmp =3D get_frequency(&info[RPn], fd,
+                                           *specified_gt >=3D 0 ? *specifi=
ed_gt : 0);
                         new_freq[MIN] =3D tmp;
                         new_freq[MAX] =3D tmp;
                         act_upon[MIN] =3D true;
@@ -249,7 +379,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t ac=
t_upon_n, int *new_freq,
                         write =3D true;
                         break;
                 case 'm': /* max */
-                       tmp =3D get_frequency(&info[RP0]);
+                       tmp =3D get_frequency(&info[RP0], fd,
+                                           *specified_gt >=3D 0 ? *specifi=
ed_gt : 0);
                         new_freq[MIN] =3D tmp;
                         new_freq[MAX] =3D tmp;
                         act_upon[MIN] =3D true;
@@ -257,12 +388,32 @@ parse(int argc, char *argv[], bool *act_upon, size_t =
act_upon_n, int *new_freq,
                         write =3D true;
                         break;
                 case 'd': /* defaults */
-                       new_freq[MIN] =3D get_frequency(&info[RPn]);
-                       new_freq[MAX] =3D get_frequency(&info[RP0]);
+                       new_freq[MIN] =3D get_frequency(&info[RPn], fd,
+                                                     *specified_gt >=3D 0 =
? *specified_gt : 0);
+                       new_freq[MAX] =3D get_frequency(&info[RP0], fd,
+                                                     *specified_gt >=3D 0 =
? *specified_gt : 0);
                         act_upon[MIN] =3D true;
                         act_upon[MAX] =3D true;
                         write =3D true;
                         break;
+               case 't': /* gt */
+                       if (!optarg)
+                               usage(argv[0]);
+
+                       if (gtt_specified) {
+                               fprintf(stderr, "Only one GT may be specifi=
ed at a time\n");
+                               exit(EXIT_FAILURE);
+                       }
+                       *specified_gt =3D atoi(optarg);
+                       if (*specified_gt < 0) {
+                               fprintf(stderr, "Invalid GT number: %d\n", =
*specified_gt);
+                               exit(EXIT_FAILURE);
+                       }
+                       gtt_specified =3D true;
+                       break;
+               case 'l': /* list */
+                       *list_gts =3D true;
+                       break;
                 case 'v':
                         version(argv[0]);
                         exit(0);
@@ -276,73 +427,82 @@ done:
         return write;
 }

-int main(int argc, char *argv[])
+static void list_available_gts(int fd, int num_gts)
 {
+       int i;

-       bool write, reader =3D false, fail, targets[MAX+1] =3D {false};
-       int i, fd, try =3D 1, set_freq[MAX+1] =3D {0};
+       printf("Available GTs: %d\n", num_gts);
+       for (i =3D 0; i < num_gts; i++) {
+               char path[SYSFS_PATH_MAX];

-       fd =3D __drm_open_driver(DRIVER_INTEL);
-       devid =3D intel_get_drm_devid(fd);
-       device =3D igt_device_get_card_index(fd);
-       close(fd);
-
-       write =3D parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq,=
 &reader);
-       fail =3D write;
-
-       /* If we've previously locked the frequency, we need to make sure t=
o set things
-        * in the correct order, or else the operation will fail (ie. min =
=3D max =3D 200,
-        * and we set min to 300, we fail because it would try to set min >
-        * max). This can be accomplished be going either forward or revers=
e
-        * through the loop. MIN is always before MAX.
-        *
-        * XXX: Since only min and max are at play, the super lazy way is t=
o do this
-        * 3 times and if we still fail after 3, it's for real.
-        */
-again:
-       if (try > 2) {
-               fprintf(stderr, "Did not achieve desired freq.\n");
-               exit(EXIT_FAILURE);
+               if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))
+                       printf("  GT%d: %s\n", i, path);
         }
+}

-       if (write) {
-               /* only reset and set max & min act_upons flags if a read o=
peration is also requested */
-               if (reader !=3D false) {
-                       for (int j =3D 0; j < ARRAY_SIZE(targets); j++)
-                               targets[j] =3D false;
-                       targets[MIN] =3D true;
-                       targets[MAX] =3D true;
-               }
-
-               for (i =3D 0; i < ARRAY_SIZE(targets); i++) {
-                       if (targets[i] =3D=3D false)
-                               continue;
-                       set_frequency(&info[i], set_freq[i]);
-                       if (get_frequency(&info[i]) !=3D set_freq[i])
-                               fail =3D true;
-                       else
-                               fail =3D false;
+static void validate_specified_gt(int fd, int specified_gt, int num_gts)
+{
+       if (specified_gt >=3D 0) {
+               if (specified_gt >=3D num_gts) {
+                       fprintf(stderr, "Error: GT%d does not exist. Availa=
ble GTs: 0-%d\n",
+                               specified_gt, num_gts - 1);
+                       close(fd);
+                       exit(EXIT_FAILURE);
                 }
+               igt_debug("Operating on GT%d (Total GTs: %d)\n", specified_=
gt, num_gts);
+       } else {
+               igt_debug("Operating on all GTs (Total GTs: %d)\n", num_gts=
);
         }
+}

-       if (fail) {
-               try++;
-               goto again;
-       }
+static void execute_frequency_operations(int argc, int fd, int specified_g=
t, bool write, bool reader,
+                                                               bool *targe=
ts, int *set_freq)
+{
+       int target_gt;

-       if (reader || argc =3D=3D 1) {
-               for (i =3D 0; i < ARRAY_SIZE(targets); i++) {
-                       /* loop for all frequencies for get operations */
-                       printf("%s: %d MHz\n", info[i].name, get_frequency(=
&info[i]));
+       if (specified_gt >=3D 0) {
+               /* Process single specified GT */
+               process_gt_frequencies(argc, fd, specified_gt, write, reade=
r, targets, set_freq);
+       } else {
+               /* Process all GTs using for_each_gt pattern */
+               int gt_dir;
+
+               i915_for_each_gt(fd, gt_dir, target_gt) {
+                       process_gt_frequencies(argc, fd, target_gt, write, =
reader, targets, set_freq);
                 }
         }
+}
+
+int main(int argc, char *argv[])
+{
+
+       bool write, reader =3D false, targets[MAX+1] =3D {false}, list_gts =
=3D false;
+       int i, fd, set_freq[MAX+1] =3D {0}, num_gts;
+       int specified_gt =3D -1;
+
+       fd =3D drm_open_driver(DRIVER_INTEL);
+       devid =3D intel_get_drm_devid(fd);
+       device =3D igt_device_get_card_index(fd);
+       num_gts =3D igt_sysfs_get_num_gt(fd);
+
+       write =3D parse(argc, argv, fd, targets, ARRAY_SIZE(targets), set_f=
req, &reader,
+                      &list_gts, &specified_gt);
+
+       /* Handle --list option */
+       if (list_gts)
+               list_available_gts(fd, num_gts);
+
+       /* Validate specified GT */
+       validate_specified_gt(fd, specified_gt, num_gts);
+
+       /* Process frequencies for specified GT or all GTs */
+       execute_frequency_operations(argc, fd, specified_gt, write, reader,=
 targets, set_freq);

         for (i =3D 0; i < ARRAY_SIZE(targets); i++) {
-               if (info[i].filp) {
+               if (info[i].filp)
                         fclose(info[i].filp);
-                       free(info[i].path);
-               }
         }

+       close(fd);
         return EXIT_SUCCESS;
 }
--
2.43.0


--_000_CH0PR11MB542706DDA9AC50E8261604A498D4ACH0PR11MB5427namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Seems there is Ci.Build error with this patch, due to patch not getting app=
lied properly, I guess</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I missed the rebase before pushing these patches. I'll share a v4 version w=
ith the changes</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Rebased with latest sync.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sebin</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-size: 11pt;">This change enhances intel_gpu_frequency to=
 support Intel GPUs<br>
with multiple Graphics Technology (GT) units.<br>
<br>
Key improvements:<br>
- Add runtime GT detection using igt_sysfs_get_num_gt()<br>
- New --gt/-t option to specify target GT (defaults to GT0)<br>
- New --list/-l option to display available GTs<br>
- Update sysfs path generation to use igt_sysfs_gt_path()<br>
- Update the man page for new options<br>
<br>
Usage examples:<br>
&nbsp; intel_gpu_frequency --get --gt 1&nbsp;&nbsp;&nbsp;&nbsp; # Get GT1 f=
requencies<br>
&nbsp; intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency<br>
&nbsp; intel_gpu_frequency --list&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; # List available GTs<br>
<br>
The tool now dynamically detects available GTs at runtime and provides<br>
error messages when invalid GT numbers are specified. Also by default<br>
for set / get operations it acts upon all available GTs unless<br>
specified.<br>
<br>
Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
Signed-off-by: Jeevaka Badrappan &lt;jeevaka.badrappan@intel.com&gt;<br>
---<br>
&nbsp;lib/drmtest.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;man/intel_gpu_frequency.rst |&nbsp; 34 +++-<br>
&nbsp;tools/intel_gpu_frequency.c | 318 +++++++++++++++++++++++++++--------=
-<br>
&nbsp;3 files changed, 269 insertions(+), 85 deletions(-)<br>
<br>
diff --git a/lib/drmtest.c b/lib/drmtest.c<br>
index 590c4671a..7311f83af 100644<br>
--- a/lib/drmtest.c<br>
+++ b/lib/drmtest.c<br>
@@ -310,7 +310,7 @@ static void log_opened_device_path(const char *device_p=
ath)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; item-&gt;path =3D strdup(d=
evice_path);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(item-&gt;path);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_list_add(&amp;item-&gt=
;link, &amp;opened_paths);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Opened device: %s\n&qu=
ot;, item-&gt;path);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Opened device: %s\n&q=
uot;, item-&gt;path);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
diff --git a/man/intel_gpu_frequency.rst b/man/intel_gpu_frequency.rst<br>
index 92f039645..285870857 100644<br>
--- a/man/intel_gpu_frequency.rst<br>
+++ b/man/intel_gpu_frequency.rst<br>
@@ -38,7 +38,8 @@ OPTIONS<br>
&nbsp;&nbsp;&nbsp;&nbsp; Lock frequency to the most efficient frequency.<br=
>
&nbsp;<br>
&nbsp;-g, --get<br>
-&nbsp;&nbsp;&nbsp; Get all the current frequency settings.<br>
+&nbsp;&nbsp;&nbsp; Get all the current frequency settings. Displays result=
s<br>
+&nbsp;&nbsp;&nbsp; showing all GTs with their corresponding frequencies.<b=
r>
&nbsp;<br>
&nbsp;-s FREQUENCY, --set=3DFREQUENCY<br>
&nbsp;&nbsp;&nbsp;&nbsp; Lock frequency to an absolute value (MHz).<br>
@@ -55,6 +56,14 @@ OPTIONS<br>
&nbsp;-d, --defaults<br>
&nbsp;&nbsp;&nbsp;&nbsp; Return the system to hardware defaults.<br>
&nbsp;<br>
+-t GT_NUMBER, --gt=3DGT_NUMBER<br>
+&nbsp;&nbsp;&nbsp; Specify which GT (Graphics Technology) to operate on. G=
T numbers start from 0.<br>
+&nbsp;&nbsp;&nbsp; If not specified, operations apply to all available GTs=
. Use with --list<br>
+&nbsp;&nbsp;&nbsp; to see available GTs.<br>
+<br>
+-l, --list<br>
+&nbsp;&nbsp;&nbsp; List all available GTs in the system with their sysfs p=
aths.<br>
+<br>
&nbsp;-h, --help<br>
&nbsp;&nbsp;&nbsp;&nbsp; Show help.<br>
&nbsp;<br>
@@ -64,14 +73,29 @@ OPTIONS<br>
&nbsp;EXAMPLES<br>
&nbsp;=3D=3D=3D=3D=3D=3D=3D=3D<br>
&nbsp;<br>
-intel_gpu_frequency -gmin,cur<br>
-&nbsp;&nbsp;&nbsp; Get the current and minimum frequency.<br>
+intel_gpu_frequency<br>
+&nbsp;&nbsp;&nbsp; Display frequency information for all GTs in table form=
at.<br>
+<br>
+intel_gpu_frequency -g<br>
+&nbsp;&nbsp;&nbsp; Get frequency settings for all GTs (displays in table f=
ormat).<br>
+<br>
+intel_gpu_frequency --list-gts<br>
+&nbsp;&nbsp;&nbsp; List all available GTs in the system.<br>
+<br>
+intel_gpu_frequency --get --gt 1<br>
+&nbsp;&nbsp;&nbsp; Get frequency settings for GT1 only.<br>
&nbsp;<br>
&nbsp;intel_gpu_frequency -s 400<br>
-&nbsp;&nbsp;&nbsp; Lock frequency to 400Mhz.<br>
+&nbsp;&nbsp;&nbsp; Lock frequency to 400Mhz for all GTs.<br>
+<br>
+intel_gpu_frequency -s 400 --gt 0<br>
+&nbsp;&nbsp;&nbsp; Lock frequency to 400Mhz for GT0 only.<br>
&nbsp;<br>
&nbsp;intel_gpu_frequency -c max=3D750<br>
-&nbsp;&nbsp;&nbsp; Set the max frequency to 750MHz<br>
+&nbsp;&nbsp;&nbsp; Set the max frequency to 750MHz for all GTs.<br>
+<br>
+intel_gpu_frequency -c max=3D750 --gt 1<br>
+&nbsp;&nbsp;&nbsp; Set the max frequency to 750MHz for GT1 only.<br>
&nbsp;<br>
&nbsp;REPORTING BUGS<br>
&nbsp;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c<br>
index 2cf3cabb6..aaadd0857 100644<br>
--- a/tools/intel_gpu_frequency.c<br>
+++ b/tools/intel_gpu_frequency.c<br>
@@ -24,14 +24,17 @@<br>
&nbsp;#include &lt;assert.h&gt;<br>
&nbsp;#include &lt;getopt.h&gt;<br>
&nbsp;#include &lt;stdio.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
&nbsp;#include &lt;time.h&gt;<br>
&nbsp;#include &lt;unistd.h&gt;<br>
&nbsp;<br>
&nbsp;#include &quot;drmtest.h&quot;<br>
&nbsp;#include &quot;igt_device.h&quot;<br>
+#include &quot;igt_sysfs.h&quot;<br>
&nbsp;#include &quot;intel_chipset.h&quot;<br>
&nbsp;<br>
&nbsp;#define VERSION &quot;1.0&quot;<br>
+#define SYSFS_PATH_MAX 96<br>
&nbsp;<br>
&nbsp;static int device, devid;<br>
&nbsp;<br>
@@ -61,29 +64,51 @@ static struct freq_info info[] =3D {<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static char *<br>
-get_sysfs_path(const char *which)<br>
+get_sysfs_path(int fd, int gt_id, const char *which)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const char fmt[] =3D &quot;/sy=
s/class/drm/card%1d/gt_%3s_freq_mhz&quot;;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *path;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static char path[SYSFS_PATH_MAX];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *gt_path;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int path_len, ret;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt_path =3D igt_sysfs_gt_path(fd, gt_=
id, path, sizeof(path));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gt_path =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fprintf(stderr, &quot;igt_sysfs_gt_path returned NULL for GT%d\n=
&quot;, gt_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path_len =3D strlen(gt_path);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D snprintf(path + path_len, siz=
eof(path) - path_len,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/rps_%s_freq_mhz=
&quot;, which);<br>
&nbsp;<br>
-#define STATIC_STRLEN(string) (sizeof(string) / sizeof(string [0]))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D asprintf(&amp;path, fmt, devi=
ce, which);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(ret =3D=3D (STATIC_STRLEN(fmt)=
 - 3));<br>
-#undef STATIC_STRLEN<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret &gt;=3D sizeof(path) - path_l=
en) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fprintf(stderr, &quot;Path truncated\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return path;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static void<br>
-initialize_freq_info(struct freq_info *freq_info)<br>
+initialize_freq_info(struct freq_info *freq_info, int fd, int gt_id)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info-&gt;filp)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Always close existing file handle =
and reopen for correct GT */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info-&gt;filp) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fclose(freq_info-&gt;filp);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; freq_info-&gt;filp =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_info-&gt;path =3D get_sysfs_path=
(freq_info-&gt;name);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info-&gt;path)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; free(freq_info-&gt;path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_info-&gt;path =3D strdup(get_sys=
fs_path(fd, gt_id, freq_info-&gt;name));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!freq_info-&gt;path) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fprintf(stderr, &quot;Failed to get sysfs path for %s on GT%d\n&=
quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_info-&gt;na=
me, gt_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(freq_info-&gt;path)=
;<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_info-&gt;filp =3D fop=
en(freq_info-&gt;path, freq_info-&gt;mode);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!freq_info-&gt;filp)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fprintf(stderr, &quot;Failed to open %s\n&quot;, freq_info-&gt;p=
ath);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(freq_info-&gt;filp)=
;<br>
&nbsp;}<br>
&nbsp;<br>
@@ -97,31 +122,126 @@ static void wait_freq_settle(void)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock_nanosleep(CLOCK_MONO=
TONIC, 0, &amp;ts, NULL);<br>
&nbsp;}<br>
&nbsp;<br>
-static void set_frequency(struct freq_info *freq_info, int val)<br>
+static void set_frequency(struct freq_info *freq_info, int fd, int gt_id, =
int val)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; initialize_freq_info(freq_info);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; initialize_freq_info(freq_info, fd, g=
t_id);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rewind(freq_info-&gt;filp)=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fprintf(freq_info-&=
gt;filp, &quot;%d&quot;, val) &gt; 0);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wait_freq_settle();<br>
&nbsp;}<br>
&nbsp;<br>
-static int get_frequency(struct freq_info *freq_info)<br>
+static int get_frequency(struct freq_info *freq_info, int fd, int gt_id)<b=
r>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int val;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; initialize_freq_info(freq_info);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; initialize_freq_info(freq_info, fd, g=
t_id);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rewind(freq_info-&gt;filp)=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fscanf(freq_info-&g=
t;filp, &quot;%d&quot;, &amp;val)=3D=3D1);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return val;<br>
&nbsp;}<br>
&nbsp;<br>
+static void print_freq_table_header(void)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;%-15s %-15s %6s %6s %6s =
%6s %6s %6s %3s\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;card/tile/GT&quot;, &quot;BDF&quot;, &quot;min&quot;, &quot;curr=
&quot;, &quot;RP1&quot;, &quot;max&quot;, &quot;RP0&quot;, &quot;RPn&quot;,=
 &quot;(MHz)&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;%-15s %-15s %6s %6s %6s =
%6s %6s %6s\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;------------&quot;, &quot;------------&quot;, &quot;----&quot;, =
&quot;----&quot;, &quot;----&quot;, &quot;----&quot;, &quot;----&quot;, &qu=
ot;----&quot;);<br>
+}<br>
+<br>
+static void print_freq_table_row(int fd, int card, int gt_id)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char bdf[16] =3D &quot;N/A&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char gt_label[16];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int freqs[ARRAY_SIZE(info)];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get BDF (Bus:Device.Function) for =
this device */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_device_get_pci_slot_name(fd, bdf)=
;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Format GT label as card/tile/GT */=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(gt_label, sizeof(gt_label), =
&quot;%d/t0/GT%d&quot;, card, gt_id);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Read all frequencies */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(info)=
; i++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; freqs[i] =3D get_frequency(&amp;info[i], fd, gt_id);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Print the row: GT label, BDF, and =
all frequencies */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;%-15s %-15s %6d %6d %6d =
%6d %6d %6d\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; gt_label, bdf,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; freqs[MIN], freqs[CUR], freqs[EFF],<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; freqs[MAX], freqs[RP0], freqs[RPn]);<br>
+}<br>
+<br>
+static void process_gt_frequencies(int argc, int fd, int gt_id, bool write=
, bool reader,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool *targets, int *set_freq)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, try =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool fail =3D write;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static bool table_header_printed =3D =
false;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If we've previously locked the fre=
quency, we need to make sure to set things<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * in the correct order, or else=
 the operation will fail (ie. min =3D max =3D 200,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * and we set min to 300, we fai=
l because it would try to set min &gt;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * max). This can be accomplishe=
d be going either forward or reverse<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * through the loop. MIN is alwa=
ys before MAX.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * XXX: Since only min and max a=
re at play, the super lazy way is to do this<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 3 times and if we still fail =
after 3, it's for real.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+again:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (try &gt; 2) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fprintf(stderr, &quot;Did not achieve desired freq on GT%d.\n&qu=
ot;, gt_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; exit(EXIT_FAILURE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* only reset and set max &amp; min act_upons flags<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; * if a read operation is also requested<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (reader !=3D false) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int j =3D 0=
; j &lt; ARRAY_SIZE(info); j++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targets[j] =3D false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targets[MIN] =3D=
 true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targets[MAX] =3D=
 true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(info); i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (targets[i] =
=3D=3D false)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_frequency(&a=
mp;info[i], fd, gt_id, set_freq[i]);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (get_frequenc=
y(&amp;info[i], fd, gt_id) !=3D set_freq[i])<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fail =3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fail =3D false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fail) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; try++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto again;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (reader || argc =3D=3D 1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Print table header only once for all GTs */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!table_header_printed) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print_freq_table=
_header();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_header_pri=
nted =3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Print frequency row for this GT */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; print_freq_table_row(fd, device, gt_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
+<br>
&nbsp;static void __attribute__((noreturn))<br>
&nbsp;usage(const char *prog)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;%s A program =
to manipulate Intel GPU frequencies.\n\n&quot;, prog);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Usage: %s [-e] [--min | =
--max] [--get] [--set frequency_mhz]\n\n&quot;, prog);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Usage: %s [-e] [--min | =
--max] [--get] [--set frequency_mhz] &quot;, prog);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;[--gt gt_number]\n\n&quo=
t;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Options: \n&q=
uot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -e&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lock frequen=
cy to the most efficient frequency\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -g, --=
get&nbsp;&nbsp;&nbsp;&nbsp; Get all the frequency settings\n&quot;);<br>
@@ -130,13 +250,18 @@ usage(const char *prog)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -m&nbs=
p; --max&nbsp;&nbsp;&nbsp;&nbsp; Lock frequency to max frequency\n&quot;);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -i&nbs=
p; --min&nbsp;&nbsp;&nbsp;&nbsp; Lock frequency to min (never a good idea, =
DEBUG ONLY)\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -d&nbs=
p; --defaults&nbsp; Return the system to hardware defaults\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -t&nbsp; --gt&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; Specify GT number (0, 1, 2, etc.). Default: 0\n&=
quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -l&nbsp; --list&n=
bsp;&nbsp;&nbsp; List available GTs\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -h&nbs=
p; --help&nbsp;&nbsp;&nbsp; Returns this\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp; -v&nbs=
p; --version Version\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;\n&quot;);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Examples:\n&q=
uot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_f=
requency --get\t\tGet the current and minimum frequency\n&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_f=
requency --set 400\tLock frequency to 400Mhz\n&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_f=
requency --custom max=3D750\tSet the max frequency to 750MHz\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_f=
requency --get\t\t\tGet frequency settings for all GTs\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_f=
requency --get --gt 1\t\tGet frequency settings for GT1 only\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_f=
requency --set 400\t\tLock all GTs frequency to 400Mhz\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_f=
requency --set 400 --gt 1\t\tLock GT1 frequency to 400Mhz\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_f=
requency --custom max=3D750 --gt 0\tSet GT0 max frequency to 750MHz\n&quot;=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nbsp;&nbsp; intel_gpu_f=
requency --list\t\t\tList all available GTs\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;\n&quot;);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Report bugs t=
o <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAc7761bed-2d=
2a-c7f6-6bb1-65c95a775bb7" href=3D"https://gitlab.freedesktop.org/drm/igt-g=
pu-tools/-/issues\n&quot;)">
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n&quot;)</a>;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
@@ -151,10 +276,12 @@ version(const char *prog)<br>
&nbsp;<br>
&nbsp;/* Returns read or write operation */<br>
&nbsp;static bool<br>
-parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_=
freq, bool *reader)<br>
+parse(int argc, char *argv[], int fd, bool *act_upon, size_t act_upon_n, i=
nt *new_freq, bool *reader,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool *list_gts, int *specified_gt)<br=
>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int c, tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool write =3D false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool gtt_specified =3D false;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* No args means -g&quot; =
*/<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (argc =3D=3D 1) {<br>
@@ -172,11 +299,13 @@ parse(int argc, char *argv[], bool *act_upon, size_t =
act_upon_n, int *new_freq,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &qu=
ot;max&quot;, no_argument, NULL, 'm' },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &qu=
ot;defaults&quot;, no_argument, NULL, 'd' },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &qu=
ot;help&quot;, no_argument, NULL, 'h' },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;gt&quot;=
, required_argument, NULL, 't' },<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;list&quo=
t;, no_argument, NULL, 'l' },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &qu=
ot;version&quot;, no_argument, NULL, 'v' },<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { NUL=
L, 0, NULL, 0}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; };<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; c =3D getopt_long(argc, argv, &quot;egs:c:midh&quot;, long_optio=
ns, &amp;option_index);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; c =3D getopt_long(argc, argv, &quot;egs:c:midht:lv&quot;, long_o=
ptions, &amp;option_index);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (c =3D=3D -1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&nbsp;<br>
@@ -233,7 +362,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t ac=
t_upon_n, int *new_freq,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &quot;FIXME: Warning efficient frequency information is inc=
orrect.\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_freq=
uency(&amp;info[EFF]);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_freq=
uency(&amp;info[EFF], fd, *specified_gt &gt;=3D 0 ? *specified_gt : 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_f=
req[MIN] =3D tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_f=
req[MAX] =3D tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_u=
pon[MIN] =3D true;<br>
@@ -241,7 +370,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t ac=
t_upon_n, int *new_freq,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write=
 =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; case 'i': /* mIn */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_freq=
uency(&amp;info[RPn]);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_freq=
uency(&amp;info[RPn], fd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; *specified_gt &gt;=3D 0 ? *specified_gt : 0);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_f=
req[MIN] =3D tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_f=
req[MAX] =3D tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_u=
pon[MIN] =3D true;<br>
@@ -249,7 +379,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t ac=
t_upon_n, int *new_freq,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write=
 =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; case 'm': /* max */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_freq=
uency(&amp;info[RP0]);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D get_freq=
uency(&amp;info[RP0], fd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; *specified_gt &gt;=3D 0 ? *specified_gt : 0);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_f=
req[MIN] =3D tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_f=
req[MAX] =3D tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_u=
pon[MIN] =3D true;<br>
@@ -257,12 +388,32 @@ parse(int argc, char *argv[], bool *act_upon, size_t =
act_upon_n, int *new_freq,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write=
 =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; case 'd': /* defaults */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_freq[MIN] =
=3D get_frequency(&amp;info[RPn]);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_freq[MAX] =
=3D get_frequency(&amp;info[RP0]);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_freq[MIN] =
=3D get_frequency(&amp;info[RPn], fd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; *specified_gt &gt;=3D 0 ? *specified_gt : 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_freq[MAX] =
=3D get_frequency(&amp;info[RP0], fd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; *specified_gt &gt;=3D 0 ? *specified_gt : 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_u=
pon[MIN] =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_u=
pon[MAX] =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write=
 =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case 't': /* gt */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!optarg)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usage(argv[0]);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gtt_specifie=
d) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;Only one GT may be sp=
ecified at a time\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *specified_gt =
=3D atoi(optarg);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*specified_g=
t &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;Invalid GT number: %d=
\n&quot;, *specified_gt);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gtt_specified =
=3D true;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case 'l': /* list */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *list_gts =3D tr=
ue;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; case 'v':<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; versi=
on(argv[0]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(=
0);<br>
@@ -276,73 +427,82 @@ done:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return write;<br>
&nbsp;}<br>
&nbsp;<br>
-int main(int argc, char *argv[])<br>
+static void list_available_gts(int fd, int num_gts)<br>
&nbsp;{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool write, reader =3D false, fail, t=
argets[MAX+1] =3D {false};<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, fd, try =3D 1, set_freq[MAX+1]=
 =3D {0};<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;Available GTs: %d\n&quot=
;, num_gts);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; num_gts; i++) {<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; char path[SYSFS_PATH_MAX];<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D __drm_open_driver(DRIVER_INTEL=
);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; devid =3D intel_get_drm_devid(fd);<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device =3D igt_device_get_card_index(=
fd);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write =3D parse(argc, argv, targets, =
ARRAY_SIZE(targets), set_freq, &amp;reader);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fail =3D write;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If we've previously locked the fre=
quency, we need to make sure to set things<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * in the correct order, or else=
 the operation will fail (ie. min =3D max =3D 200,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * and we set min to 300, we fai=
l because it would try to set min &gt;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * max). This can be accomplishe=
d be going either forward or reverse<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * through the loop. MIN is alwa=
ys before MAX.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * XXX: Since only min and max a=
re at play, the super lazy way is to do this<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 3 times and if we still fail =
after 3, it's for real.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-again:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (try &gt; 2) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fprintf(stderr, &quot;Did not achieve desired freq.\n&quot;);<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; exit(EXIT_FAILURE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;&nb=
sp; GT%d: %s\n&quot;, i, path);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* only reset and set max &amp; min act_upons flags if a read op=
eration is also requested */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (reader !=3D false) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int j =3D 0=
; j &lt; ARRAY_SIZE(targets); j++)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targets[j] =3D false;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targets[MIN] =3D=
 true;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; targets[MAX] =3D=
 true;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(targets); i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (targets[i] =
=3D=3D false)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_frequency(&a=
mp;info[i], set_freq[i]);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (get_frequenc=
y(&amp;info[i]) !=3D set_freq[i])<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fail =3D true;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fail =3D false;<br>
+static void validate_specified_gt(int fd, int specified_gt, int num_gts)<b=
r>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (specified_gt &gt;=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (specified_gt &gt;=3D num_gts) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, =
&quot;Error: GT%d does not exist. Available GTs: 0-%d\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; specified_gt, num_gts - 1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILUR=
E);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_debug(&quot;Operating on GT%d (Total GTs: %d)\n&quot;, speci=
fied_gt, num_gts);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_debug(&quot;Operating on all GTs (Total GTs: %d)\n&quot;, nu=
m_gts);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fail) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; try++;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto again;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+static void execute_frequency_operations(int argc, int fd, int specified_g=
t, bool write, bool reader,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b=
ool *targets, int *set_freq)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int target_gt;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (reader || argc =3D=3D 1) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(targets); i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* loop for all =
frequencies for get operations */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(&quot;%s:=
 %d MHz\n&quot;, info[i].name, get_frequency(&amp;info[i]));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (specified_gt &gt;=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Process single specified GT */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; process_gt_frequencies(argc, fd, specified_gt, write, reader, ta=
rgets, set_freq);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Process all GTs using for_each_gt pattern */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int gt_dir;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; i915_for_each_gt(fd, gt_dir, target_gt) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process_gt_frequ=
encies(argc, fd, target_gt, write, reader, targets, set_freq);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+}<br>
+<br>
+int main(int argc, char *argv[])<br>
+{<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool write, reader =3D false, targets=
[MAX+1] =3D {false}, list_gts =3D false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, fd, set_freq[MAX+1] =3D {0}, n=
um_gts;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int specified_gt =3D -1;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D drm_open_driver(DRIVER_INTEL);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; devid =3D intel_get_drm_devid(fd);<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device =3D igt_device_get_card_index(=
fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_gts =3D igt_sysfs_get_num_gt(fd);=
<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write =3D parse(argc, argv, fd, targe=
ts, ARRAY_SIZE(targets), set_freq, &amp;reader,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;list_gts, &amp;sp=
ecified_gt);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Handle --list option */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (list_gts)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; list_available_gts(fd, num_gts);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Validate specified GT */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; validate_specified_gt(fd, specified_g=
t, num_gts);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Process frequencies for specified =
GT or all GTs */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execute_frequency_operations(argc, fd=
, specified_gt, write, reader, targets, set_freq);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY=
_SIZE(targets); i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (info[i].filp) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (info[i].filp)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclos=
e(info[i].filp);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(info[i].pat=
h);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return EXIT_SUCCESS;<br>
&nbsp;}<br>
--<br>
2.43.0<br>
<br>
</div>
</body>
</html>

--_000_CH0PR11MB542706DDA9AC50E8261604A498D4ACH0PR11MB5427namp_--
