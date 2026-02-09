Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C76EE0AEF
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72EA10E338;
	Mon,  9 Feb 2026 08:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnAGw78z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FA610E34D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770624575; x=1802160575;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nZTKC+1SwyAo+kDaDQAHasq/d8ipdGWR48G687qIWdA=;
 b=SnAGw78zNX0eolTJxID8jo8XxrdeQLgjil33YIEvPKDgS/JewJxMlVAo
 3Eb8XL8pF0jtG0bw2etscyvw1wEM9iNHJX8zPBfAW8YZaeCJABiC2L/nk
 a8A4z6nhGeXI7ERcSGUilmzc73xJz3J7cr+x1MkcyVdgvD7HQMrAzR5aT
 jGMQcbghaaWygbHJzy0oDeVHSnHBQYsftD6M8a7tMCsX2cl0hsId7FrdW
 Zsk8ItwhbimbSQhPLcja9Sf8/YLFgeWnXVn0wtTnfOSiRLMZZA6jsoQQv
 LvZM1mMLPO5BsB73D8+bsJZtbPyOJEFF9yzDUiajoBVxr7ZPaUzu/dYfG A==;
X-CSE-ConnectionGUID: R2FKb8IZQEGOemqWzhzVGg==
X-CSE-MsgGUID: rQSux//hTvuF0Wxzd+lLUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82464924"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="82464924"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:09:35 -0800
X-CSE-ConnectionGUID: bBg+XejKRlCcHX0bwWbRog==
X-CSE-MsgGUID: UMiOJRQ/SQqOKJp7zaef0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211249692"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:09:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:09:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 00:09:33 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:09:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2nt5KptL+oO0SQA9hYwj3vHetQ+LJeSvtBcfop++YiWS6cOoYtrBBEiJpd/yDQB7he63yzFhHi/lRQcWxeVEOFi8NukuKk7ehHhL/Q6arUKGfxwegOYruxrifvLYhdixBwZ/gUI79J3ilQ17aLu696vuCh7wiDja8Wv3kCZvmdBS7SU4L3GIqLiim6E7TXzI5B5+9DW2KhJ+gIbYkpbzUIwI0ClDYQ+PrhSihGuniQImkwx8RsUKV9+ebfXPRYY5T40yYxb+TNSK9UpJMvxN3aHu6McQMyedPFjRFwkcbQp98jZOI2ynpnlXTVhRcsWmANfEvpBPkjOR8YN4571QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aw8UOTJ9UVKupowly6B83UQYyLS+m/8lCj8+b+cOEI=;
 b=QESM2POyIdAfbjYJwwE8SPYnc5ifvSLseplPUL8Yi8hk5i9ea/sNUlRWQ3BkRHLHvA2lZENLyvCkpcEHnBp6qMITo4A+xA58Z3or+kViPUxxfw18TiD5VPeyMVgjPAwtlzFEmrQIv3PfjpyIvFmZucX23LP2L0dBFhXzZ4FDjjgcamr8UEsBqJia9ztNHq7hC1VFUhMYubP0+Lououk1FaV44a9PXyKFtcs/ZZMyKRRWt5Q9ResIlyW0hMBNI0VMhUQr8zCJ0N9E10/59qg5IWlQg1xYYn9f+r6wYzicjYxbDD62pQs6HAkvaoh6fW1ch3PkEXr5ufL1dM87OUR7rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 08:09:26 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 08:09:26 +0000
