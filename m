Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A40EFD5323
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 09:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC22C10E00A;
	Fri, 27 Feb 2026 09:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lw2qGukp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EFA10E00A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772186010; x=1803722010;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=nSPdrWnv2ii66Cv6yX7Mw/iYpSWc6nc7KmQK7obccjc=;
 b=Lw2qGukp8XIovo2ox0CBg5QGVFZIkjAs78i7VzxFR2FmRTbkPZAqR1mL
 jl+SwqtwDqQ6l2zRQL0y73uTk9Mhvs8nQxVCJq9jQ3C9Fc1ySPwi6J02l
 TkXsyj5CXQRpagOu+AM50yIXcM8TKc67z8bdaJaiRwmAuAj78J9lRZmJJ
 SsFZ9pQ8rnjUYBZfCLcihGCdO5cAa+sFq6wRYa35Be7ygXHf9/E5qjnA1
 kkVK54uT260K9ueN0dMhbDP5hKDEXYuIEw7VzZYGWKr3KGrcw7Ag6naF1
 jYR/dhEgeZ8qUewk1B8x3UceELiTp+cn2E5DDP3CaowR1u92yZV/bBHO7 w==;
X-CSE-ConnectionGUID: 2PnpfPSlT+eRnCcd7Qfi8g==
X-CSE-MsgGUID: OZ1Yq3YZTVCVrF5USnRYEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90842460"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="90842460"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 01:53:29 -0800
X-CSE-ConnectionGUID: aLlfxNEiTJO525fCvdaw9g==
X-CSE-MsgGUID: TWfYv2O/RLeeHANMKMqtMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216862894"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 01:53:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 01:53:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 01:53:27 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 01:53:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZWrsRc1pVu/bJnStrqnUP60A6WdlkhLVNEU2WNSN1YtOig08fVdyVDQ9yuidRJNfHcBHUu6YaBIPQhTiRe5StSNVFXFHeR+M/hKW0nVqVFLr93FOt6WOKyz4wia8gpM5Tnl68OJyhI8oi0qcgU2rZP0SpR/wqMU+i3Sj532EofXOQb7++cFjPrN2HEazbUeP/dU9DeQH2tbobyYkN1SMfmuDMDFE+PiLRgQNcWbe8uc+6jwbScjh6PucP4rLfjvyENtc/NFnwDaKewLCK/Mkk/wGu7HpRvlWYQiSNl5sm/JthMajSKS9Si80h5jZ5WNcnaYpFA8dfN86KVYRrlKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOvHp05q3O3oF/MdFKenjJUE8EFTYLSVSQmWVUf7hmM=;
 b=TXdfw33BvlSML3e4Y89S8uhd496rjfkOCFUzJw+iYbKv8+6Aj+LMpN/IuSyL1X0HeU1hJCKFAvAkDJxIruqX/QGvRQ1CE8dtcTtTuM3PdpvXrI5Pho1sPysrDt89EsxR2vnpXfi68sf5BDHkZkF13K1QyAf+7xcSRgKoyN1H8M6gArlOkdCjNixMxtVMIiNSdLke6X1/RkeBIBi1+b6G+ZrhzwLc+JYYE7k4xaC938bcs7ZtApqtczUs8VOFyoXjLkXdGaeBnWeFPWFOhgf/DjLR9vOy5Y3yZC3DvvV/Dy/MHvAwnoNJ8V//rekkSyDNSTgn3CpwKrC8TbIzDdWrbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN2PR11MB4566.namprd11.prod.outlook.com (2603:10b6:208:24e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Fri, 27 Feb
 2026 09:53:20 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 09:53:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 Feb 2026 10:53:48 +0100
