Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C768F606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dvAE+nOD;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=S1XSlzz2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A74610E1FF;
	Thu, 26 Nov 2026 07:12:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A1B1120AF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795677029; x=1827213029;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G9R8fYMMBpNqg7s/5DZN93MBiGTZR/sRKcQDV0AqPUQ=;
 b=dvAE+nOD8PIAq3eLgd3s9I9TqOpvuKCToPhyjE+UdnYITWAqVE6cJzBk
 Uora6zqBvfEiPEA8w68HJuQQvNxynqzRc20MOKylJHQaVDRlWTnxkRCoV
 ZiDo6Ik96YQIRy3rO11GWPF9kukQlyAXthU6iOzP5A2ct+hex+pOGuQeP
 b5WCyv1feAHaaJusymsYV+k1mhIzdCiUI8ABNSvt5xNSKvH2siktFTpfj
 6vqYRocCoWRArKiueDyLGwrkLnL0wXJ/NXrrW4GKayK0g1KGAlr/YVmFZ
 c0glW5Fu6jX6NVsm79kVcogMNLmC9tsZkRgbNWUP0py+QvAhgUWPL2cFV g==;
X-CSE-ConnectionGUID: 7ovgYuO2QgaBZ2206ozmRQ==
X-CSE-MsgGUID: FtG9Bd4/TQe2ng+ySITY9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4543890"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4543890"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:10:28 -0800
X-CSE-ConnectionGUID: wvRTS3CqRaOIFUKmQqgSOw==
X-CSE-MsgGUID: T8liZFxfT1yGeRX45thDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12525039"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:10:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:10:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 23:10:26 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 23:10:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5KkIhe2lt5TXVYVzImyDhCMKZz65uSJhkkk427eWGUXNMRyPdbYSzHyBDk7itTpxIQK2jO6F+SrAD4P5YERlH03gHVN4CGf8eoeR8samh0VFlfeWoiJfp23Oil70yu6Dln4rwTxJ52Pd9YklhSBRtDyia/pA6wVG+SR3Jik8o7ZK7ks9PcTiUFm/Q6ng9oZqvctEobJaDZRhVCxrn8cVJ+3RAF8O6gUFgGqLqix362QKgI6ggqapxo80mEyept4HMGtGoq+BQOt6C0PDHtzGutI7kkldwCYAPBZxK80HpRm8q/kTEYlFRp5wqTV13gZfk7h2Ov2HJ7nUkLL7uLy1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UrP0fFGxMRJLDsbka2H48o21h2/NBtSMtP01NM4E5Y=;
 b=jVHuzSMabbEhndccS8h5Vg91NAQvLT0KXRVBDdrziPvMy08T0JCQpGsQ6QUZflLPnHmTIHAtjjrSqbHarDeqqGXrJXk6X2lsvVYLH+X8fNRrJ8uGlQ1ibGBXzr7xBdmZMWLXc9tPD+f46zyQ/EnrybHFRJiA65pcWOitw8nxAaiX8aJnfHwc7QFcRakTOvPmUYPF1azm7eVdo28rowymOg46caZ8/uxbmRHb6Fsc3Lm7IMeeNAMxoNwbb2nGiCxZLykSVXCNSv0Y9MYP1RED9KGw+zsyengEAAyt9AjPwFBnKAaw55UrX3orImbwtjj0iA3JbhWc9mFIFtOcfHMYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UrP0fFGxMRJLDsbka2H48o21h2/NBtSMtP01NM4E5Y=;
 b=S1XSlzz2p+DCZouzCwYmHHUB5EOETRzPnd559MvCbHNfHcdlI5XIDo0K4gXZBjhRy3OxLwDHbcF5K42Z8MGSfVhxn3rvg9fMWmLl7bAn8eEflYajPcHi/RHB419GtkPX1zGbAjZXdP9mhsRIv7bdxrbhjyzlFk1qs/fns/Ir9eo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 07:10:22 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:10:22 +0000
