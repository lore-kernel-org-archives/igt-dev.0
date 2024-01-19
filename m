Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00579C47DAF
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 15:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9822410E184;
	Fri, 19 Jan 2024 15:33:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E95010E184
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705678411; x=1737214411;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fR2b/7wmej4Xo4CWdphaLdLGw+5TMqs2aBFHl74bjZM=;
 b=CfiDWRBdiYNIuhUIjImgLjeTXOeqqTDk+utD6MiHvze6cVqgx6frS9bk
 8MgObBmMQiMJMs7Ac85rJi0sYQEjJgI69P8qGMJrKj1NQcliK2YUtd4Ii
 XIJiBQBi5T6KF4K31J1TiE7cFY1iZkX8OibO92Znrm6oGsOI8cwcx22k/
 9br1srfGfcY8W+TnkG+Vi6cm+Yh+u5SS5+/IUHj9yNset+s3GpFdPqyuS
 VYKoTuTvjVobEQxxSV8hyyu6FACRBZhRjgV4DZmo04XoRWpdL6V63Pgvf
 CHLASIONnNFSP4f9c9RYawvaMwvePiN1WVT7fUdhKCAQP0wqgCsAl93aB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="431940882"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="431940882"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 07:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1031982587"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="1031982587"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 07:33:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 07:33:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 07:33:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 07:33:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyIqi52oTZCNUQHAxdoCoHR4i2hgBEh6EYy+PP4LZmfSgBojdhGfCOjqcKIPfClmMuvSXtWlAXiYHMxz0cca1ErDS/HVb932AfunUc2gmUubo3YYCU0Y6ZwlQpKrHZXg7Dipr92oiKWOor4dtOGLOvOXa9is/So+xPNE/PxdKmy+ScgSwuGW/ji92+oOi6+VXruIz7iD6IEbGlDCU8hMzzzcuJCbnHD1Z8dLwGfTVFpqx5+gzOWVaIszGiUX3VAgJsFyBkTrPcUktqN+ntt9PL0iWLC6ELzko+rKL5IMtad4IRpg7yA5PvsxhdwtkBCpX4fYfeRhWyWpKG6b4VJGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PEv8Yj+YWekm74zo09C1gZDUXiDnTwyHGH5fSpCwqQ=;
 b=G4z8xbw9WSjQr9KEfIznkn19fFNAZHxN7B44TvZCayETgceCrW0aMjf7C7cSTCLaiJwYyUpQSGB3sL0KFLQecxCjA4V8xZ4oRLqH3yqVdjJ/tNzfgEIxK61nYxZ3Dph929B7nLWhb441F4EkiBCX6SnZcJ6h1jGlFqaeWrnTkcvHqoV1QGoLjfp59XtxBXioxGdvm/BDuEH9Nv/5IPIz1VZGjYifjEHcn+93yPOns4TEbEo/O2suW3SE/KE7kj0gtdplACuD+2dOsUSnaNrtNducogCS103x2SqwiLCFpLma6gWwhGigDym7eZVn3Khq8dF0MrvEQbHQh+cYh8PgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 15:33:22 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:33:22 +0000