Message-ID: <DGPNIMCE0EFI.3C2BE5EIFUK5I@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <krzysztof.karas@intel.com>
Subject: Re: [PATCH v3 i-g-t 1/4] tools/meson: make per-tool dependencies
 instead of using global deps
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <cover.1771510028.git.sebastian.brzezinka@intel.com>
 <014b324e5cb2e5fe00aca8bdb4ee2b03da75668d.1771510028.git.sebastian.brzezinka@intel.com>
 <20260226163004.34wvzcruzogb56tn@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260226163004.34wvzcruzogb56tn@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN2PR11MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4d1fa1-6b4e-4ab8-bc90-08de75e609a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: GW9DpKZ2aFf467/IjyusaetAi1497VogvlNw3r18nMvrMYcMpSIuds2Ow0j/EPt/rkByc6mR8Bdwj/vUgTIVlpI8bCPJPLBllX5rxjhycRLY6qORuPZTkuWPYt3xIUy1sGO6Ce2/urGH8/4k31L2hco3RiiPjXqh0D8Z2BnwRHqrYDDpDco+SvoXfUHHouOj6zTPYm+WqhiFgPSBES+aUpJdG+NQMX5g4veWOTCvKBQZatXcZTG6D00vB11b7YWiLmhXn3MhyxhIfmXs5BsffpsXjK8jg5EruL0A0NlxvDEgE23iVPY+2Xu0BpsV/oumvDblPl5WGlq4GEidaYxYuEzwO/A8y8Xg/caVWGyOin56Fh6x4a0s5mUZOL2EkokGeNYnZ7vz04BOPYdUmrAkHhp0rwt08i0ZKJcnKlbPtLm7ob9vMuOfxdHdowPDh/k1v7t4tRe6Aca90/8eQvVsJ2rnrS4SqCCJSD8lvuTKSRMulrDoyPtLNJvNxajbNBSyEiC+zYh7cbsoXHV68MBZpkdEIS2iBww1Pk60xEZCWBvY9JSBOK/nm9kqUD47a6qcS0YktLA7FAsr+LcfjL81DYw5ijKBvYcxBqZDrop6IJTOihd1kNlGIiGD7FK5T06WkRwI7z7mgC9qKaHjbOK1ErM8w12c7G0cm6kQpyXFQC7695onucr7YLihBMnzQ7ImClbFCGY+e/2yjJIdPb6acIF88DkJnRwozVsijZzhgaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUpvSVFCTmpYNXVSYmdEZDhYRkRRRStWSTdQc0dWWkZHcTJGSHE1eXBXejVK?=
 =?utf-8?B?eXh2RDh2MmdkMEc5SEwwM09RRjhQb2VEdGZwU2RiL1lKZXpCVTdEektoUDVa?=
 =?utf-8?B?VHh0WXRZOThkcmJISGdxVHVrSkNtbno5SEZjWjlCMFAwU0d5a2pDTFQwMjZW?=
 =?utf-8?B?VFRQRTd3WllIU2NTLzJSbGFIT0lQSzdUTXAya0U2OXdZM1RESzMxcW8xTHk1?=
 =?utf-8?B?T1hKeHdHdXVLUFJ5VVd0eVlqVU1jS0JQUmMvQVdlNDFVOHR1TFpUaXdmK01r?=
 =?utf-8?B?YUtza0YyQ21ORU13a2lNak5kSUxpanJNSFhwZ2QvdGdJSmhicUV0UlRDK1Ba?=
 =?utf-8?B?UVNZVXFRWTF3NXJoRXN2ZzQydGdzTFZzdGN2TkZnWEgwMk8vQVI0RHJORk0x?=
 =?utf-8?B?RFRuMEFwaElhTStGQmtLTTg4akRjUHBjZjlhdlNIa2hnTnFQandrbFl1QzFz?=
 =?utf-8?B?ZG40LzdXRTBEQXYwTU5CZ1hyZlpSck9paFB1QnZ6U2xkZ3Q5aHMycEN2SlNh?=
 =?utf-8?B?bG5qYk9WTjJ6MDlyS0Y5V08yK3hsN0dWUnIySnhCb1JhMDZzcWhCdVZJbko1?=
 =?utf-8?B?c3h6M3BrTHYwWmlwZWYrN3FVUE5ET1AvT055YUZmTEl4Wjl3UnNGMWpIMG5D?=
 =?utf-8?B?RTZ1QVo3MGlaOVovTERpWE9RNno5cDMwWitodHZVYzNjNStvZ0VGOHpOdVYr?=
 =?utf-8?B?OWtEcHpmcldnRzc0b2RsTndWdmVaTkFpMkYzdjNvSjlTTHo0VDdMNlhKeXRX?=
 =?utf-8?B?VHV6MUJYcVp4bUl4K3dKZjZMcVBaOXE0OHNFL1ZESTRRZ1ZxSDBRdStTam9Y?=
 =?utf-8?B?RDY5U29NT2lEb3hJUW44OFVIcUtWT0F1NW9UaTZVTkpWV3k1czFrRGpJR0JO?=
 =?utf-8?B?N3pvZEVSSWR5Rk41RGxqRDFDYWFHMlhPSk9JL2VYZjhyL3ZYdDdLdTlzV0l2?=
 =?utf-8?B?amk5S1F5aDZvMnZUUlZ6WmtZdWUxS0x6VDVybmdoTlVtQ0tuY1RVemNzV0N3?=
 =?utf-8?B?SWJYb1I2NmRDZnU0M0ZIOUVvUTB4NDY1ZzVmZ2wzREJQNEwydWk0bVJRNWNk?=
 =?utf-8?B?WmR6SWhNWFhXTjBmc2NmT3hoQnVJaHQxSUhiNzMxSFM5VEtCb08zRkNGTDZl?=
 =?utf-8?B?VVJsWTJlMVpPUU10WFNWdk4wSnhHV2lHK2szNm5NMEFYbHRHN0tIcFlFKzFV?=
 =?utf-8?B?UmRTMlVqaVhMRFpydm9mL3JPYVJkbDRHb3VlTjJ6SEFONnZaRm9uN1h3SXJQ?=
 =?utf-8?B?SGNmRTFUZmduLzAxQnRZQ3p1bmhqb255c0tUaEE4Qld3akJpZDNGS0tVMEhs?=
 =?utf-8?B?N1dWOUQ0U3pBRHFiOHZKQk1zSktCSDdaRmtFMEhJRy9zUXFCQktOSzJNVCs3?=
 =?utf-8?B?dUpMZVRQcitnSnJjd0kxcDM3L3BSbmxnVmFlVUlneXMxbWZmR29oWTU2dktL?=
 =?utf-8?B?ZVFXWXVqNlNybmdqeVkzOFZ2UXNMVVZRdC9JUUlEN01ibGEvY1JEM1VzUGdP?=
 =?utf-8?B?dFNuclNBZkVSYnVOdjhROFNBelhoa1puVExJK2N1ZnZTeSs1WkdQamRmeTJX?=
 =?utf-8?B?aGphR2VvdVozYWFKMmhKbnhFWTFyeEMxYm9DbjZMVlBHS2JZTGQ2WjQ2bU1t?=
 =?utf-8?B?SkJCWFZ6TEdwL3c5SmhvSCtad3lkK0F3NUU5a1Z4OHpxNFB5TmJ2cWRqUEYz?=
 =?utf-8?B?L2liRGY4Y0MxRTNWWVMybkhHekFhczRNcmM1YTl5VkVtYnNqa0dDeFBXSVVh?=
 =?utf-8?B?OEo1UklISFZGcVA1K1E4M0N0WnVBczRaNzhUZGpHcENmUHhlSkVzcmRUL3pP?=
 =?utf-8?B?bExvOElOdzc4Z2ROZURacWNMU0swK1RGaVl1ZWY5TG9YRjJNdVdQdmNQZXln?=
 =?utf-8?B?ZFRVWFlndkh5MjFab0FtUEJ2Nlp3aHU0ZDd2WU1ZRGtTVW1CbUp6SDhuUVdT?=
 =?utf-8?B?eU9EMnFieFhySDV0YU5jejFTR1N2ekFpaXFTQ0RGWmlMQXJBTXZjRkxhWk5j?=
 =?utf-8?B?cmFWRUpzMVZTakg4LzJMVHN4dk9weDBzYUM1YVdtR0lhNUliMUFCMXRkOG1D?=
 =?utf-8?B?bGdjUEQyLzdwR2QyaXdieEExU2U1Nktka0Q4RURMNzc4RzhMblZaV2p3QndC?=
 =?utf-8?B?Z3JGTXBsV25NcXMzZlRYYlJzRTV5SkpkRmFTSTJpUWt0WDdWbHBlaXNDMXk3?=
 =?utf-8?B?S2I4dlkvaUFIM01xYlRaZjdESlpza1hFakJKRDM5dnI1UlNCNkFWMDFXZysw?=
 =?utf-8?B?bzdTb0I3cjN2OGsxVEhLejhibDVzQXd6dXQ5QzFCOFd5Z3hhcm5KdDVOVTZ3?=
 =?utf-8?B?T2NjWG9rakRCcnlhNzR1UWdjSVJURnFSTHQrRzltV1d4SWc2M0N5L0hpam9O?=
 =?utf-8?Q?NS9a5yxkG1PkbEnE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4d1fa1-6b4e-4ab8-bc90-08de75e609a0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:53:19.9091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0n2AGm+dugVvlJUKTnG32UAQQ9qnbU8Lo+mOeFI7I4w2VzeRvcircLot5jd6HnGdds+/mXDUgRSkMRLdt9W852eTWoGVp21gsLsL6YP6kA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
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

