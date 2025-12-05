Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E32AD339A2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 18:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22CA10EBA8;
	Fri,  5 Dec 2025 18:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kT2KV3MP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB7910EB9F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764959030; x=1796495030;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gr7Dr1jow30VjOUyQY9poyeve1i4MjtCrgknzZaLn7g=;
 b=kT2KV3MPapGn2B8Nuj2JbGD4TrgAis9TyA0V3QsnMM0LljJCXnktwXeQ
 WQVYq2aK1BfHHpGaD8CrGYq40n7nXzhymNg7yZOYnVXRIt2lCgV/UvS5U
 duFaW6NhoHsjCGYf3V8h9CMXaJaNCwysDJi4l5tihXrGIhsJtKC8pVxsK
 TWEGUNH/Sc8T4/sBpzDmk7/x94KouXIrOBxNVjm9WbcOcCCaDGQgtZBHP
 yZDKlWdGMQEYnJhoZO2z+aGlG+4lrV1fhI+TFUjESEkPlJLyfnFrx4pCY
 tyofpRGLPlJgcsldqxI+MXWemkUVNLOvwmFwwVYQ9tNmjTcmfmjNn7a8w w==;
X-CSE-ConnectionGUID: GDM2UdE8SFiESdN9FUs5bg==
X-CSE-MsgGUID: zuOv95pOQe+pbYfpfXVO8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70847457"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="70847457"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:23:50 -0800
X-CSE-ConnectionGUID: yQIsJwEnR3K3mTvAFos4Kg==
X-CSE-MsgGUID: SXkqJ5jBQSSkwGVOXmByeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="226362895"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:23:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:23:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:23:48 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:23:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkaOKaaPu6q4hhUV8tFPDndzTwv0HYecm6Nv/SnISD8hHacM/mbaBqEq9/OLNQG3NpzCPRnoF4EOONee3SoS3clJtSpRn0Rk1RxH2V0Yu4RcOG1vMOusWqkCJOCRpEUiQAsvGbbyP2lsLj89sDuRRlT9EUBr3Up4gwtkNrPHSLihpSqORUjY4XEBVy/2Up0sXPnpdj1wMNhviIT2Z94fHOmXcApBsE7JyOnD35f6DV9Tlh75Bbv9qwJjmKZv+fwchr+Udm2+6LP/vbztM+xjff+CXA63AQGSyaIVgHjhWU7+WliwKphmcsTlScX8mHPO3tfCt0kS2y7BAQuJP++a2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VI4cgeoKUQPB3vyL8e5C6vE+4fMJmNuzx2cHF4Gdeco=;
 b=i6wkS9MVoMuXwSiFBsQI+M2kdoj9VuVgDVCzdpwmYIKgl5LYc/afoeDfABOj2U51bhN1m4UiruoF/dUH85lLD9Id3khyt4JrOhHkKHoD0eC6L8pQAUdh6x3quas/xRe6Dkfu8aQiZ1c1IAEKLRnO1I2BPX+LA4Fsd/5hdiNxegxzl1VAjfprRJh0T+exyq+svoO2MsLECEy6AKNqUyHD8dJMU7+xMttIG4XkyFTjs8b1ijbbqJlYJmXHFn79DF5NHKn/Ng6WCfQOrRx6rQ7BMq/da93WoqllRareuPTqjcSbAAIO3HTy64fXGA6yHYlKXc06cMqg+vrq9FRfa7Zx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by LV3PR11MB8553.namprd11.prod.outlook.com (2603:10b6:408:1b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 18:23:45 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 18:23:45 +0000
Date: Fri, 5 Dec 2025 10:23:42 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 15/19] tests/intel/xe_exec_multi_queue: Add priority
 test