Message-ID: <cbab0c90-db94-4ee6-aba1-3382e42cd51e@intel.com>
Date: Fri, 19 Jan 2024 21:03:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 3/4] tests/xe_pm: Add d3-mmap IGT test
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240119142823.1711688-1-anshuman.gupta@intel.com>
 <20240119142823.1711688-4-anshuman.gupta@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240119142823.1711688-4-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2478a7-4738-4bb4-abce-08dc1903f82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixg68HuISGaQOadUvCMS8Xhzq/3QHDMabqmI+TahUsOAFkHcQdu968Xz9lRur1584tnP8tdcoJls3ONwDbajDZ5JV6AOiEoU2DJ9XMhW92f8uCsB1MIDThhGtKR8VwHjpsHLc6U8MS9c9iss4DDvQVJCXWPe2piXR2JyJ7GpLWtBwyXVRgiUdMKiGGNREt52nUX4QlFioZluLFig+SNDngDq5RLQ0ClcA4ybNPuvVmYaWNz4qV3jGtIFcLBo+SDC038UNmtU+VnoewN+ENVq5a93RLo1YEjz9sX8qiaOCq/rOP7YoWQeQhPi2kW1Ebjf03Owmu2TR2BRItoX4L7+HO2CVf36U/CPmct5W1nXSKScIqXr/LZa2JBEWHneJD2eTqMpKev8ulT9WH9YwFRFDy4vz09egfWBCAdBDHTPQfhLsrTNm8A29zMw3Kv2CwJsNxc8u7PcNrVQacJksip9K9wqhlCTkBl4YyGvvGvgdSkR9EPgOgncA+FN7CrmhWF8eWni5b0ZXMhz36fbSdcxOiaGK7qCpoPEcHc/tpAhHw1kjI/qNzC0zt5av8nv0MHQFJYGJ3BxfiGr5D/MhXIG+ZgPlBvIXVVjrOJwClA5HiuFHZPkm2oQGcEQLWtdqM5a+iOqQjPLw+DcRO/pZhVB8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(31696002)(478600001)(316002)(66556008)(86362001)(66946007)(66476007)(8676002)(4326008)(8936002)(6486002)(38100700002)(82960400001)(2616005)(6666004)(83380400001)(6506007)(107886003)(26005)(6512007)(53546011)(41300700001)(36756003)(5660300002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEFrY2c3REtERXpEenUycFpKNUozVVFwZ0c5L2tDVUZJMm82SUJSVzlHQkhN?=
 =?utf-8?B?RktpUFlzUk00bU9yN00ya2dJRnUxNjh4TzNOMDVBR3MwMForM3oxZ1dpR1VM?=
 =?utf-8?B?ZGRtSmsrakV3c0hLeHFaK0UrQUp5WmhyazJEUmVTQm9CQm5sSFVPR2VLUFRP?=
 =?utf-8?B?NkVuQ0IyOEJ1eXN3MU5FVUFrQzB1eERLald6SG1KS0RzMGRBTkpRSEs2VzlT?=
 =?utf-8?B?Rytlb3dIMHR0N3ZOTzRnRUs5dVpmdUZKTU1kK3FzTDU1TUVGdnpEOFJORzJV?=
 =?utf-8?B?bncrTE5qdm9ZbHJDbTA3OS9id3Z0aGNIeXAvRjVNbmhSV01ENXhpUGhwRnU5?=
 =?utf-8?B?UGFzN0dDRUtjaXQyTm95MHE2Z1lsVHFXbXlnN0tiTkFrbWRoM1NSR3E3YlFU?=
 =?utf-8?B?Ujg2MTJvMkJwTVNRQTFoZ05CdHB3cHIyVTJaZlV0VEx0bEp2VGwyN0gvMFdT?=
 =?utf-8?B?S21heUZmVUdiWVJCcVZlQWY1ZDNMZ0RaMWliLyt5c2V6M3Q5clFSblk0VTZT?=
 =?utf-8?B?Y1pkcTFCaHF0aGpaVDY3RklZL3BLWFFrUGZjdEFmMkxMY2VldWhrQjhQSUJI?=
 =?utf-8?B?dHMxTVFLZTZjVTRxMFlRN1RBTnQ0c3hBQTV3L2NUcXhlVkkrS2c2U2tBbVhV?=
 =?utf-8?B?RGp4TElIK3ZFeklkY3lIS0hKbVpUd0tlMHhMSGI3OWRxRE5oR256dmpFOTYw?=
 =?utf-8?B?SCt2QTB5V0tCQU1mY3BiZG5XS3NqSElSK0lZQVVXSnVCZ3MwWkkxYVZBTUFX?=
 =?utf-8?B?R1ZVa0IvVklIeURab1E3TllSY3BIU05kaWhyby9vVk51Slc1dFZhRDZNeDVo?=
 =?utf-8?B?SWJSMUNwVXBqclBRQXp5aG9JdlRuU2FrSEZHSHRkSU40VHY5dW9RWEFBVHJJ?=
 =?utf-8?B?R3g0WTF6RGs2TnVNVXQyMkVQaXJ1MnVuTXg3S3pLdDZaTFpnWnBEbUZEVVhH?=
 =?utf-8?B?ZDZZbTlrd3NGNXdjaTBRdHZUbTNMVkRHWTlYMEJaZ3JqU3FUR2E2RzVIR2c2?=
 =?utf-8?B?b2NhME5lNE53bWM5bU1yVDhjQVFBcmRJUFZUY1NZbDM3eHR5ajl4M1BOOXNF?=
 =?utf-8?B?Sng5Si80ZDQ2a2xkWHh3ZTdVT2I0YXdHNGVUU0pwUVhJMDlabXp0QWFjRmw5?=
 =?utf-8?B?UDFmL3FkaE51SjRKdm02Sndrc2tCa1NLK29ldjducHQza3hjTDhkRHpRY2sr?=
 =?utf-8?B?cWljRkFhY0FFejdoVEUxMUtQM3pUaUp0L0hwUDFSQnRIYkgwRFYwaGl4R3g5?=
 =?utf-8?B?SHppK3VkVUpmaUhGK3pXSzVsRVhYV0lLTWlubVlOa2MxdFIzV0tGcDA0YWtz?=
 =?utf-8?B?YXNPaFVzeGRjbUlVNUl2Q3YrZWN6OEt0Z2NmaTdhd1ZwMDNpZU9UQ1duRlc1?=
 =?utf-8?B?d3dYL0JQS3llRXFJVVhxYVlIWFpMWFNTQnpuWXMyK3JKUUcxZms5VHZtbklV?=
 =?utf-8?B?UzVlTHltL1hUeGxGSG9WOFBHNkorKzZ4OHd0bmVlcnV2Rjdpd0tTWkkxM2Ft?=
 =?utf-8?B?ck82WllxWHhDenNiT05URWh4dEQwK1ZNVjJ0UkZmWkZZdUQ3SkhVUHNiVi9G?=
 =?utf-8?B?NzViQjRZV2paTUQzdnk1Z1ROTmJhYVRLbS8vcE9TeXZibUp6TUFLVDJtVmR0?=
 =?utf-8?B?ckg1T2V6TC83WEhXcTNEZFVwK0d5SldYWk1IYVMraStDRW93aWdCNS9PV3c1?=
 =?utf-8?B?dzBSY3Jkc0drbUorUDYraTFoN2E4Y1k4ZEVHc1J1Wk1IS3F2ZkQySXBqYnRB?=
 =?utf-8?B?bHRLT2c3OGQwc3JhM3lhWW5laTlyNmZ2NVpJSGtDTGZjMHdjSDU0ZHlaWGRi?=
 =?utf-8?B?YXF0Ni9RNVZKUGJ5TFhLMmhMQ3pvTWRtTHI1WXkrdy9IbkxTZXlwREcxTngy?=
 =?utf-8?B?dDZYTlIxUytDTDhJR3FTeEdmYms1dlJWVmlmbUhvZmpRT1Z0SlhBZ0pVMTNN?=
 =?utf-8?B?bXZyMCtneGo0RDZNcWV2bHpQaVlOeXNZaW41cVdwM3hFbkpFcE41SnhEd3dl?=
 =?utf-8?B?MXB3WllZblg1L2N5QjNXdEFvdTJuekVIU2ttUFJLUTdWWXlBSDZDMmJZQ2hQ?=
 =?utf-8?B?WG8wSWFHRTE4T2hwMlRHTTdKVGoyekM1blQ4WUg5aDBCQlJIMEI5dVB5OS9E?=
 =?utf-8?B?WDVjVjRsZm12MW9uMnMvZ0xjYkU0bGM5ZEdCcmxLNmwvZHh0YWp3VWJoNG56?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2478a7-4738-4bb4-abce-08dc1903f82a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 15:33:22.1848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUl0XCSY0MGdO/Qgj1G+X2mHRFYvBvJicAxdxHsAJX4hOKd17VN0iatlASunv0oHz9KOsmpA7wBLX2QnhJ+thg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 19-01-2024 19:58, Anshuman Gupta wrote:
> Adding a test to validate mmap memory mappings along with runtime
> suspend and resume for both xe device and it's pci parent bridge
> in device hierarchy.
> 
> v2:
> - Use 0xc00fee pattern. [Rodrigo]
> - Test the pagefault case on read and write the mapping. [Rodrigo]
> 
> v3:
> - Cosmetic comment. [Kamil]
> - Use MAGIC macro for 0xc0ffe and 0xdeadbeef. [Kamil]
> - Fix xe_bo_create() with respect to Xe uapi.
> - Set auto_suspend delay to 1000ms and restore it.
> 
> v4:
> - Set autosuspend delay to 1 sec for entire test. [Badal]
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_pm.c | 99 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index f793fd24e..9cb25d47c 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -30,6 +30,8 @@
>   #define NO_RPM -1
>   
>   #define SIZE (4096 * 1024)
> +#define MAGIC_1 0xc0ffee
> +#define MAGIC_2 0xdeadbeef
>   
>   typedef struct {
>   	int fd_xe;
> @@ -476,6 +478,79 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   	igt_assert(in_d3(device, IGT_ACPI_D3Cold));
>   }
>   
> +/**
> + * SUBTEST: d3-mmap-%s
> + * Description:
> + *	Validate mmap memory mapping with d3 state, for %arg[1] region,
> + *	if supported by device.
> + * arg[1]:
> + *
> + * @vram:	vram region
> + * @system:	system region
> + *
> + * Functionality: pm-d3
> + * Run type: FULL
> + */
> +static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
> +{
> +	size_t bo_size = 8192;
> +	uint32_t *map = NULL;
> +	uint32_t bo;
> +	int i;
> +
> +	igt_require_f(placement, "Device doesn't support such memory region\n");
> +
> +	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
> +
> +	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
> +	map = xe_bo_map(device.fd_xe, bo, bo_size);
> +	igt_assert(map);
> +	memset(map, 0, bo_size);
> +
> +	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +
> +	igt_assert(fw_handle >= 0);
> +	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +
> +	for (i = 0; i < bo_size / sizeof(*map); i++)
> +		map[i] = MAGIC_1;
> +
> +	for (i = 0; i < bo_size / sizeof(*map); i++)
> +		igt_assert(map[i] == MAGIC_1);
> +
> +	/* Runtime suspend and validate the pattern and changed the pattern */
> +	close(fw_handle);
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +	for (i = 0; i < bo_size / sizeof(*map); i++)
> +		igt_assert(map[i] == MAGIC_1);
> +
> +	/* dgfx page-fault on mmaping should wake the gpu */
> +	if (xe_has_vram(device.fd_xe))
> +		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +	for (i = 0; i < bo_size / sizeof(*map); i++)
> +		map[i] = MAGIC_2;
> +
> +	if (xe_has_vram(device.fd_xe))
> +		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +	/* Runtime resume and check the pattern */
> +	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +	igt_assert(fw_handle >= 0);
> +	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +	for (i = 0; i < bo_size / sizeof(*map); i++)
> +		igt_assert(map[i] == MAGIC_2);
> +
> +	igt_assert(munmap(map, bo_size) == 0);
> +	gem_close(device.fd_xe, bo);
> +	close(fw_handle);
> +}
> +
>   igt_main
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -591,6 +666,30 @@ igt_main
>   			igt_install_exit_handler(vram_d3cold_threshold_restore);
>   			test_vram_d3cold_threshold(device, sysfs_fd);
>   		}
> +
> +		igt_describe("Validate mmap memory mappings with system region,"
> +			     "when device along with parent bridge in d3");
> +		igt_subtest("d3-mmap-system") {
> +			test_mmap(device, system_memory(device.fd_xe), 0);
> +		}
> +
> +		igt_describe("Validate mmap memory mappings with vram region,"
> +			     "when device along with parent bridge in d3");
> +		igt_subtest("d3-mmap-vram") {
> +			int delay_ms;
> +
> +			if (device.pci_root != device.pci_xe) {
> +				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
> +				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
> +			}
> +
> +			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
> +
> +			/* Give some auto suspend delay to validate rpm active during page fault */
> +			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
> +			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
LGTM:
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal
> +		}
>   	}
>   
>   	igt_fixture {