On Thu Feb 26, 2026 at 5:30 PM CET, Kamil Konieczny wrote:
> Hi Sebastian,
> On 2026-02-19 at 15:14:50 +0100, Sebastian Brzezinka wrote:
>> Rework tools/meson.build to stop linking every tool against the full
>> global igt_deps set. Most tools do not require cairo, glib, udev,
>> pciaccess, or zlib, and the previous all=E2=80=91tools=E2=80=91get=E2=80=
=91everything approach
>> pulled in unnecessary libraries.
>>=20
>> Introduce a small shared base dependency set (lib_igt, libdrm) and
>> switch to a per=E2=80=91tool dependency dictionary. Tools now declare th=
eir
>> actual extra requirements explicitly, reducing over=E2=80=91linking and =
making
>> dependency intent clearer.
>>=20
>> Fold previously standalone tool definitions into the unified tools_progs
>> structure and use consistent executable() creation. The tools list is
>> also reordered to keep it clean and logically grouped.
>>=20
>> This is a build=E2=80=91system cleanup only; no functional behavior chan=
ges.
>>=20
>> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> ---
>>  tools/meson.build | 121 ++++++++++++++++++++++------------------------
>>  1 file changed, 57 insertions(+), 64 deletions(-)
>
> There is much work done with little gain and one regression.
Thanks for taking the time to run the comparison and share the results.
I=E2=80=99m aware that most of the changes in this series are focused on
improving clarity and structure rather than altering dependencies
themselves. The intent was mainly to make the tools dependency
requirements explicit and avoid the situation where every new library
ends up being linked by all tools.