Message-ID: <aTMjLp4-8XVPRsw3@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-36-niranjana.vishwanathapura@intel.com>
 <e3376cc2c2febb2800cb4e9f03e81eb464762e4f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3376cc2c2febb2800cb4e9f03e81eb464762e4f.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::34) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|LV3PR11MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 137b8d87-0e60-4480-8b2f-08de342b6d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5R6xsSoWK1yT2Ffqtnz37efzmkEbyyHXBB+KQ+gnxfidT4oqmRQ9I5BzE0?=
 =?iso-8859-1?Q?eZD4T66PflW0ozYBuEqUE/7DFhvJ6YNiPxF3cdzL/aEZ2x7QL0jY0jWKzo?=
 =?iso-8859-1?Q?PIxFXbBGJ1AKr0v05WE6d0uTP3Df9axXDx4RJFwny/3fHswSo5LmONkI+j?=
 =?iso-8859-1?Q?NWYmvFI2QQ/VB3DOXhic0/DLerGk86eOl6NJESbkieOY1S2sVhlVdd/uW6?=
 =?iso-8859-1?Q?cuO/wNnhABruLP7M6SEeEH0Fry0+m+uot3itSQr9VU1M8L6Af9qs1bdG4y?=
 =?iso-8859-1?Q?DhbHRV0X6li3LYiM/noUaZ6bX3j8gLPK73Yif3GGOnBJp223UlIcChDk2s?=
 =?iso-8859-1?Q?cpBhj45JbYKCmYb2pXcKD0NlrT76krjpKv9Wv3qBd1F2FtnANJ6fuo2JDs?=
 =?iso-8859-1?Q?/dXB7qvidOF0RbNZDl4vrM+X0bGurdKag+PD725NNhvGXgDbOeJqXPyzpQ?=
 =?iso-8859-1?Q?Wt7SnqmA2JVk21Fnwk6deHYKXy3GY27rer6quKAUKJdo9FIN72Z26LZIGI?=
 =?iso-8859-1?Q?wMRBKMLzaPzV96yS4hbTpeVVOyVJH1ZVAwiou7X58OqE1TDDSyNB2NgZS+?=
 =?iso-8859-1?Q?8nCe1HO0vjOcMj8bXOvuOQyHYp402rqiQfihDy9qOPI+ENDyzZuIj3Th+h?=
 =?iso-8859-1?Q?nX6OerqKCA+P45DxsgvkGDjO/h5esQY8y0ujOFl7LNiMHgjKpZAYjrFSqn?=
 =?iso-8859-1?Q?ZZYuP3jqvAsJfoQr0b2ZjMIqSl/QFxYQbS/UAkvDGqVOf9LI9iv+OM87rL?=
 =?iso-8859-1?Q?yI75cwKP6hgSVtJkKOOjxKFeOyVv9SdY/dEri8AqVy+YQW+gpt4GeHB+lT?=
 =?iso-8859-1?Q?pD+tHzyf4vYXgHxmYF17iAWSKl6co/WlidSS/DGEYAONIjDqejzzqEcKUE?=
 =?iso-8859-1?Q?T9v6jvxtjmjHy/cCeBNovov1z+x58FK0wTOY7/oA9b1jTVO5p0nb8J7lok?=
 =?iso-8859-1?Q?zEg6QGIFEAUoF43JyJcixKJOf8J+PR43zBuByQCqWyLE1eC7Gvr4zHhusU?=
 =?iso-8859-1?Q?chMeASMqanS9M6w1AxyQT+7L9wokxPh711bV/Q+4DK0Ofm9HBuSEoibHOX?=
 =?iso-8859-1?Q?ep1zhziu7uzjaw+8eZnqctf3CGJjb+XwQ2ZkJ9AL8rBWddLKFAFJfh+gmv?=
 =?iso-8859-1?Q?shonMnfZj3C2zczuypBYpfBn9OaIaDttVnBqVcz/X2aKLiEDXd7GvTStnm?=
 =?iso-8859-1?Q?G2HzClh7gC70cG8zMFizLzIPdNKM39uL5Lk7fswRK6kZ1c9+3oI2fr/MH+?=
 =?iso-8859-1?Q?gkRgZVQ3CJ4N/+F3hlqAS5O2ZNrIGqwnlK8kpEUK1wBpxF/BgcaXO5QfLm?=
 =?iso-8859-1?Q?3d4RxZGH3S1sd3ZWZ/2LnAfGs50c6utwpgZnQefufLwLjYdCvD3GvbyFdI?=
 =?iso-8859-1?Q?ujV+ek+4zE0Pz6y8moIYLox9FG7xO8/yvaf5dvyWW9XdZxPZhb2OPvJdhM?=
 =?iso-8859-1?Q?xd3aGjj7tvppad0r/tedkJSmrGXWYzDuQHIlRTHeibqSKbbOpJ0xO/dIrQ?=
 =?iso-8859-1?Q?Smy3E4EuGPuaJkS9DXfJ8f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/clcj1fkjMO7VW++8lCHJevd4rC+l2DzKrzmHtANPejcLzX80ESD5jt5sB?=
 =?iso-8859-1?Q?U+q0d027CZBRWUJuQIct2Ue+WkUNYOtXgFAR8KBLiGfc5WQcT1f6x+TKKD?=
 =?iso-8859-1?Q?ckHZy1Ssw5+Tt/UMdHk4+NLWEiZqn3gjl8KTaT0Ik1d9CE0yCfzzKhC8Ot?=
 =?iso-8859-1?Q?KRmqR3tNkou9TU3yPpxX/VNjqJ9mZ4gJe4869vWrtc3bES6lVtbH9Pj6Gr?=
 =?iso-8859-1?Q?YGVA6s4NoMx33VnCCKOALeRynrE6Ea5Bm2whvE73btsg/7+33joQgZH0HC?=
 =?iso-8859-1?Q?mpu6QvQpTP2USJ4SGDCUTu/KEdtfNQZ4qwIWAN0fHy18El1Xpzr+hwTkIr?=
 =?iso-8859-1?Q?e1d1RCFWUH62Gn/C6CSU9uWhbptQz4+qD7G1cC1Phf7CU4yw6X7PRuGOGN?=
 =?iso-8859-1?Q?VG65S+L7FFqcRwLrW2XTVX80XyxGpkiv0a2ntcziGF3wul3MMUwkaFOoDb?=
 =?iso-8859-1?Q?qJKPyJ/9vEuhFcZkf8ay74p7bVMHS+n1SuKB06OBy7ozurCoZD2m5D5VUK?=
 =?iso-8859-1?Q?rCTYtW+7VUgGnaco6SyWUIN6efncNyfzfOm/FfoaleGp1zSTIeRk5DmANZ?=
 =?iso-8859-1?Q?5opb61Gy2jWAgGlfNPPIP+wOMQ0QhmyphGNoFHZEIKgAxpyt85zJRYKU1h?=
 =?iso-8859-1?Q?brey2qx8/LdNIfLvKcXF5bYcFVD1CURlcNBLtHRV+ijcVAzJV2b8BUtguC?=
 =?iso-8859-1?Q?q20Qf0PIB21f9aPVS56UGKBNaJgwed+OAneyKqB2X+Rv3geAs0peN2iMPh?=
 =?iso-8859-1?Q?L7UotWvOfBD4kJeIxtK25vesZeo6jNBGxYIEnCVe/6THOLCxLKmuv1JCcE?=
 =?iso-8859-1?Q?/obr3mWiN3GVWIVVglGgAX0ztDk2Ne5Qx26tyUkn5CiagR4vMB/SP/QYEX?=
 =?iso-8859-1?Q?9LUW1xziAL4gPEnP5G4eubawxcqdQ+29PMsjAOBeVk4nPW1rQrC0pfAk2L?=
 =?iso-8859-1?Q?/yK/YN+OT228xEUVYFYOxxAw+xcHng9XK0wH27VbgCaGQUi3Hb6uOim3W0?=
 =?iso-8859-1?Q?EEcmITRA7Vvc6M9wW4hDIqlybT8hu7Lrdq4J12tyEM8cOBpxvnxDf1Pc4h?=
 =?iso-8859-1?Q?gkq3tpnquTX5X+byI5nkF7JR71lIhqSorLzVccsV85BV8DBdyH5SubGcf3?=
 =?iso-8859-1?Q?dPgHkb6UhBCIB54XgGp9PrWAxekVSUuyzFlS8setCoOk7vCWuUkJdwSs5Y?=
 =?iso-8859-1?Q?uEZfjkamkmGrrif19nyFvbQIInCRnb/hoeLqaQKR7wSoDHpVzFToGVimbP?=
 =?iso-8859-1?Q?kxfdRctRgKSdzBcx13h++gi6GtCWja2E9bY6qXM4pW99XBtS3zr6vuth50?=
 =?iso-8859-1?Q?R3yvDKcehpPs82sJpxlclCNH1cKsB5Sk4aHxhrDcjuvBoNKvnFpVX43ZSV?=
 =?iso-8859-1?Q?umOvyXD8mXZdHXERWGeBS+IuC3Qp60Ak+7ufExcFD/3rnujer2IOI5Xxk+?=
 =?iso-8859-1?Q?CXRlGTbWLm3G44SLdl6kGlbEw698kDB8a36DSHZrnVhkLeMdZQZwKoaQQ+?=
 =?iso-8859-1?Q?UGjTvuuIfYCwLf5VTIUl+ZF2tnINedIQaww8qrUfKV3zbSx7c4w5zUD70e?=
 =?iso-8859-1?Q?V5V9FhUxcIZDls0Tevy+z/GW72MdSG07/xLeTIwiHd9Km5zyeWNUUdMCPz?=
 =?iso-8859-1?Q?ODxzuBoDF+SuPPqX7gcn2HbPg2c6TB+PFcnp6mR0YaAfHajgyEmv/aiBL2?=
 =?iso-8859-1?Q?1BWDAQI3ZDrxH/tCfRo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 137b8d87-0e60-4480-8b2f-08de342b6d1a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:23:45.3475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qt/hZX14mj4gkVH68igMTMEOQ+xL+FFuIOev2fNmXJAC/O1EMozYFabCF8zeZJu3pAy8ywe8KJkTiOb4aImvTo1DO/FPFr+h9hICs7MZ6lIuzD8r0FpPs8YMmeOr+t0e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8553
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