Message-ID: <22222824-58a8-4787-a8ae-fc1b6aecb00f@intel.com>
Date: Thu, 26 Nov 2026 12:40:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] tests/intel/xe_oa: Check that a removed device
 can't open OA streams
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <harish.chegondi@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
 <20261104005505.3232485-13-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261104005505.3232485-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0219.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::6) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffc2ac5-19b9-4756-e8ac-08df4b8c5607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: db96e0enCS74A7hzMBEsAOlcDWHCEdjZlpMRxHGIcCXBnVHhZIs++9Zc5DJ+yJkoy7LB2Ct/XRhIKJKx+rtK4nNnwsIIiWAqdxbKwVPHWvwd1CiCK3oZRwR4wEGY15w3FlUmtynED7iyDbroB7739De7tt+gaq2QtArfmKUit6UCG/nZHSJwKrUO0B2Ai820WYBe2Quy0P5ZyNA+y5Dfr4zKcJxmIm2DFmAFmOvWoyl/I0zV94sFKyPvzCzU3/2tl0iXvEkzkk/NOpraQeSz8y7rr16oYx9dPrgbNce0zJQlWxEozeMc+ZiVXaEVFnZIv8XaCkYi5CUAQQr0qTlmPLB3mbWaueVKWmqE3hg4TEunRz+FJPUTwD3t/XfCl8iTehvKzAHBL4R8mRPfNHHAhFSNLSbBHyWx3z7RGxUEBL5n8ASiHxuo5ZxfkkO0b7lkVJQLvS7Af4iaoJo1P26Xa2LGpXPrZJrvMGvuZ7sjv5nCjjz2D9b97Po2nkYTBwHRKKPbDiitdiJRXaWgrAve9H3qqa9GoIpT/ZpWBCpd+avMQJZUgg5szG4wky22GIYzzB9U9Elc9nP1Orrv8qfzFsxes4SZRG1T/CRKLnSZorRUZY7BCN6APSFiSa20xAuAzC3q9ioKmUD8hhbx6WwOTocvwMKEs7K5GmqD2PeMdSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHh6SlBqY0tSdUVVR2RMT3hQbWNBamIzVFNEaFhkSDJjckFOeVJYZzgyK3ZC?=
 =?utf-8?B?eFJEVk9zcGpqMG9aY2VWaW5zVmVha0tYRk9lUnplRHVrYnl0YlZrRXQyQ1ZF?=
 =?utf-8?B?cU5mRS9JQ3RiVDkxa1hNQU8ydEFwUXJvZ2VHUk9nYVRNSnFCbDdaT3RNRmRk?=
 =?utf-8?B?aFBocjBsWEhZdzJQQnZ0UjNBdkUvcnZFRVBpdU5RZDJTUmE5Y25pQWNOa2RI?=
 =?utf-8?B?ZDN2b01yL0VGb00rMXNSUmVpUHFMWm4rNjJsRFN2TlpjUGxoeTJyWERmdDVa?=
 =?utf-8?B?YU8yMEZHWjRvMFNWZmJvUkFSeWhiTndmYnNFeDhqT0JwQTZ0WUYyY2VpMjRl?=
 =?utf-8?B?ZmoxdUhyYVNUaE11dVZ3VzdSWTA4OFZzVkc3YWQ2b2xNTFdPMVltT2pNWkZv?=
 =?utf-8?B?OTRPYVlPTVZpME9Galh6S0IySk9NNDlLSHk5R1g3K0NlbXpHOFEwc0t3cWxw?=
 =?utf-8?B?c2o0eTVwWU9TcFEzaVF2Y3JGc2pjUlg5R1JZR0tTMkdkTVQ1ZVNJWlZ2c3hm?=
 =?utf-8?B?NGNQbGxqWTdGa0FEQk1BcGEyVTFqa0ZYL2R0NEkrOGlSbUNRSXBDWnVXR3E2?=
 =?utf-8?B?L2xCdGRGU2tpZWR3bUNRdzZvQUFvOXE1SzN1SW5YRGJuRGJMalM2VjhoYVBW?=
 =?utf-8?B?R09IVjBoTzFVUjZnamdudlh0c2NLTGkwRDBWRGVzL3B2N2JEbDhXcGZVY2NP?=
 =?utf-8?B?MkFheFBrWlRKNittejdXN2dKeDlLUmlDUHVJL3RqWUJqRlZWU0NISlRXQmgx?=
 =?utf-8?B?TUc1cVRiQmIzaWZDMUxwZThkVXl5SnNwdUp3MUIwVFk1dHpTS0VPM1NRaUx6?=
 =?utf-8?B?dUhTSWJCNVhCUi9PTVdWcGFMMTVPcXhWMlE4M3g0ZDB6bFNSd0VBR2dUZDVJ?=
 =?utf-8?B?ZVdGeWU4M0RhWnNralFkY3ZpVkNVdzhqVDk4QzNHL2lsaUV6WFF3TmNmOGpz?=
 =?utf-8?B?eGVCL3F6S3FlbVdZK0VuRnJ2M1ZkRmVsK1dPbWx3MkJTdDN2eE90ZGw2Zk9O?=
 =?utf-8?B?MjduSFlvQVY1UTRMTlB1THkvOExGSVRYQ3pDZzRzcWU4RkhLRzNXdnlPTi9s?=
 =?utf-8?B?bUpzUjVLZC81bm92Qk4vTHNVbW55TUFlYWV0OUVWeVZrSTRVckNDL3ZNOU9t?=
 =?utf-8?B?SWdQQzR2R1N1ZWpCSWFPdWtKaStNSlRaQVc1NXpBd29hLysvQnh5QXI0Snp6?=
 =?utf-8?B?b0h1cEJINXJzdnBhRzlINGc4L0JnYkk4dnc2YTVyeVBKcTZLMkVWdktMVSs2?=
 =?utf-8?B?SXp0cXlCb3lsYU5pVFNKOGdYVEU5Q2RQNUZPREdFeUtvaTZza2NDMEhSdThQ?=
 =?utf-8?B?UnZ0c0E3eW9mUk80Y01aM0xTTlpPUml6bjhXS2grYjdiSTZOQ1MzdTZDZ2tW?=
 =?utf-8?B?MmFmWHU2MW5QeU1HMWE4VnhoaXBJbGpmcFlabE1nRGwyR0RzMC9QYlpVSE1o?=
 =?utf-8?B?dzk3bWd2UDlTUEJJbkU1NEFGWmhUUDhYU29zTVJLRUE2SlZBT1ZQdW1hbGhq?=
 =?utf-8?B?SlM4dXhIVXlwa2x1S3NKWW1vQUo2ZnZUQnRpenI4V2tGM1FrelJLSWtZR21m?=
 =?utf-8?B?NkZ5SWRHbElEZmNsNXQ2aGJyczBOTHkrdXZFUStFTEYvU1AvOXJmR1BIOW5M?=
 =?utf-8?B?OVpWUTRZSlR3U0hZSnpWMzJOdk16ZmN4YWdpSkhhLytsUENjOVBUcm93Ynpu?=
 =?utf-8?B?OENQNUxCT2dmYmVnbWp1QVFBSVhQNUVMQ2YxaGxETWorS3IrVldWeUV3blJT?=
 =?utf-8?B?bW1RQ2lpN1NDRnpqUXR4a0dYTWZMUnQvcGxnajJTaGpXS3hFaUxicEVENkJv?=
 =?utf-8?B?eFVUQzRZWHFEMzZRQS9xUHRPLzh6eHJyNVdXdEVSLzZuem9nN0dCVkxUSGNO?=
 =?utf-8?B?WG9neENuclZGWHlKeXdJQzBIMlk4d2hiZkNJYWFDYko3c3pwTzRZRnM3T3R3?=
 =?utf-8?B?UUhCdXFxVElWYW1NZWo1RzR1M2l5YVhNQkpwSEdUUGZ1eW9xcXhrcSt5dW1P?=
 =?utf-8?B?eVRqeHByMHR6dmRROGNkVTVwVUJicW5vaW9xTnk0MHd3KzN2Ny9mWjVvOTRv?=
 =?utf-8?B?RURxYjg0Q3Z2TmpPOTIvekQrMHhEeXpzTmRJR0xYa0ZuKy9KcUFiWTRUVGFL?=
 =?utf-8?B?bXFPaGQvNVVzRldjQUJyNWFjaVhBNXhIclFRc0dIdEhqNlgvY0htSE8wVjE3?=
 =?utf-8?B?SUlsajRKQ2Jmc0tSMmN5REhLUkx4MVozNWtVMFVSQ0tPSTdmUkZtU25CR0lZ?=
 =?utf-8?B?ZXV5REJkeHZIU0t0NXAwa1NXWE1oTTJ4cnJ4ZVdXS0xNMEZYYkxmbU5LQk1o?=
 =?utf-8?B?U29jY21lRWdjNTBYampkQys0OHFSRkg4VEg5aWUwYTEreXpyMUs3UT09?=
