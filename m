Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043FCCCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 16:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFFD10E647;
	Tue,  4 Nov 2025 16:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZgzFsnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF1E10E647
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762275091; x=1793811091;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Ctum0iVEWkGxCbhrx0ldaGQwPspx3Hfk3ZT+Dr09NDs=;
 b=GZgzFsnlsK3NoWYTndUKpdTjYM7ESqkj/fxHlZYl3BqCmgJ9mcl84FHo
 ktiYaF8vdZeXcOiuHun724AFVggBqzgFUGaWnSF5HLabtffxW4xZzlLm7
 5B1yDH0As40Wf5lqnd10mcPFTx3VV0L6BVcCqQUl9ix+EzYG5s0nfwVhy
 c4DNx4WM8PioCDJYSoghQ8H+hVicRVUqk5WzCc9+8DJyl4OIirsZe2K0M
 yXvRGQ1iSFMMUOJwPFWJY5S3z45p2elqa1TOimm0HI++ZDvwv3prV7p36
 jq6DH2AdtygD/+pKLTwWuLHL5LLDpapzdA0JPC2VMqY3R3JnxL9/BKbHs A==;
X-CSE-ConnectionGUID: /g1je1gNSVaaEEfYRVR7rQ==
X-CSE-MsgGUID: qQC7l6OJTEK1FGAlfA980g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74981092"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74981092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:51:31 -0800
X-CSE-ConnectionGUID: p+paJzybTUe3IBoRlBCmYg==
X-CSE-MsgGUID: u2WC4Up7RH+gWz9yiqIbcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187653046"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:51:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:51:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 08:51:30 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:51:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBXV9bHTXxiFj05tDPEyigqxZDP50m4HF+kayU0eJjKW/jw8e0boH3HouMTxw/sFBnaq2VroOD4S8deQ3nu4IMU0t37xzgV8bSM/BHnnVtXMgIEHVnm29DBvqdwjo61mjnsbH0hFlq3BSkeUSevTU+zCKOhj/BmTmqh+d8CXbqX4ToSnnqYDphGDHk0YNUjJWLhljzsQt0OeyORIQm1506oiVom5zfssh7VbUN/eWU93E76FMDjYXPIBTk3w/jaJ6EJtc9euujygI39Ibfc95fr+4zc7b04dkFSmOCRHmbbkksV7GJ7dQ0Dn6jVWoo21u4opGjAZL9myxPMrlMMcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfceUWqIpUWTF+X/lhJeLIOj3iNQo3qKNCeSECzzye0=;
 b=Np3WkxeCwV6Ny2xYeLtgQ9DPFALgcgvqf7d5HiGHyi5vYNpAHCCiVPpoE+ojypilfSLbM+16Kr6vQUNTV9fP/Tg1H9jHNUzcIYtGhk5dyXhgzegm9ot+ROhrZE4Z1cNRjabYnMFMHUmH8kItSi6aPIK5ocw1ymFoXtpej4CUXGidqiKaoTYy14PRvcF0pU813Bx5e9NkPk5tbwcALeCPvcqKBLDmlh21mIU7rBIVcwI65s9YSm306em19E/AHpnE0/2eOL2AKAakwnB+3r4I3D+mr+0QST0VPSqVq/isErL0Z5BLsFqkblFyMcFbp41IeQeEB5OSd4ntjwEsRVkSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 16:51:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 16:51:28 +0000
Date: Tue, 4 Nov 2025 10:51:25 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_configfs: Check for invalid
 char in the beginning