On Thu, Dec 04, 2025 at 01:53:26PM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> Validate intra queue group priority setting.
>> Validate that a higher priority queue in a queue group
>> can preempt the lower priority queue of the group.
>>
>> During a queue switch, the currently running queue is
>> always switched out without regard to its priority.
>> The priority is only a factor in determining which
>> other queue of the group will be scheduled in.
>>
>> v2: Macro and variable rename (priyanka)
>>     Remove simulation related code (Priyanka)
>>     Remove hardcoding of number of bits.
>>     Use BASE_ADDRESS macro for address (Sai)
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 203
>> ++++++++++++++++++++++++++++++
>>  1 file changed, 203 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index df65ccafb..06e898a47 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -13,15 +13,18 @@
>>  
>>  #include "igt.h"
>>  #include "xe_drm.h"
>> +#include "igt_core.h"
>>  #include "lib/igt_syncobj.h"
>>  
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>>  
>>  #define XE_EXEC_QUEUE_PRIORITY_LOW     0
>>  #define XE_EXEC_QUEUE_PRIORITY_NORMAL  1
>>  #define XE_EXEC_QUEUE_PRIORITY_HIGH    2
>>  #define XE_EXEC_QUEUE_NUM_PRIORITIES   3
>> +#define XE_EXEC_QUEUE_PRIORITY_N       (XE_EXEC_QUEUE_NUM_PRIORITIES
>> * 2 + 1)
>>  
>>  #define MAX_N_EXEC_QUEUES      64
>>  
>> @@ -33,6 +36,7 @@
>>  #define INVALIDATE             (0x1 << 5)
>>  #define FAULT_MODE             (0x1 << 6)
>>  #define SMEM                   (0x1 << 7)
>> +#define WAIT_MODE              (0x1 << 8)
>>  
>>  #define MAX_INSTANCE 9
>>  
>> @@ -212,6 +216,201 @@ test_sanity(int fd, int gt, int class)
>>         __test_sanity(fd, gt, class, true);
>>  }
>>  
>> +static void
>> +__test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>> +               unsigned int flags)
>> +{
>> +#define USER_FENCE_VALUE       0xdeadbeefdeadbeefull
>> +       struct drm_xe_sync sync = {
>> +               .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +               .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +               .timeline_value = USER_FENCE_VALUE,
>> +       };
>> +       struct drm_xe_exec exec = {
>> +               .num_batch_buffer = 1,
>> +               .num_syncs = 1,
>> +               .syncs = to_user_pointer(&sync),
>> +       };
>> +       uint64_t vm_sync = 0, addr = BASE_ADDRESS;
>> +       uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
>> +       struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
>> +       uint32_t vm, num_queues, num_queue_priorities, bo = 0;
>> +       uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] = { 0 };
>> +       int64_t fence_timeout = NSEC_PER_SEC;
>> +       size_t bo_size;
>> +       /*
>> +        * Q1 - Q6 are used for the priority test.
>> +        * Q Priority = id % 3
>> +        *      QID     Q1 Q2 Q3 Q4 Q5 Q6
>> +        * Priority      1  2  0  1  2  0
>> +        * The Priority 1 and 0 are the same priority so hw should
>> pick Q with priority: Q2, Q5, Q1, Q3, Q4, Q6
>
>I think we should reword this to something like:
>Hardware treats priority 0 and 1 the same, so hw should pick Q with
>priority...

Ok, will update.

>
>> +        */
>> +       int expect_order[] = {0,2,5,1,3,4,6};
>> +       uint32_t already_in_order = 0;          // bitmask to record
>> Q started info
>> +       struct drm_xe_ext_set_property multi_queue = {
>> +               .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +               .property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> +               .value = DRM_XE_MULTI_GROUP_CREATE,
>> +       };
>> +       uint64_t ext = to_user_pointer(&multi_queue);
>> +       int i, j, sleep_duration = 1;
>> +       void *bo_map;
>> +
>> +       num_queue_priorities = XE_EXEC_QUEUE_NUM_PRIORITIES;
>> +       num_queues = num_queue_priorities * 2 + 1;
>> +       igt_assert(num_queues <= XE_EXEC_QUEUE_PRIORITY_N);
>> +       igt_assert(num_queues <= sizeof(uint32_t) * 8);
>> +
>> +       igt_debug("%s flags 0x%x eci %d:%d:%d\n", __func__, flags,
>> eci[0].gt_id,
>> +                eci[0].engine_class, eci[0].engine_instance);
>> +
>> +       vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +       bo_size = xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
>> +
>> +       bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>> eci[0].gt_id),
>> +                         DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +       bo_map = xe_bo_map(fd, bo, bo_size);
>> +       for (i = 0; i < num_queues; i++)
>> +               spin[i] = bo_map + i * sizeof(*spin[0]);
>> +
>> +       /* Use the default priority for Q0 because we are explicitly
>> waiting for it below */
>> +       exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> +       multi_queue.value = exec_queues[0];
>> +
>> +       if (flags & DYN_PRIORITY) {
>> +               for (i = 1; i < num_queues; i++)
>> +                       exec_queues[i] = xe_exec_queue_create(fd, vm,
>> eci, ext);
>> +       } else {
>> +               struct drm_xe_ext_set_property mq_priority = {
>> +                       .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +                       .property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> +               };
>> +
>> +               multi_queue.base.next_extension =
>> to_user_pointer(&mq_priority);
>> +
>> +               /* Create secondary queues with increasing order of
>> priority */
>> +               for (i = 1; i < num_queues; i++) {
>> +                       mq_priority.value = i % num_queue_priorities;
>> +                       exec_queues[i] = xe_exec_queue_create(fd, vm,
>> eci, ext);
>> +               }
>> +       }
>> +
>> +       sync.addr = to_user_pointer(&vm_sync);
>> +       xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
>> +
>> +       xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> fence_timeout);
>> +       vm_sync = 0;
>> +
>> +       for (i = 0; i < num_queues; i++) {
>> +               uint64_t spin_addr = addr + i * sizeof(struct
>> xe_spin);
>> +
>> +               xe_spin_init_opts(spin[i], .addr = spin_addr,
>> .preempt = true);
>> +               sync.addr = spin_addr + (char *)&spin[i]->exec_sync -
>> (char *)spin[i];
>> +               exec.exec_queue_id = exec_queues[i];
>> +               exec.address = spin_addr;
>> +               xe_exec(fd, &exec);
>> +
>> +               /* Wait for job on Q0 to start, allow other queues to
>> run to completion */
>
>So in this case we aren't waiting for anything with the other queues,
>only Q0. We don't know if the other queues are sitting waiting for Q0
>to end (or the semaphore to clear) or not. Maybe:
>/* Wait for job on Q0 to start, other queues block behind Q0 */
>

Ok, will update.

>> +               if (!i)
>> +                       xe_spin_wait_started(spin[i]);
>> +       }
>> +
>> +       sleep(sleep_duration);
>> +
>> +       /*
>> +        * Expect the job on other queue to not get scheduled while
>> the spinner
>> +        * on q0 is not waiting on preempt condition.
>> +        */
>> +       for (i = 1; i < num_queues; i++)
>> +               igt_assert(!xe_spin_started(spin[i]));
>> +
>> +       if (flags & DYN_PRIORITY) {
>> +               /* Assign increasing order of priority for secondary
>> queues */
>> +               for (i = 1; i < num_queues; i++)
>> +                       xe_exec_queue_set_property(fd,
>> exec_queues[i],
>> +                                                 
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> +                                                  i %
>> num_queue_priorities);
>> +
>> +               /* Wait for priorities to take effect */
>> +               sleep(sleep_duration);
>
>I'd really rather have a way to determine these are set
>programmatically... What if we moved this whole if condition up above
>the xe_exec call to ensure the H2G ordering of the priority set
>followed by the exec?
>

No, the idea here is to dynamically change the priority. i.e,
after the job has been submitted to the HW.

>> +       }
>> +
>> +       /*
>> +        * Trigger a queue switch by making the spinner on q0 to wait
>> on preempt
>> +        * condition, allowing job on q1 to get scheduled and finish.
>> When we end
>> +        * the spin[0], it triggers the CFEG to perform a queue
>> priority arbitration
>> +        * rather than a full context switch out. Consequently, in
>> both semaphore
>> +        * (WAIT_MODE) and non-semaphore scenarios, a priority check
>> will occur.
>> +        */
>
>The CFEG arbitration points:
>Semaphore wait successful/unsuccessful
> - covered here
>
>Head == Tail
> - covered here in the spin_end below
>
>Thread group end met in the walker
> - expected to be covered by compute tests
>   - of course the compute UMD tests should support these checks
>   - I don't see us doing anything here in IGT though. Should we?
>
>pipecontrol/barrier with queue drain mode set
> - UMD is testing this I believe, but should we do that here also?
>