X-Exchange-RoutingPolicyChecked: EDDahkqqAfVh7a5dgX9d3Evl8sK3pVu4LJY9t7r7bB5eJoPthR3OuOpt54KqpbG9fR9Kpcdn+hZ/BM5sfdE/SQzF4Fgdwjj3LJrDnAfiTMCdXgXCS/JZL/JDVUxzQqCIbLoUfq+k4kw0Q56bNR45A57zOSAAQBsYcEQZ173kUSfphh4Bg4MqjQyFp6C3tvrqqq8R8fy0WI+nIuxTFnu2YboQGIQDxkra8fe61rkz3nsBWcAu5mFyT0JF89FY2/4ojEcEoK5wBYYtVCCsbswB/5FIGQHP7QZF/Qx6PoXZrZhP/jINBz7IxAczNzOJgSSoaumS2OgyHZp7Qb/sG+2LnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffc2ac5-19b9-4756-e8ac-08df4b8c5607
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 07:10:22.4190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZeNY3DASWMioOniQkXlgT9z5RKg3QGvXonaWuXlGW8+92+nOe3CWlvQNgahunSP6oD54p+a7vq8ym7lw23DdOCEEIku7lR2loRYjRdNNjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/4/2026 6:25, Umesh Nerlige Ramappa wrote:
> An OA ioctl that races with unbind must not reach OA once it is torn
> down. Check that STREAM_OPEN on the drm fd of the removed device fails
> with ENODEV.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   tests/intel/xe_oa.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 046d57c3f4e8..e10b77bca1b2 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2937,7 +2937,8 @@ static void unbind_rebind_recover(void)
>   /**
>    * SUBTEST: unbind-rebind-stream
>    * Description: Open an OA stream and test the effects of unbind and rebind: the stream
> - *		dies and the device works after rebind.
> + *		dies, no new streams can be opened on the removed device and the device
> + *		works after rebind.
>    */
>   static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
>   {
> @@ -2966,6 +2967,10 @@ static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int f
>   	for (i = 0; i < unbind_num_streams; i++)
>   		unbind_stream_check_dead(&streams[i], "after-unbind");
>   
> +	/* The drm fd of the removed device can't open new streams */
> +	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &primary->param,
> +				ENODEV);
> +
>   	if (flags & UNBIND_CLOSE_BEFORE_REBIND) {
>   		igt_set_timeout(60, "stream close timed out (wedged?)");
>   		for (i = 0; i < unbind_num_streams; i++)

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