Message-ID: <b99261d0-08da-410c-99f3-c558837f5539@intel.com>
Date: Mon, 9 Feb 2026 13:39:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v11 2/2] tests/intel/xe_pm_residency: Add subtest
 for ASPM Link state residency
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20260204183747.1960879-1-karthik.poosa@intel.com>
 <20260204183747.1960879-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260204183747.1960879-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0212.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::9) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL1PR11MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b15fe1b-a363-40a8-554a-08de67b28aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVZDb3Q5MUxra3hwWmdQeUR3dTVoR2FQVHhmcFRiTXd0UFVDQ1FKOWo2SnpW?=
 =?utf-8?B?V2VkK2dtYVYrcVFYK2s5SHYvalA2dUIvVlNobVNPL1pTQlN2eFZ6RGl0a05j?=
 =?utf-8?B?YUlXV0hxQmZiZElSVzdzYkRZRW96Z0Q5SjFTMjFwcjVXbVdlMGJSYW85UTg0?=
 =?utf-8?B?ZE1iNW5YZFNFWHR2R2dHU3NzSVRaVnRQMkFyMnY4R0ZXcEpFNjBmUytReklw?=
 =?utf-8?B?cXpYQ2FRNUpTOXR0THZhSTM1aExNUkZ6cTNacTY2cnhMc2RxT2NaTlo3UHpQ?=
 =?utf-8?B?dkNxckYyLzhwSHpxcHBSeFZZazdPSmxpRlpZWWVmYVdHYnJTWjdFUW1UdEhk?=
 =?utf-8?B?NzFjNUlWMjJ5NjNPaGZiVU16TVhncGNxTkh3QUROaFlFVG50bnNNS05zRnZP?=
 =?utf-8?B?M1V6R0tiZkdid0d4c3I5SisxakVLQzZIbm8xVWdsdUJyZDZFUWV4VGtRaUNE?=
 =?utf-8?B?UFFEekxuaXg3eEcwK0ZaNnE2a3dBR2dTNDQyczMweE5TeWZ2SmRwdW1DS05Z?=
 =?utf-8?B?bmhsZWo1R1UxK254U1p4VU1wZTZZc3Iyb09VT2lXQVp1ZVJQMXFEL2pxcFBF?=
 =?utf-8?B?eTZiT2N6Z3VWMXBMTzRKUWVJUVFzY2F1RjMvSE16cWpTRENFc0toZ0JScE16?=
 =?utf-8?B?WGNRL2VxU3lRYTRlOCtZNktCd0NUNTZnQmZYRDhqcVNIMkgwMHJmM1d4bStQ?=
 =?utf-8?B?dnZhOXI1S2N1c0ZjbzgrcnpkNUt6Z3lOMndsUjdGNTg4UUFhZ204QlF2dkJV?=
 =?utf-8?B?T3phbjZnWGtaZGl3T1k4SUs0cFBXeURiSFFwVlJWYmY0Zjh6WHF2dXZOK1Jy?=
 =?utf-8?B?Y2RkUUdkSGFzdkkzdERHM1hHODJxUTNYOHBkTnJGRm5MRnhJN3ZGenVVazNw?=
 =?utf-8?B?eGpiU1JqQjEzWEVuRS8wdE1SUEFCSktPWVAxSFNyOVhoTFRoMXNmOGlYYWlG?=
 =?utf-8?B?YUxDMWJESFJOcGp5WUJKK2xRMFdOSnBsWkVvZW9kb0N2YnVMTFVaTXZJVDg1?=
 =?utf-8?B?TGJIYzNTNlYveTRva3I3MHpabHZQbWlmM1ZwL3hlZVZMOXNndTVnWE9LbXZ0?=
 =?utf-8?B?MFRxc0NTdmNKMEI3dnNWOXdpdVhqVThOYzdsRnplVmd5Z09EVnlOUHpxbTdz?=
 =?utf-8?B?c05RTXZxN1BSdlk3c2NiRW9UcFBKckVpaDZsQVBrSUxCaXRBUE1QK3hNVWN5?=
 =?utf-8?B?d3VlUmt2ZHJDN0pxTXFFY1lTT1ZxL25GYWUvN2ErcE5BcDdBTDlLbmp0RjZo?=
 =?utf-8?B?YzM0aTJ5MGFVM244OWh6Y3kwNnpXdUkrU2w1NHB1QnZ2TXFBVHVRekVhUWFX?=
 =?utf-8?B?ek9ESlpTRUdZQXVFUWx4bmhkZjZhd0h5RUp5OVNHZ1A2ak93ZDgwZzFkVVZS?=
 =?utf-8?B?MmxaY1gvOG5MbzhYc3RHL2VTK25BMXR3cjMzZ0pxY0Y3RndFb3JGODErVVJE?=
 =?utf-8?B?RGpsSWxrREQ1L0VCZndJajRVTHVuUU96UklLTS83dzdKTDE0d2kzdHBCOHpB?=
 =?utf-8?B?Vnc2ZTZnamJSY1BBWmlSc3hZaW1mNXB1ejJERDU1US9FekxhSmpOK1ROellE?=
 =?utf-8?B?dTZwckxYNWV5blZ2c0RuREhVaU1mZVZwQnV6WGVOZFQreSs2Yi8xdE9IZEFp?=
 =?utf-8?B?RmNGTmdla0JoRDgyQU5qY3N4NEpvUHNXSkxoS2xBTXYzV21pQjNOc2c3U3RW?=
 =?utf-8?B?Y0JrdzI2ZFA3b2I1STk3b1V1bVZXVjdkdXNZKzlxeEtaODNCU3FYRkZtdkph?=
 =?utf-8?B?clc2WjlTR080ZExidW1JNUxwbm9xVVFqaGwydkJaNVRDWWwyNWpmazM3enhq?=
 =?utf-8?B?ZmU4Y2hNdXpabFZ4cit1TVlvMkp2SmdNTFIxc2llQkcxcDdieEJtZVNMeDFv?=
 =?utf-8?B?VVF4SW81UFRGQnQ5bEwyd3NVSDlqaGVBcWNXbElxeTRlN0pYRGN0NXNYM3pT?=
 =?utf-8?B?SjZscVNYWVRmQ3FCZlM5VXozV2d2U01kc0E5MkdLWXRhRlNmU0poanBSWWRY?=
 =?utf-8?B?QmhLR2ZlSm9leXBldkV0djhYUkEzY0FvamdSeVY0N1dMVHVBVFNXZGZINllK?=
 =?utf-8?B?L3dPalQzbDQ1Z1dINzFmRDEyMkNNQlJnK1RveVdJQUxRT2cyQ1F4RmdicWF0?=
 =?utf-8?Q?9/qw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3NHdldxZmE2VXJkZUZqTnhndkhwYWVjRVFKYWJ0WXJNT0cyTFNMTUQrb2ZG?=
 =?utf-8?B?WDFucUEvemVjcmZrNld0QWY3RWxkeFFrejRzTzgrTTlTcVpHU3FqUmdsSGZp?=
 =?utf-8?B?UlF1TVFWQVpWTU9OaHI1ZzVzK1VySzBFTTA5QWZQbmJCSXJhQzMvekZGamFi?=
 =?utf-8?B?WWNhWVhBa2liTjdJK2hJMFBhSEU0cHR5ZU45b2hTYUl5YmxFeHk1ek5xaFo2?=
 =?utf-8?B?YjQvSUZEL3VNdHEvQ3VhakN0eWxoaTlWUGdXQUFaUmozL0VHUnh0azh3KzRE?=
 =?utf-8?B?T3hxbVZUakFRd1M5ZFl1a0NGZm9iQjZzUUNjUmtQcS93c1ZRUGtEK0hrSExD?=
 =?utf-8?B?V09sNDh4QjIrM1V3LzRCc0huZEE2RExIK1V5Yk9rSEkvYWYvc3c1R0IrSEFW?=
 =?utf-8?B?WW12c3EydkhaVTlhQVZHN0xKdkdoZVpCcDh0QXN3Q1Z6amRTbUxYZS9KMGE0?=
 =?utf-8?B?eDVERExtTmQ0NS9lZW5IN3p3UEp1djFINS9LZVoyLzc2UW01L2VlZkVFZHFs?=
 =?utf-8?B?SS9kYmFUY20rVnJmaW5vRlVLYXI0OVpRK1AvQkxMVWhhTHkzOXZSL092TnVV?=
 =?utf-8?B?dTdsbW4wa3NuTUZ6Y3lmUUw5ODZhV3h5cTdaSkxlUjd6RjlKZ1Y3aEZDYnZQ?=
 =?utf-8?B?bllGa1BIRldLU3ZlejlMQkhoaFRlQ2c4Rk9ZdmtPaXUvK2pxWEhkQzFrWXVX?=
 =?utf-8?B?OE0wMm5yeWVaU3pkZlhjaFNLbTVQVW91cUg3YUlIcytKMC9LQnFjY3RiMThG?=
 =?utf-8?B?Vkk4TmNhS20zTUI5N1NTR3grR0pqdFoyQm05aGRkYnk5T0twYUM5RTIxSmJM?=
 =?utf-8?B?NFFiZVFGeXkwTWpibWNBRUd0U0VEMlJ4b2I0ZmpYMHhmUlZuS0VySi9yNWZx?=
 =?utf-8?B?eHZPeGpaYk4xQW9EM0ZtSkRkOGs2bTRIcHhnUEVENlJJVko4MmR2UW1RQXNT?=
 =?utf-8?B?bkFnTFY2eHF2dFVQa0owdzc5YlhrZWc5M1VTVEtTb1h1T0tNYzh6TFhYUUF2?=
 =?utf-8?B?SUIxL1U4ODZIOXR2ZEhVQ2JKdmZObU43ODcrMjJVZmtBU1krNisxNkJoSGdI?=
 =?utf-8?B?VCtRb0I5UVk0Q0hpNDZ4STVtY1M1dWFiNjEyL0x2L01HMXgvd3U1Z0ZmNzN0?=
 =?utf-8?B?QVlzSDkzbmFaSEgrQWk3N3ZqVTd3Q3ZjWTljTS9wK0psRkcxcVBwdGZjRmFy?=
 =?utf-8?B?dlhXTiszTGsrV090ZmE2c0pEMmw4bEFldXRrbGpzTlBWVHh5Rk5WNGpWVWNK?=
 =?utf-8?B?Z0NLWW5Cakh5M0FUQWhtcUJWS2VGUE5zU1pZbUxqYTFzNjkvTkRlSFBFR3BN?=
 =?utf-8?B?RDBIUi9CNW16UnRRNXU1R1d4amRrWktWR3pmdSs4eWtMaXpHYjRFZ2xvU3dE?=
 =?utf-8?B?RHZCWUZlU3VIQk9XVll4VnZ1NHFDd3B0WWdnSlZDdk9nZi9va09jR0ZQMnBU?=
 =?utf-8?B?OWlNVGl2ZmtBS2x4RHpyclM5OU1kSlJtTDVOZWlyZGdhUnlZTjlpamNQMjFl?=
 =?utf-8?B?eHViTmg1WittSUJ5TEFKdHZOa0g0clVpL1lyTXZRZmJOWFQwSk8yajRoMmxp?=
 =?utf-8?B?T2FjNEJtTDNZZ25pMFFsWkxrVUVLdXc5YkVlWldsY2orVjMvVmF5SWJvcjAr?=
 =?utf-8?B?MWFLb1ZGN2pUTkdCL3dzUDhzbExwbWpwbFROd1JyMTdmTTVxNHo5S3NtQkZV?=
 =?utf-8?B?c1djb3JIZy9RejhhODdUUXpGODJEVGRDQWZZNGtNbi9iZFQyV2JWVzRDQTR0?=
 =?utf-8?B?Z3lmWmdTZUZuckZZVlIrdVR2VDM3NnprcG0xLzgxd0RrbVhWNkxsYUFIdVFp?=
 =?utf-8?B?Zy9ZTnYvTzRFY1lzWlNsdEtBT21mSmZveVp5dUZKMW9ReFBuT3NzOENla0xC?=
 =?utf-8?B?R2lMQmxPYXVFSUwvQkJoL2p6K2VHSDNjMW53T1MyZTFxS3ZqK0YrOEROS2dn?=
 =?utf-8?B?b0R1K0FoZThwUDJIdmZDSFIyNGtHSzZjY2tOb01xbkVmVk9keERsZUk1N2VB?=
 =?utf-8?B?SC9JaWdVOUpTNGNsUmdLRjFDOC9BN0VxMUJkVGFydWg3WFJyWktWOU9IeTJj?=
 =?utf-8?B?cE10MVlNM1Uva0NQOHo4OEhGUzBuOFBXZEErcklXYzM2YWxyQWJJV3dsaXZI?=
 =?utf-8?B?bllUZUdleU1NZ1RUMnM4RjZkZ0FYcjc5QitLaUl4Z21PWEtIelVLMnZaVXZn?=
 =?utf-8?B?K1J6MW05YmQ2U25IdXZCeEJoSTJVanVaUGo5d2lFS3hXUngyWHRVQWpLU3VI?=
 =?utf-8?B?eG5NQWRhNWlNcU11U0N5VS83T3I0Q0JISzh3aDBZSm5rMmhzcnhJU0tnTzZB?=
 =?utf-8?B?aldINExXMVpScllWK1VteVlSWGRKT1htUXVUYjg1MTd2emtiR2htUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b15fe1b-a363-40a8-554a-08de67b28aa1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:09:26.5257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VnMqAq1ukqHu3Ia5oyrEHyBzVLvJySUabATzYGGsPyOxgkH4lMqe/peno0ZI93BLMzgGY5WOGdMtVRUuHa1lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
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