> I used following script script:
>
> #!/bin/sh
> # SPDX-License-Identifier: MIT
>
> # compile igt source with changes in 'new' folder
> # keep non-modified compilation in 'old' folder
>
> cd new
> find build/tools/ -maxdepth 1 -type f | while read line; do
>         nnew=3D$(ldd $line |wc -l)
>         nold=3D$(ldd ../old/$line |wc -l)
>         echo $nnew $nold $line
> done
> cd ..
>
> From output there are two tools with changes, regression:
>
> 10 7 build/tools/intel_gpu_top
Regarding the regression in intel_gpu_top, the additional dependencies
(libpcre2 and libglib=E2=80=912.0) come indirectly through lib/igt_tools_st=
ub.c,
so that part is understood.

>
> improvement:
>
> 10 79 build/tools/lsgpu
>
> Can you create lsgpu linking like one done for intel_gpu_top
> and work on more improvements in this series?
I=E2=80=99m currently working on improving the series further. I=E2=80=99ll=
 take a
closer look at lsgpu and see how much of the minimal linking approach
used for intel_gpu_top can be applied there as well. It may not be
entirely straightforward, but I=E2=80=99ll try to reduce the dependencies a=
s
much as possible.

Thanks again for th feedback
--=20
Best regards,
Sebastian

