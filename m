Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83A2CCA46C
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 17:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C44510E047;
	Fri, 16 Oct 2026 17:03:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2CD10E047
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 17:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792170143; x=1823706143;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mpz8I8f3dniT23FAEQ8tAJ1E2ONuxoMQOYwQ4rHpnDg=;
 b=PVNOD4Ywi8aCq6HA2Vev4K6kZX/ALm2PbCt7rXW0AEmj+Jeownq9F3x3
 RcchFl99egNNk+ENZeD/twwYciQb3cvbxG8bCVoLO1CmpG0ggduFAs9Sb
 ImWUX0IYN4CyE+jaX80/6ZuPRPskJtGBXmsi9qDfD2mlMIYPvSyOtpRt6
 3WdTdZMWnh3mL66JRq3GgmOkQXRJWQg2X/SBNcCLv1O0UVMAExHfzKyyN
 zCeTNoz5u5EETycv0rE7I4Zs5ATV4m/ubL7lgX3+iwOSFbOkX+lAON9mu
 /mhqVRSD4/zdlIP7gzpnZ4BYk1XOaj1KPnnZHgjkZQwxlsZGkCb4WAhUP g==;
X-CSE-ConnectionGUID: Hmk1LANETkqba/HKpKpsdw==
X-CSE-MsgGUID: WwhO3/3iTeWRiIBfCP+mIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="824624"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="824624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 10:02:23 -0700
X-CSE-ConnectionGUID: iAElytbqTpmKk6ogAVmd9A==
X-CSE-MsgGUID: 7ZOhZISVQ4O+4Z52qh1koA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2414973"
Received: from manusebx-mobl.ger.corp.intel.com (HELO [10.245.80.139])
 ([10.245.80.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 10:02:21 -0700
Message-ID: <91ba5d81-96a3-4697-8fd1-c81aa287e9f8@linux.intel.com>
Date: Fri, 16 Oct 2026 19:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tools/vmtb: Skip double migration tests on
 no-debug config
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20261015071037.10898-1-adam.miszczak@linux.intel.com>
 <20261015071037.10898-3-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261015071037.10898-3-adam.miszczak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 10/15/2026 9:10 AM, Adam Miszczak wrote:
> Double migration tests depend on the debugfs 'resfix_stoppers' hook,
> which is only exposed in a KMD debug build.
> Add autoused 'is_test_supported' fixture to BaseTestDoubleMigration
> that probes for the hook and skips test execution when it's absent
> on a guest (first VM).
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/vmm_flows/test_migration.py | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/tools/vmtb/vmm_flows/test_migration.py b/tools/vmtb/vmm_flows/test_migration.py
> index 6853d87f4..c4f3f00a4 100644
> --- a/tools/vmtb/vmm_flows/test_migration.py
> +++ b/tools/vmtb/vmm_flows/test_migration.py
> @@ -785,6 +785,19 @@ class BaseTestDoubleMigration:
>       - restoring from initial (1st) or latter (2nd) migration
>       """
>   
> +    @pytest.fixture(scope='class', autouse=True, name='is_test_supported')
> +    def fixture_is_test_supported(self, setup_vms):
> +        """Skip test on no-debug setup lacking the required debugfs 'resfix_stoppers' hook."""
> +        ts: VmmTestingSetup = setup_vms
> +        vm: VirtualMachine = ts.get_vm[0]
> +        vm_debugfs_path = vm.get_dut().driver.debugfs_path
> +
> +        try:
> +            vm.read_file_content(f'{vm_debugfs_path}/gt0/vf/resfix_stoppers')
> +        except exceptions.GuestError:
> +            logger.warning("Required debug hook not found (KMD no-debug config?)")
> +            pytest.skip("Test scenario not supported on no-debug config")
> +
>       def __set_debugfs_resfix_stoppers(self, vm: VirtualMachine, stage: ResfixWaitStage):
>           """Set resfix_stoppers:
>           predefined checkpoints that allow the migration process to pause at specific stages.