On 05-02-2026 00:07, Karthik Poosa wrote:
> Add subtest aspm_link_residency to verify PCIe ASPM.
> Active State Power Management (ASPM) is a power management mechanism
> for PCI Express (PCIe) devices that aims to save power while the devices
> are in a fully active state.
> This test uses link state counters from the debugfs
> dgfx_pcie_link_residencies to verify this.
>
> v2:
>   - Add dedicated function to get pcie endpoint upstream port. (Badal)
>   - Read residency counter as unsigned long long int instead of
>     unsigned long int.
>   - Print residency counter before sleep also.
>   - Don't assert if sysfs not corresponding to aspm_link_state
>     is not present. (Badal)
>   - Run workload before validation of aspm link residency. (Anshuman)
>
> v3:
>   - Move igt_device_get_pci_usp to separate patch. (Kamil)
>   - Move reading of residency to separate function. (Badal)
>
> v4:
>   - Add description about PCIe ASPM in commit message and code. (Kamil)
>   - Add a NULL check for the return value of igt_device_get_pci_usp().
>   - Resolve compilation warnings about using variable as format string
>     to sscanf.
>
> v5:
>   - Use igt_device_get_pci_upstream_port() which is the renamed version
>     of igt_device_get_pci_usp().
>
> v6:
>   - Refactor and enhance readability. (Badal)
>   - Move save and restore of link states to separate functions. (Badal)
>
> v7:
>   - Skip aspm_link_residency on integrated platforms as it not supported.
>
> v8:
>   - Address below review comments from Riana.
>   - Use igt_sysfs_has_attr() instead of faccess().
>   - Remove unnecessary spaces, debug logs, if checks.
>   - Wrap line length to 100 chars.
>   - Use spinner instead of mmap for workload.
>
> v9:
>   - Address review comments from Kamil.
>   - Simplify couple of igt_asserts.
>   - Remove extra spaces.
>
> v10:
>   - Add exit handler for aspm_link_residency test. (Riana)
>   - Remove unused and unnecessary variables.
>
> v11:
>   - Address below review comments. (Kamil)
>   - Improve save_and_disable_link_states() to restore link states on any
>     failure.
>   - Avoid igt_assert in aspm exit handler.
>   - Make subtest non-dynamic.
>   - Add a comment explaining the purpose of the spinner.
>   - Update conditions and messages of couple of igt_asserts.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 215 ++++++++++++++++++++++++++++++++++
>   1 file changed, 215 insertions(+)
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index d33a87b13..61b63ed4f 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -31,12 +31,36 @@
>   
>   const double tolerance = 0.1;
>   int fw_handle = -1;
> +int fd_pci_usp = -1;
> +bool rpm_disabled;
>   
>   enum test_type {
>   	TEST_S2IDLE,
>   	TEST_IDLE,
>   };
>   
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char *filename;
> +	char state;
> +	const char *parse_str;
> +	bool saved;
> +} link_state_sysfs[] = {
> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};
> +
>   /**
>    * SUBTEST: gt-c6-on-idle
>    * Description: Validate GT C6 state on idle
> @@ -64,6 +88,10 @@ enum test_type {
>    * SUBTEST: cpg-gt-toggle
>    * Description: Toggle GT coarse power gating states by acquiring/releasing
>    *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check for PCIe ASPM (Active State Power Management) link states
> + * entry while device is in D0.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -255,6 +283,21 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>   	munmap(done, 4096);
>   }
>   
> +static void do_spin(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	igt_spin_t *spin;
> +	uint64_t vm, ahnd;
> +
> +	igt_info("Running spinner on %s:%d\n",
> +		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
> +	vm = xe_vm_create(fd, 0, 0);
> +	intel_allocator_init();
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
> +	igt_measured_usleep(USEC_PER_SEC);
> +	igt_spin_free(fd, spin);
> +}
> +
>   static void measure_power(struct igt_power *gpu, double *power)
>   {
>   	struct power_sample power_sample[2];
> @@ -370,6 +413,159 @@ static void cpg_gt_toggle(int fd)
>   		powergate_status(fd, gt, "down");
>   }
>   
> +static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
> +{
> +	int fd_debugfs_dir = 0;
> +	uint64_t residency = 0;
> +	char buf[1024] = {0};
> +	char *ptr = NULL;
> +	int ret = 0;
> +
> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
> +	igt_assert(fd_debugfs_dir >= 0);
> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf,
> +				      sizeof(buf));
> +	igt_assert_f(ret >= 0, "Cannot read residency file dgfx_pcie_link_residencies, ret %d\n",
> +		     ret);
> +
> +	ptr = strstr(buf, parse_str);
> +	igt_assert_f(ptr, "Cannot find residency string %s\n", parse_str);
> +	ret = sscanf(ptr + strlen(parse_str), "%lu", &residency);
> +	igt_assert_f(ret > 0, "Couldn't read residency value, ret %d\n", ret);
> +	igt_info("Link residency %" PRIu64 "\n", residency);
> +	close(fd_debugfs_dir);
> +
> +	return residency;
> +}
> +
> +static void restore_link_states(void)
> +{
> +	char path[256] = {0};
> +	int ret = 0;
> +	int i = 0;
> +
> +	if (fd_pci_usp >= 0) {
> +		/* Restore saved states of L1 sysfs entries. */
> +		for (i = 0 ; (i < MAX_LINK_STATES) && link_state_sysfs[i].saved ; i++) {
> +			sprintf(path, "%s", link_state_sysfs[i].filename);
> +			if (!igt_sysfs_has_attr(fd_pci_usp, path))
> +				continue;
> +			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
> +			if (ret != 1) {
> +				igt_warn("Couldn't restore %s to %c\n",
> +					 link_state_sysfs[i].filename, link_state_sysfs[i].state);
> +			} else {
> +				link_state_sysfs[i].saved = false;
> +				igt_debug("Restored %s to %c\n", link_state_sysfs[i].filename,
> +					  link_state_sysfs[i].state);
> +			}
> +		}
> +	}
> +}
> +
> +static void save_and_disable_link_states(void)
> +{
> +	char path[256] = {0};
> +	int ret = 0;
> +	int i = 0;
> +
> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (!igt_sysfs_has_attr(fd_pci_usp, path))
> +			continue;
> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
> +		if (ret != 1) {
> +			igt_warn("Couldn't read file %s\n", path);
> +			goto restore;
> +		}
> +		link_state_sysfs[i].saved = true;
> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename,
> +			  link_state_sysfs[i].state);
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> +		if (ret != 1) {
> +			igt_warn("Couldn't write file %s\n", path);
> +			goto restore;
> +		}
> +	}
> +	return;
> +
> +restore:
> +	restore_link_states();
> +	igt_assert_f((ret == 1), "%s failed, ret %d\n", __func__, ret);
> +}
> +
> +static void aspm_residency_exit_handler(int sig)
> +{
> +	restore_link_states();
> +	if (rpm_disabled) {
> +		igt_restore_runtime_pm();
> +		rpm_disabled = false;
> +	}
> +	if (fd_pci_usp != -1) {
> +		close(fd_pci_usp);
> +		fd_pci_usp = -1;
> +	}
> +}
> +
> +static void test_aspm_link_residency(int fd_xe, enum link_state_index aspm_link_state)
> +{
> +	uint64_t residency_pre = 0, residency_post = 0;
> +	struct pci_device *pci_dev;
> +	char name[PATH_MAX];
> +	int ret = 0;
> +
> +	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
> +
> +	/* Get upstream port pci_dev */
> +	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
> +	igt_assert_f(pci_dev, "Couldn't get pci device of upstream port\n");
> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	fd_pci_usp = open(name, O_DIRECTORY);
> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n",
> +		     name, fd_pci_usp);
> +
> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
> +	igt_assert(igt_setup_runtime_pm(fd_xe));
> +	igt_disable_runtime_pm();
> +	rpm_disabled = true;
> +
> +	/* Check if ASPM sysfs is present. */
> +	igt_require_f(igt_sysfs_has_attr(fd_pci_usp, link_state_sysfs[aspm_link_state].filename),
> +		      "%s is not present\n", link_state_sysfs[aspm_link_state].filename);
> +	ret = igt_sysfs_scanf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c",
> +			      &link_state_sysfs[aspm_link_state].state);
> +	igt_assert_f((ret == 1), "Couldn't read residency for %s\n",
> +		     link_state_sysfs[aspm_link_state].filename);
> +
> +	/* Save current state and disable of all available link sysfs entries. */
> +	save_and_disable_link_states();
> +
> +	/* Enable only the ASPM link state needed for test. */
> +	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
> +	ret = igt_sysfs_printf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c", '1');
> +	igt_assert_f((ret == 1), "Failed to enable link state %s\n",
> +		     link_state_sysfs[aspm_link_state].filename);
> +
> +	/* Read link state residencies before and after idle wait time. */
> +	residency_pre = get_link_state_residency(fd_xe,
> +						 link_state_sysfs[aspm_link_state].parse_str);
> +	igt_info("Waiting for link to enter idle....\n");
> +	sleep(SLEEP_DURATION);
> +	residency_post = get_link_state_residency(fd_xe,
> +						  link_state_sysfs[aspm_link_state].parse_str);
> +
> +	aspm_residency_exit_handler(0);
> +	close(fd_xe);
> +
> +	igt_assert_f(residency_post > residency_pre,
> +		     "ASPM entry failed, pre %" PRIu64 ", post %" PRIu64 "\n", residency_pre,
> +		     residency_post);
> +}
> +
>   int igt_main()
>   {
>   	uint32_t d3cold_allowed;
> @@ -444,6 +640,25 @@ int igt_main()
>   		cpg_gt_toggle(fd);
>   	}
>   
> +	igt_describe("ASPM Link residency validation");
> +	igt_subtest("aspm_link_residency") {
> +		/* Run this test only for discrete platforms. */
> +		igt_require(xe_has_vram(fd));
> +		/*
> +		 * Run spinner workload to wakeup GPU and ensure its engines execute some workload
> +		 * before entering ASPM.
> +		 */
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (gt == hwe->gt_id && !hwe->engine_instance)
> +					do_spin(fd, hwe);
> +			}
> +		}
> +
> +		igt_install_exit_handler(aspm_residency_exit_handler);
> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
> +	}
> +
>   	igt_fixture() {
>   		close(fd);
>   	}

Looks good to me.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