Message-ID: <s7cfzqswblu4s3znkgjd6n2rrh362iimgp7z5zij5ypl2ozbqs@q67yta3dllsy>
References: <20251029215947.3580744-3-lucas.demarchi@intel.com>
 <20251029215947.3580744-4-lucas.demarchi@intel.com>
 <20251030101611.ssl4b6vauahdyclj@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251030101611.ssl4b6vauahdyclj@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: fc41b5f1-af29-49b1-0e54-08de1bc26615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+3a0LbUkXMy/TwQDQ4NPgsHB8Ovby3I2d5Ur+j61ArFq632VtvWiMGOsdHhl?=
 =?us-ascii?Q?P+Di7fJvy6d/DwC1ccmw3daPkMAB3sZcXN5fmaXkryDE2M1A5rWZTfJklpjj?=
 =?us-ascii?Q?X/OLWyCViA3FWdtLxol0YQPKMsgWO3zxUgRDPY9zEg3CaSWtfJb8WVoCckjz?=
 =?us-ascii?Q?dv4PKD0BVH3Irbr7zlmRYzq90fpxmru1+MsXk66icE0nP7KvMyp/erNuk5wZ?=
 =?us-ascii?Q?K0uE1WaSCjqSZjnhmsRfNLHPsZiKH0P8m+BXp4BalXGNGvqa32ISCvaOHmsr?=
 =?us-ascii?Q?Pz2zIf1WMWrvZuX0uckBn6pd7Jo+j4maz2vzjuadsKLQFlL1XQxO/FGqwu41?=
 =?us-ascii?Q?sM7/rm8iE6rQR4tOCL+zto6yaRdWLoda6jUhBSl4y/rJGp7VWn8xrYkn21sS?=
 =?us-ascii?Q?6sYEOhftsrgC8tX8eznHpGKRFUpvN4MIE7iyOxthaKsa2gbofjqVj2zCKy66?=
 =?us-ascii?Q?maVSVWboBiYyPE1nHeLCwZZJOyzkUIcyp+m53QmUc+rQG2kazhBC79qyqD0G?=
 =?us-ascii?Q?w0sIwOEYebNaDP1U7tY7f32SZ6DRevk5hRA8QU5GISwQt8Lql4dLQ+tk9Un8?=
 =?us-ascii?Q?gf8xUA+BO+1lJSXHe2nmpwWTDQBVjY+/PV0/ayCNr878YRzvmzzf1/3LpVyr?=
 =?us-ascii?Q?UQzczo8mu8p4ijPAOte2NCjjS6ZLxBhlTLZmJ9sGTt1iMCq/gWyYaBmNG80A?=
 =?us-ascii?Q?fRxzIW57Cc8nIfl87qQhucyIz2SHlQB5Wyzf2QdZMt4nh4IQwXXuNmg8Hi6r?=
 =?us-ascii?Q?rKKAJb9A4eoN1Q77ie7d7gZEPDVaYEYjNU/mYHh3aTeJgQ7bRM32wcX6eXZ2?=
 =?us-ascii?Q?r8DZx5hggi2oOMTYxRc47nBzN/sRsUsI33rkxw+pvmx+NgMcLh5QRxvRZiEp?=
 =?us-ascii?Q?WzqNzF0HHkYceJY6jGPtsuQAL13OfycrUqpHjhhajE+rBZTIpkuUqdmyGogO?=
 =?us-ascii?Q?LS3+Ys3dLApKRZDm2LCn/nRpX9zH4mAab1+NeAAkwL96vR+3wbUItUZd0deD?=
 =?us-ascii?Q?DfrNqZj+VkEn5EOrmLqC6qyFuhmtEgjcHk4UG8/XS0GeL07f4OaPs39hmOcC?=
 =?us-ascii?Q?Cl5WlJcrNnkZ2H+qJQgpXUM5VdAYGLSbMXkuSBUALqdCC8wnrGYEZTAIAB00?=
 =?us-ascii?Q?lI2aWM9HMwmYIZvSDASi1dNHjPsxzZzMbPpPb2KO39m2rQLvw8c1C4A+cvhG?=
 =?us-ascii?Q?LJJD9FeYAC7mJLQ13uVu2ScGXV0HCX+pD/Fjh6v3OVt4j7m1D5Fc732ESTPZ?=
 =?us-ascii?Q?nR/fkXSLiJLCJeuT4Sm1TQMWVN7enDZ/XKK0xPt4ZKzSjaJaOEo8nN43EIFp?=
 =?us-ascii?Q?jsIfuS5/kwvtjRBqZbcobK+LpgMbAyut1vodpFkA5Pzxa9Nv6wUp4oSss4/L?=
 =?us-ascii?Q?3Wk5gFx6ZzKc5nlo2dMgTINA+wKRQZBSXFu/y3QEHt99JTsRXqnJOUti34gq?=
 =?us-ascii?Q?JyDMm9A4RmoC1C3A5J2zQFT6MyAMGQmk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+lLopwfBYQI6/prlKZ8+XoSEOwgpWf4viDb7nHa4ZDr2NoMc4XgzJRs6MlRO?=
 =?us-ascii?Q?zkQvTx+b86U6fNFtT1EOxA1N7OORBMp0YyE2chxkwE8+YlUJprJllZVHA/zw?=
 =?us-ascii?Q?AJSo7yUEBtDXqA8t8a/yvx6yqerYjiHOguoROB7OUJhstEfYyhACDDbp5T+d?=
 =?us-ascii?Q?ioVg54sz2JN4s+4mUKm+h29odp/1MYHI1a24dB5m/2zm8xgZbvtfRMPHqYMw?=
 =?us-ascii?Q?rpJ72MPqQtCt2LjudszH56fSXeadoils50mkm69IF11rOJz48OyDma3DWEh7?=
 =?us-ascii?Q?pDACmM8fVZxO09fQQa7VFw+VoM+lFGgsiJXjPfWRn0wukmn4OZwGmOpP0rRw?=
 =?us-ascii?Q?8ZjxUiLX7/+xh5W06IJ+zngPEJFrDAAO2AMa58QlY3vF6UCDKZVVFNSy8cl9?=
 =?us-ascii?Q?fAC8b7Fw0QCkFCB2KrysgefxsNYAYUSxTFTBo5W94DXpe3RvPrGZfsALDs7x?=
 =?us-ascii?Q?4XHGC7SxLCg7Y/OKO+FKFv3qSAKYTd7KRU2rojI6+XLmfWnUVnzpQDSH199x?=
 =?us-ascii?Q?x4TbKq6QjleY6cyQ+5hTTLG3kio4O5Ua3oHkzt3w5kDtsAN4FVtFtNcFa6Fg?=
 =?us-ascii?Q?duR9zVN0n6dujRs/fQvHUIpvRMN5A7a67BaYhYbSDq3ckkzTpoIp+lXlzsDi?=
 =?us-ascii?Q?GoOdk3gEGcjNc2HjQL1uAALq/fH8XsNdlWMJ1CXqmDO1L7MMjTze0nftCRBx?=
 =?us-ascii?Q?65UbBZMAV4hMkn9JQRJ2TQcKXzaLiAVeADHwjwx2EB+TGQkazCknqsNbftat?=
 =?us-ascii?Q?O19g2brSQsUABwr3xNKU3LzrEh3dyokVNFbukj+Jl2bBUrEuWUxCtVEeCsUE?=
 =?us-ascii?Q?lMZaxw6htXELoWQB90b0X71TyzzIARtCecKRoCfJK3Uloh0ePaoYWPxNVnP/?=
 =?us-ascii?Q?A96446905L+Q6FIJhmpu4zOHYHdDo0dS80uKRyIzKBuK/52PkPAq3faxRmD4?=
 =?us-ascii?Q?uMdGmrkP8ZVq3ZpdtVpdMwr9nAkMH/mmZJ57AeDH4gDLX8b++MV4rBp3vwOn?=
 =?us-ascii?Q?SLIvDIPwXUtyFfyugHGOL7D5mb0Nnzae946NxDYyL+DAcNM1FBQo5/G5i5Vi?=
 =?us-ascii?Q?m0rN+UqXd5hIUBJ2JW5Tdr30VeEzO9Kyg7yf8j8cfivXprV8dcfNfQEAjJ4u?=
 =?us-ascii?Q?v5bDsk3kMTERl/z9bhZ0VpqdJmrGmtThCDscYcklwyxUWU4xr2t8DxmG+J5H?=
 =?us-ascii?Q?ehHYCMtqI71qhe+wGNyp48mXmrsU1mgJYxK7xmLGfqgaKzYjOE+gDJCvkDI9?=
 =?us-ascii?Q?9yIF6fJoCpDz/p7aDEN97oD26JCHK1yKFRtTjiYlpfHBAM4yc9DYjiQ73mER?=
 =?us-ascii?Q?OjtS9cH/62yL7aD9jHYx5G87FevLoJ7uzboDDeX0Hi0Eg/pIXxs/4rQiDmc4?=
 =?us-ascii?Q?/1Pd9tsfQ3rd2Ijqhn2t+mS3iZWYD0dgMoQhDG/WEypCQ0QwNfoMsj+jVkLl?=
 =?us-ascii?Q?CYIxcXnVGhqsFWMv8s+NyeCEQ7DAcoeA7WvN2ccKtBZuohFL4vGwk7JodyOk?=
 =?us-ascii?Q?MXCQVURm0Vmx7iIvB88c5nneTPpf1WjHD9/j+SJpfIBUl8xeAH6TU7O/LTF5?=
 =?us-ascii?Q?hpdZ1NmX7s3ZMxY4vnDJXh5al58Zh/GayMkmOPqfnbJP7wzMtCIA1sVbt6AG?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc41b5f1-af29-49b1-0e54-08de1bc26615
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 16:51:28.5491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHeVZd6a5SV02139SZlG3FfS5kT8yhVgEeKPbG3AiUFhwJXFs1c2slY6jLdSAcQNgJrcOz0To5zOF2NHoPUMuL0TjhFwoF59XAi6yqO7CN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
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

On Thu, Oct 30, 2025 at 11:16:11AM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2025-10-29 at 14:59:49 -0700, Lucas De Marchi wrote:
>> The test was supposed to check the beginning and the end of the number,
>> but was actually doing the same check (the end) twice. Fix it.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  tests/intel/xe_configfs.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> index ecba69dbd..08b0b0ae8 100644
>> --- a/tests/intel/xe_configfs.c
>> +++ b/tests/intel/xe_configfs.c
>> @@ -168,11 +168,11 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>>  		{ .test = "invalid-type",
>>  		  .in = "rcs 11000001 4F100 DEADBEEF",
>>  		},
>> -		{ .test = "invalid-number",
>> +		{ .test = "invalid-number-end",
>>  		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
>>  		},
>> -		{ .test = "invalid-number",
>> -		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
>> +		{ .test = "invalid-number-start",
>> +		  .in = "rcs cmd g1100000 4F100 DEADBEEF",
>
>Looks good, what about invalid char in middle?

yeah, makes sense... I added one additional test and sent a v2

>
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

thanks
Lucas De Marchi