Yah, the idea here is to cover the arbitration cases that IGT
can easily test for. Will leave UMD validation to cover the rest.

>> +       if (flags & WAIT_MODE)
>> +               xe_spin_preempt_wait(spin[0]);
>> +       else
>> +               xe_spin_end(spin[0]);
>
>Do we want to wait for the spin end to take place before jumping to the
>next sequence in the test?
>

There is no added benefit in that.

>> +
>> +       /* Wait for jobs to get scheduled */
>> +       i = 1;
>> +       while (i < num_queues) {
>> +               for (j = 1; j < num_queues; j++) {
>> +                       if (xe_spin_started(spin[j]) &&
>> ((already_in_order & (1 << j)) == 0)) {
>> +                               start_order[i] = j;
>> +                               xe_spin_end(spin[j]);
>> +                               xe_wait_ufence(fd, &spin[j]-
>> >exec_sync, USER_FENCE_VALUE,
>> +                                              exec_queues[j],
>> fence_timeout);
>> +                               already_in_order |= (1 << j);
>> +                               i++;
>> +                       }
>> +               }
>> +       }
>> +
>> +       /* While ending spinner on q0, bring it out of preempt wait
>> */
>> +       if (flags & WAIT_MODE) {
>> +               xe_spin_end(spin[0]);
>> +               xe_spin_preempt_nowait(spin[0]);
>> +       }
>> +       xe_wait_ufence(fd, &spin[0]->exec_sync, USER_FENCE_VALUE,
>> exec_queues[0], fence_timeout);
>> +
>> +       igt_debug("Order\t Actual\t Expect\n");
>> +       for (i = 1, j = 0; i < num_queues; i++) {
>> +               igt_debug("  %d\t  Q%d(%d)\t  Q%d(%d)\n",i,
>> start_order[i], start_order[i] % num_queue_priorities,
>> +                         expect_order[i], expect_order[i] %
>> num_queue_priorities);
>> +
>> +               /* The priority 0, 1 are the same, so we can skip the
>> comparison */
>> +               if (expect_order[i] % num_queue_priorities <
>> XE_EXEC_QUEUE_PRIORITY_HIGH &&
>> +                   start_order[i] % num_queue_priorities <
>> XE_EXEC_QUEUE_PRIORITY_HIGH)
>> +                       continue;
>
>The downside to this approach is if we get some future hardware that
>has more than two priorities where more than two of these are the same,
>we'll need to rework this.
>

I think it should be one off thing and we shouldn't complicate the
design for that.

>> +
>> +               if (start_order[i] % num_queue_priorities !=
>> expect_order[i] % num_queue_priorities)
>> +                       j++;
>
>Instead of calling this 'j' can we use 'num_out_of_order' or something
>to be more specific?
>

Hmm...we already have 'j' which we can use. Let me added a comment
here so that it becomes more readable.

Niranjana

>Thanks,
>Stuart
>
>> +       }
>> +       igt_assert(j == 0);
>> +
>> +       sync.addr = to_user_pointer(&vm_sync);
>> +       xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
>> +       xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> fence_timeout);
>> +
>> +       for (i = 0; i < num_queues; i++)
>> +               xe_exec_queue_destroy(fd, exec_queues[i]);
>> +
>> +       munmap(bo_map, bo_size);
>> +       gem_close(fd, bo);
>> +
>> +       xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: priority
>> + * Description: Validate queue priority setting
>> + * Test category: functionality test
>> + */
>> +static void
>> +test_priority(int fd, struct drm_xe_engine_class_instance *eci)
>> +{
>> +       __test_priority(fd, eci, 0);
>> +       __test_priority(fd, eci, WAIT_MODE);
>> +       __test_priority(fd, eci, DYN_PRIORITY);
>> +       __test_priority(fd, eci, DYN_PRIORITY | WAIT_MODE);
>> +}
>> +
>>  static void
>>  test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci,
>> int num_placement,
>>                   int n_exec_queues, int n_execs, unsigned int flags)
>> @@ -707,6 +906,10 @@ igt_main
>>                         xe_for_each_multi_queue_engine_class(class)
>>                                 test_exec_virtual(fd, gt, class);
>>  
>> +       igt_subtest_f("priority")
>> +               xe_for_each_multi_queue_engine(fd, hwe)
>> +                       test_priority(fd, hwe);
>> +
>>         for (const struct section *s = sections; s->name; s++) {
>>                 igt_subtest_f("one-queue-%s", s->name)
>>                         xe_for_each_multi_queue_engine(fd, hwe)
>
