Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC37CA100C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 13:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A867410E700;
	Tue,  2 Sep 2025 13:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apT8uk8/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CBA10E700
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756819889; x=1788355889;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=vuIt5VePaMi5Kc02w9w0ZBqi5yHSi7Fd11etMtLYIto=;
 b=apT8uk8/9CoR9xBhM/eQmCZUM4Nug8qvYrqxvtlQ3Qud4GToIU0ZX59i
 pj35etviTPPdvsqZUMBRwf8mQKNz0RwrlcXu3cOVCKiv/jxIEVPcHabdp
 tQ9ml1XJ82H134Heg2sasPhM6ROeQ5p1fhyQCVzFeFrtr5xUZZlr8xXZf
 rrIBagPQo2otrWfqYlDJ9Ps7N/NGHFPi+EV3dGODpqIt/d9RweMwkr3sC
 t+zcsll/QXW0jEQjD3RSNX/y4Ej91QgwcL2wAs+n5IBPS3zDAiR/WgSCP
 PmbVD6TqE4soL4D1EGgi7zPBldSfhTqLzKxCz4xU3914U8CQLVueqOyUX A==;
X-CSE-ConnectionGUID: mpy6uNoeRty6w2q+g0Zskw==
X-CSE-MsgGUID: +50ZGwRIReWClNy1l5GhfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59159631"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59159631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:31:28 -0700
X-CSE-ConnectionGUID: Xnx99cLfSZafz8sDnGFMgw==
X-CSE-MsgGUID: bPYYz47qRe2r1RFUu2XfwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171649290"
Received: from unknown (HELO [10.246.4.32]) ([10.246.4.32])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:31:23 -0700
Message-ID: <62e5b79c-7343-4f94-8c3a-dc4162c90888@linux.intel.com>
Date: Tue, 2 Sep 2025 15:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6] runner/executor: Abort if dmesg is flooded
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Ryszard Knop
 <ryszard.knop@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250828103124.36280-1-kamil.konieczny@linux.intel.com>
 <955f10d6-fb39-4c50-b781-e2e6e0bc9dcb@linux.intel.com>
Content-Language: en-US
In-Reply-To: <955f10d6-fb39-4c50-b781-e2e6e0bc9dcb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

After discussing with Kamil, I tested it again. I believe that there
were two issues with my previous testing:
1. The first run of igt_runner takes a little longer than the second.
This gave me a larger window to start the dmesg flooder
2. The BAT test list I am using has a bunch of skips which are not
affected by the disk limit.

I changed the test to start the dmesg flooder *before* starting
igt_runner. Then it always works as expected:

$ sudo dmesger.sh&

$ sudo IGT_PING_HOSTNAME='10.211.176.1'
IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
--overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
--use-watchdog --inactivity-timeout 90
--abort-on-monitored-error=ping,taint --disk-usage-limit=128K --facts
--test-list ~/igt/test-list /home/gta/igt/A0
[75.594720] Initializing watchdogs
[75.594754]   /dev/watchdog0
[75.871692] Dmesg KB/s ratio settings:1.067 ncpu:64.000 current:5404.653
[75.871706] Using max level dmesg ratio 1.067KB/s
[75.879779] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
(Gen12) Alder Lake-S GT1 [UHD Graphics 730]
[75.894204] [001/258] (960s left) core_sysfs (read-all-entries)
[75.945301] Disk usage limit exceeded.
[78.739539] Dmesg ratio 613.538KB/s
[78.780076] Closing watchdogs
...


$ sudo IGT_PING_HOSTNAME='10.211.176.1'
IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
--overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
--use-watchdog --inactivity-timeout 90
--abort-on-monitored-error=ping,taint --disk-usage-limit=128K --facts
--test-list ~/igt/test-list /home/gta/igt/A1
[89.366592] Initializing watchdogs
[89.366628]   /dev/watchdog0
[89.651998] Dmesg KB/s ratio settings:1.067 ncpu:64.000 current:520.479
[89.652015] Using max level dmesg ratio 1.067KB/s
[89.659183] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
(Gen12) Alder Lake-S GT1 [UHD Graphics 730]
[89.673507] [001/258] (960s left) core_sysfs (read-all-entries)
[89.957678] Disk usage limit exceeded.
[94.438926] Dmesg ratio 348.069KB/s
[94.479677] [FACT core_sysfs (read-all-entries)] new:
kernel.kmod_is_loaded.amdgpu: true
[94.480474] Closing watchdogs
...

$ sudo IGT_PING_HOSTNAME='10.211.176.1'
IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
--overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
--use-watchdog --inactivity-timeout 90
--abort-on-monitored-error=ping,taint --disk-usage-limit=128K --facts
--test-list ~/igt/test-list /home/gta/igt/A2
[109.012115] Initializing watchdogs
[109.012151]   /dev/watchdog0
[109.284353] Dmesg KB/s ratio settings:1.067 ncpu:64.000 current:291.760
[109.284365] Using max level dmesg ratio 1.067KB/s
[109.292185] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
(Gen12) Alder Lake-S GT1 [UHD Graphics 730]
[109.293062] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
[109.307234] [001/258] (960s left) core_sysfs (read-all-entries)
[109.785030] Disk usage limit exceeded.
[112.935591] Dmesg ratio 250.622KB/s
[112.976072] [FACT core_sysfs (read-all-entries)] new:
kernel.kmod_is_loaded.i915: true
[112.976785] Closing watchdogs
...


However the issue of setting an artificially low disk limit size such as
1K resulting in runner restarting instead of terminating seems like an
issue:

$ sudo IGT_PING_HOSTNAME='10.211.176.1'
IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
--overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
--use-watchdog --inactivity-timeout 90
--abort-on-monitored-error=ping,taint --disk-usage-limit
=1K --facts --test-list ~/igt/test-list /home/gta/igt/D0
[53.595429] Initializing watchdogs
[53.595501]   /dev/watchdog0
[53.872548] Dmesg KB/s ratio settings:0.008 ncpu:64.000 current:0.000
[53.872614] Using max level dmesg ratio 0.008KB/s
[53.884211] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
(Gen12) Alder Lake-S GT1 [UHD Graphics 730]
[53.900552] [001/258] (960s left) core_sysfs (read-all-entries)
[56.221485] Disk usage limit exceeded.
[59.401702] Dmesg ratio 0.000KB/s
[59.689703] Dmesg ratio 0.000KB/s
[59.689795] Closing watchdogs
[59.698729] Initializing watchdogs
[59.698746]   /dev/watchdog0
[59.882205] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
(Gen12) Alder Lake-S GT1 [UHD Graphics 730]
[59.882486] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
[59.882568] [FACT before any test] new: kernel.kmod_is_loaded.i915: true
[59.890620] [002/258] (955s left) fbdev (eof)
[60.189438] Disk usage limit exceeded.
[62.749966] Dmesg ratio 0.000KB/s
[63.035293] Dmesg ratio 5.057KB/s
[63.035360] Closing watchdogs
[63.050453] Initializing watchdogs
[63.050519]   /dev/watchdog0
[63.234026] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
(Gen12) Alder Lake-S GT1 [UHD Graphics 730]
[63.237291] [FACT before any test] new:
hardware.pci.drm_card_at_addr.0000:00:02.0: card0
[63.237978] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
[63.238079] [FACT before any test] new: kernel.kmod_is_loaded.i915: true
[63.238652] [FACT before any test] new: kernel.kmod_is_loaded.xe: true
[63.245575] [003/258] (952s left) fbdev (info)
[63.294215] Subtest info: SKIP (0.000s)
[63.583367] Dmesg ratio 0.000KB/s
[63.602926] [004/258] (952s left) fbdev (nullptr)
[63.653690] Subtest nullptr: SKIP (0.000s)
[63.947386] Dmesg ratio 0.000KB/s
[63.969602] [005/258] (952s left) fbdev (read)
[64.020039] Subtest read: SKIP (0.000s)
[64.309611] Dmesg ratio 0.000KB/s
[64.332294] [006/258] (952s left) fbdev (write)
[64.382606] Subtest write: SKIP (0.000s)
[64.673611] Dmesg ratio 0.000KB/s
[64.696969] [007/258] (952s left) kms_addfb_basic (addfb25-4-tiled)
[64.754428] Disk usage limit exceeded.

# I pressed Ctrl-C

^C[67.395185] Abort requested by unknown [0] via Interrupt, terminating
children
[67.607309] Closing watchdogs



$ sudo IGT_PING_HOSTNAME='10.211.176.1'
IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
--overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
--use-watchdog --inactivity-timeout 90
--abort-on-monitored-error=ping,taint --disk-usage-limit=1K --facts
--test-list ~/igt/test-list /home/gta/igt/D1
[168.205813] Initializing watchdogs
[168.205901]   /dev/watchdog0
[168.480915] Dmesg KB/s ratio settings:0.008 ncpu:64.000 current:0.000
[168.480972] Using max level dmesg ratio 0.008KB/s
[168.492377] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
(Gen12) Alder Lake-S GT1 [UHD Graphics 730]
[168.495449] [FACT before any test] new:
hardware.pci.drm_card_at_addr.0000:00:02.0: card0
[168.496819] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
[168.496900] [FACT before any test] new: kernel.kmod_is_loaded.i915: true
[168.497487] [FACT before any test] new: kernel.kmod_is_loaded.xe: true
[168.504097] [001/258] (960s left) core_sysfs (read-all-entries)
[168.547635] Disk usage limit exceeded.
[171.326287] Dmesg ratio 0.000KB/s
[171.610888] Dmesg ratio 0.000KB/s
[171.610951] Closing watchdogs
[171.619890] Initializing watchdogs
[171.619908]   /dev/watchdog0
[171.802980] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
(Gen12) Alder Lake-S GT1 [UHD Graphics 730]
[171.806131] [FACT before any test] new:
hardware.pci.drm_card_at_addr.0000:00:02.0: card0
[171.806861] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
[171.806936] [FACT before any test] new: kernel.kmod_is_loaded.i915: true
[171.807549] [FACT before any test] new: kernel.kmod_is_loaded.xe: true
[171.814832] [002/258] (957s left) fbdev (eof)
[171.865976] Subtest eof: SKIP (0.000s)
[172.154911] Dmesg ratio 0.000KB/s
[172.177968] [003/258] (957s left) fbdev (info)
[172.229177] Subtest info: SKIP (0.000s)
[172.519237] Dmesg ratio 0.000KB/s
[172.542455] [004/258] (957s left) fbdev (nullptr)
[172.592841] Subtest nullptr: SKIP (0.000s)
[172.882118] Dmesg ratio 0.000KB/s
[172.905971] [005/258] (957s left) fbdev (read)
[172.958529] Subtest read: SKIP (0.000s)
[173.247528] Dmesg ratio 0.000KB/s
[173.269788] [006/258] (957s left) fbdev (write)
[173.316047] Subtest write: SKIP (0.000s)
[173.604762] Dmesg ratio 0.000KB/s
[173.627436] [007/258] (957s left) kms_addfb_basic (addfb25-4-tiled)
[173.677605] Disk usage limit exceeded.
[176.478975] Dmesg ratio 0.000KB/s
[176.761251] Dmesg ratio 0.000KB/s
[176.761312] Closing watchdogs
[176.767900] Initializing watchdogs
[176.767916]   /dev/watchdog0
[176.950498] [FACT before any test] new:
hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
(Gen12) Alder Lake-S GT1 [UHD Graphics 730]
[176.953597] [FACT before any test] new:
hardware.pci.drm_card_at_addr.0000:00:02.0: card0
[176.954305] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
[176.954381] [FACT before any test] new: kernel.kmod_is_loaded.i915: true
[176.955003] [FACT before any test] new: kernel.kmod_is_loaded.xe: true
[176.962937] [008/258] (954s left) kms_addfb_basic (addfb25-bad-modifier)
[177.017901] Disk usage limit exceeded.

# I pressed Ctrl-C

^C[179.695295] Abort requested by unknown [0] via Interrupt, terminating
children
[179.885479] Closing watchdogs

On 9/2/2025 2:39 PM, Peter Senna Tschudin wrote:
> Hi Kamil,
> 
> It does not seem to work. If you set an artificially low disk limit, it
> catches the disk limit but does not abort the run. This is the error I
> reported originally: the runner restarts after each error instead of
> terminating:
> 
> $ sudo IGT_PING_HOSTNAME='10.211.176.1'
> IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
> ./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
> --overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
> --use-watchdog --inactivity-timeout 90
> --abort-on-monitored-error=ping,taint --disk-usage-limit
> =1K --facts --test-list ~/igt/test-list /home/gta/igt/0
> [293.946076] Initializing watchdogs
> [293.946112]   /dev/watchdog0
> [294.235375] Dmesg KB/s ratio settings:0.008 ncpu:64.000 current:0.000
> [294.235437] Using max level dmesg ratio 0.008KB/s
> [294.249433] [FACT before any test] new:
> hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
> (Gen12) Alder Lake-S GT1 [UHD Graphics 730]
> [294.252637] [FACT before any test] new:
> hardware.pci.drm_card_at_addr.0000:00:02.0: card0
> [294.253884] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
> [294.253967] [FACT before any test] new: kernel.kmod_is_loaded.i915: true
> [294.254566] [FACT before any test] new: kernel.kmod_is_loaded.xe: true
> [294.263174] [001/258] (960s left) core_sysfs (read-all-entries)
> [294.310997] Disk usage limit exceeded.
> [297.103323] Dmesg ratio 0.000KB/s
> [297.403503] Dmesg ratio 0.000KB/s
> [297.403567] Closing watchdogs
> [297.412417] Initializing watchdogs
> [297.412449]   /dev/watchdog0
> [297.598370] [FACT before any test] new:
> hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
> (Gen12) Alder Lake-S GT1 [UHD Graphics 730]
> [297.601512] [FACT before any test] new:
> hardware.pci.drm_card_at_addr.0000:00:02.0: card0
> [297.602230] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
> [297.602305] [FACT before any test] new: kernel.kmod_is_loaded.i915: true
> [297.602889] [FACT before any test] new: kernel.kmod_is_loaded.xe: true
> [297.612470] [002/258] (957s left) fbdev (eof)
> [297.662672] Disk usage limit exceeded.
> [299.263340] Dmesg ratio 0.000KB/s
> [299.561757] Dmesg ratio 0.000KB/s
> [299.561826] Closing watchdogs
> [299.570827] Initializing watchdogs
> [299.570855]   /dev/watchdog0
> [299.757776] [FACT before any test] new:
> hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
> (Gen12) Alder Lake-S GT1 [UHD Graphics 730]
> [299.760866] [FACT before any test] new:
> hardware.pci.drm_card_at_addr.0000:00:02.0: card0
> [299.761620] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
> [299.761694] [FACT before any test] new: kernel.kmod_is_loaded.i915: true
> [299.762294] [FACT before any test] new: kernel.kmod_is_loaded.xe: true
> [299.771527] [003/258] (956s left) fbdev (info)
> [299.818492] Starting subtest: info
> [299.824865] Subtest info: SUCCESS (0.000s)
> [299.834177] Disk usage limit exceeded.
> ^C[301.309071] Abort requested by unknown [0] via Interrupt, terminating
> children
> 
> # Only terminated on my Ctrl-C
> 
> [301.503185] Closing watchdogs
> 
> 
> Also, on a fresh boot it works, and aborts the runner, however
> restarting the runner without a reboot does not work:
> 
> 
> $ sudo IGT_PING_HOSTNAME='10.211.176.1'
> IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
> ./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
> --overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
> --use-watchdog --inactivity-timeout 90
> --abort-on-monitored-error=ping,taint --disk-usage-limit=128K --facts
> --test-list ~/igt/test-list /home/gta/igt/2
> [129.371776] Initializing watchdogs
> [129.371856]   /dev/watchdog0
> [129.649777] Dmesg KB/s ratio settings:1.067 ncpu:64.000 current:0.000
> [129.649851] Using max level dmesg ratio 1.067KB/s
> [129.661177] [FACT before any test] new:
> hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
> (Gen12) Alder Lake-S GT1 [UHD Graphics 730]
> [129.669810] [001/258] (960s left) core_sysfs (read-all-entries)
> [131.656661] Disk usage limit exceeded.
> [134.867254] Warning: kernel log ringbuffer underflow, some records lost.
> [134.997777] Dmesg ratio 662.020KB/s
> [135.039240] [FACT core_sysfs (read-all-entries)] new:
> kernel.kmod_is_loaded.amdgpu: true
> [135.039330] [FACT core_sysfs (read-all-entries)] new:
> kernel.kmod_is_loaded.i915: true
> [135.040069] Closing watchdogs
> results: parsing output: 0/ for test: core_sysfs
> results: parsing output: 1/ for test: fbdev
> results: no output, setting notrun
> results: parsing output: 2/ for test: fbdev
> 
> # SUCCESS, it worked
> 
> ...
> 
> $ sudo IGT_PING_HOSTNAME='10.211.176.1'
> IGT_TEST_ROOT='/home/gta/UPSTREAM/igt-gpu-tools/build/tests/'
> ./build/runner/igt_runner -o -l verbose -s --per-test-timeout 120
> --overall-timeout 960 --piglit-style-dmesg --dmesg-warn-level=4
> --use-watchdog --inactivity-timeout 90
> --abort-on-monitored-error=ping,taint --disk-usage-limit=128K --facts
> --test-list ~/igt/test-list /home/gta/igt/3
> [146.825255] Initializing watchdogs
> [146.825328]   /dev/watchdog0
> [147.107754] Dmesg KB/s ratio settings:1.067 ncpu:64.000 current:0.000
> [147.107825] Using max level dmesg ratio 1.067KB/s
> [147.129652] [FACT before any test] new:
> hardware.pci.gpu_at_addr.0000:00:02.0: 8086:4682 Intel Alderlake_s
> (Gen12) Alder Lake-S GT1 [UHD Graphics 730]
> [147.130530] [FACT before any test] new: kernel.kmod_is_loaded.amdgpu: true
> [147.130600] [FACT before any test] new: kernel.kmod_is_loaded.i915: true
> [147.138880] [001/258] (960s left) core_sysfs (read-all-entries)
> [147.677515] Starting subtest: read-all-entries
> [147.683589] Subtest read-all-entries: SUCCESS (0.003s)
> [147.991414] Dmesg ratio 0.000KB/s
> [148.016606] [FACT core_sysfs (read-all-entries)] new:
> hardware.pci.drm_card_at_addr.0000:00:02.0: card0
> [148.017949] [FACT core_sysfs (read-all-entries)] new:
> kernel.kmod_is_loaded.xe: true
> [148.025034] [002/258] (959s left) fbdev (eof)
> [148.078610] Subtest eof: SKIP (0.000s)
> [148.375170] Dmesg ratio 0.000KB/s
> [148.408612] [003/258] (959s left) fbdev (info)
> [148.457470] Subtest info: SKIP (0.000s)
> [148.755354] Dmesg ratio 0.000KB/s
> [148.788546] [004/258] (959s left) fbdev (nullptr)
> [148.838494] Subtest nullptr: SKIP (0.000s)
> [149.153820] Dmesg ratio 533.174KB/s
> [149.179479] [005/258] (959s left) fbdev (read)
> [149.224615] Subtest read: SKIP (0.000s)
> [149.552098] Dmesg ratio 498.731KB/s
> [149.578070] [006/258] (959s left) fbdev (write)
> [149.631379] Subtest write: SKIP (0.000s)
> [149.944509] Dmesg ratio 456.230KB/s
> [149.970670] [007/258] (959s left) kms_addfb_basic (addfb25-4-tiled)
> [150.057440] Starting subtest: addfb25-4-tiled
> [150.063427] Subtest addfb25-4-tiled: SUCCESS (0.000s)
> [150.370122] Dmesg ratio 478.268KB/s
> [150.394740] [008/258] (959s left) kms_addfb_basic (addfb25-bad-modifier)
> [150.475187] Starting subtest: addfb25-bad-modifier
> [150.481479] Subtest addfb25-bad-modifier: SUCCESS (0.000s)
> [150.790194] Dmesg ratio 457.204KB/s
> [150.815312] [009/258] (959s left) kms_addfb_basic
> (addfb25-modifier-no-flag)
> [150.891255] Starting subtest: addfb25-modifier-no-flag
> [150.897347] Subtest addfb25-modifier-no-flag: SUCCESS (0.000s)
> [151.210537] Dmesg ratio 432.789KB/s
> [151.236810] [010/258] (959s left) kms_addfb_basic (addfb25-x-tiled-legacy)
> [151.323103] Starting subtest: addfb25-x-tiled-legacy
> [151.329103] Subtest addfb25-x-tiled-legacy: SUCCESS (0.000s)
> [151.638990] Dmesg ratio 413.869KB/s
> [151.665387] [011/258] (959s left) kms_addfb_basic (addfb25-y-tiled-legacy)
> [151.745954] Starting subtest: addfb25-y-tiled-legacy
> [151.751835] Subtest addfb25-y-tiled-legacy: SUCCESS (0.000s)
> [152.064572] Dmesg ratio 395.429KB/s
> [152.090966] [012/258] (959s left) kms_addfb_basic
> (addfb25-y-tiled-small-legacy)
> [152.170516] Starting subtest: addfb25-y-tiled-small-legacy
> [152.176412] Subtest addfb25-y-tiled-small-legacy: SUCCESS (0.000s)
> [152.488977] Dmesg ratio 394.134KB/s
> [152.514136] [013/258] (959s left) kms_addfb_basic (addfb25-yf-tiled-legacy)
> [152.587556] Starting subtest: addfb25-yf-tiled-legacy
> [152.593469] Subtest addfb25-yf-tiled-legacy: SUCCESS (0.000s)
> [152.906382] Dmesg ratio 382.038KB/s
> [152.930857] [014/258] (959s left) kms_addfb_basic (bad-pitch-0)
> [152.976757] Starting subtest: bad-pitch-0
> [152.982758] Subtest bad-pitch-0: SUCCESS (0.000s)
> [153.323996] Dmesg ratio 369.798KB/s
> [153.349687] [015/258] (959s left) kms_addfb_basic (bad-pitch-1024)
> [153.395501] Starting subtest: bad-pitch-1024
> [153.401518] Subtest bad-pitch-1024: SUCCESS (0.000s)
> [153.737524] Dmesg ratio 355.751KB/s
> [153.763573] [016/258] (959s left) kms_addfb_basic (bad-pitch-128)
> [153.810091] Starting subtest: bad-pitch-128
> [153.816176] Subtest bad-pitch-128: SUCCESS (0.000s)
> [154.152176] Dmesg ratio 368.383KB/s
> [154.177582] [017/258] (958s left) kms_addfb_basic (bad-pitch-256)
> [154.224337] Starting subtest: bad-pitch-256
> [154.230341] Subtest bad-pitch-256: SUCCESS (0.000s)
> [154.571418] Dmesg ratio 361.534KB/s
> [154.596598] [018/258] (958s left) kms_addfb_basic (bad-pitch-32)
> [154.642612] Starting subtest: bad-pitch-32
> [154.648618] Subtest bad-pitch-32: SUCCESS (0.000s)
> [154.985548] Dmesg ratio 342.573KB/s
> [155.011295] [019/258] (958s left) kms_addfb_basic (bad-pitch-63)
> [155.058080] Starting subtest: bad-pitch-63
> [155.064278] Subtest bad-pitch-63: SUCCESS (0.000s)
> [155.392429] Dmesg ratio 338.020KB/s
> [155.418183] [020/258] (958s left) kms_addfb_basic (bad-pitch-65536)
> [155.464934] Starting subtest: bad-pitch-65536
> [155.471047] Subtest bad-pitch-65536: SUCCESS (0.000s)
> ^C[155.505747] Abort requested by unknown [0] via Interrupt, terminating
> children
> [155.717142] Closing watchdogs
> 
> # Failure, did not detect flooding of dmesg of the second run on the
> same boot
> 
> ...
> 
> 
> On 8/28/2025 12:31 PM, Kamil Konieczny wrote:
>> Current disk limit triggers once when it is exceeded during test
>> monitoring. After that happens executor no longer checks if
>> kernel is still printing plenty of messages.
>>
>> Create a way to abort test in such scenarios with the help of
>> measuring kernel kmsg activity before first test is executed
>> and then also check it after exceeding disk limit.
>>
>> Also print info about it after each test ends.
>>
>> v2: fix error when kmsg open fails, fix reading proc (Kamil)
>>   changed calculation of max bps (Peter)
>> v3: abort only when disk limit was actually exceeded,
>>   print info instead of aborting after every test (Kamil)
>> v4: added abort at main monitoring loop, also cleaning up
>>   printing messages (Kamil)
>> v5: fix typo, use less vars in a loop  (Krzysztof)
>>   reused existing dmesg reading function (Kamil)
>> v6: check error in check_dmesg_ratio() (Vitaly)
>>
>> Cc: Ewelina Musial <ewelina.musial@intel.com>
>> Cc: Karol Krol <karol.krol@intel.com>
>> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>> Cc: Petri Latvala <adrinael@adrinael.net>
>> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> Cc: Ryszard Knop <ryszard.knop@intel.com>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
>> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>  runner/executor.c | 153 +++++++++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 138 insertions(+), 15 deletions(-)
>>
>> diff --git a/runner/executor.c b/runner/executor.c
>> index 847abe481..87fa69b1c 100644
>> --- a/runner/executor.c
>> +++ b/runner/executor.c
>> @@ -637,6 +637,11 @@ const char *get_out_filename(int fid)
>>  	return "output-filename-index-error";
>>  }
>>  
>> +static int open_kmsg_rdonly(void)
>> +{
>> +	return open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK);
>> +}
>> +
>>  /* Returns the number of bytes written to disk, or a negative number on error */
>>  static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>>  {
>> @@ -646,6 +651,8 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>>  	 * /dev/kmsg doesn't support seeking to -1 from SEEK_END
>>  	 * so we need to use a second fd to read a message to
>>  	 *  match against, or stop when we reach EAGAIN.
>> +	 * If outfd==0 it will not write anything but still count
>> +	 * how many bytes was readed from dmesg.
>>  	 */
>>  
>>  	int comparefd;
>> @@ -711,7 +718,9 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>>  			return written;
>>  		}
>>  
>> -		write(outfd, buf, r);
>> +		if (outfd)
>> +			write(outfd, buf, r);
>> +
>>  		written += r;
>>  
>>  		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
>> @@ -948,6 +957,86 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
>>  	return dt != 0 ? dt : -1;
>>  }
>>  
>> +/*
>> + * Tries to read from dmesg for 0.1 seconds
>> + *
>> + * Returns:
>> + *  =>0.0 - Success, measured kmsg activity in bytes/second
>> + *  -1.0 - Failure
>> + */
>> +static double measure_dmesg_bytes_per_sec(int wrfd)
>> +{
>> +	struct timespec time_beg, time_now, nsec_sleep;
>> +	unsigned long long dmsg_read, rnow;
>> +	double time;
>> +	int kmsgfd;
>> +
>> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
>> +		errf("Warning: Cannot open /dev/kmsg\n");
>> +
>> +		return -1.0;
>> +	}
>> +
>> +	lseek(kmsgfd, 0, SEEK_END);
>> +	nsec_sleep.tv_sec = 0;
>> +	nsec_sleep.tv_nsec = 10ULL * 1000ULL * 1000ULL; /* 10^7 nanoseconds = 10^-2 sec */
>> +	runner_gettime(&time_beg);
>> +	time = 0.0;
>> +	dmsg_read = 0.0;
>> +	while (1) {
>> +		rnow = dump_dmesg(kmsgfd, wrfd, 64 * 4096); /* 64KB max */
>> +		if (rnow > 0)
>> +			dmsg_read += rnow;
>> +
>> +		runner_gettime(&time_now);
>> +		time = igt_time_elapsed(&time_beg, &time_now);
>> +		if (time <= 0.0) {
>> +			errf("Warning: Time underflow\n");
>> +			return -1.0;
>> +		}
>> +
>> +		if (time >= 0.1)
>> +			break;
>> +
>> +		if (rnow == 0)
>> +			nanosleep(&nsec_sleep, NULL);
>> +	}
>> +
>> +	runner_gettime(&time_now);
>> +	time = igt_time_elapsed(&time_beg, &time_now);
>> +	if (time <= 0.0) {
>> +		errf("Warning: Time underflow\n");
>> +
>> +		return -1.0;
>> +	}
>> +
>> +	return (double)dmsg_read / time;
>> +}
>> +
>> +/* Returns: true if ratio lower or equal than maxratio */
>> +static bool check_dmesg_ratio(double maxratio, int log_level, bool sync, int wrfd)
>> +{
>> +	double new_dmesg_bps = measure_dmesg_bytes_per_sec(wrfd);
>> +
>> +	if (new_dmesg_bps < 0.0) {
>> +		if (log_level >= LOG_LEVEL_NORMAL) {
>> +			outf("Dmesg ratio: unavailable (no /dev/kmsg)\n");
>> +			if (sync)
>> +				fflush(stdout);
>> +		}
>> +
>> +	return true; /* don’t gate on missing measurement */
>> +	}
>> +
>> +	if (log_level >= LOG_LEVEL_NORMAL) {
>> +		outf("Dmesg ratio %0.3fKB/s\n", new_dmesg_bps / 1024);
>> +		if (sync)
>> +			fflush(stdout);
>> +	}
>> +
>> +	return new_dmesg_bps <= maxratio;
>> +}
>> +
>>  /*
>>   * Returns:
>>   *  =0 - Success
>> @@ -960,6 +1049,7 @@ static int monitor_output(pid_t child,
>>  			  int *outputs,
>>  			  double *time_spent,
>>  			  struct settings *settings,
>> +			  double max_dmesg_ratio,
>>  			  char **abortreason,
>>  			  bool *abort_already_written)
>>  {
>> @@ -1463,29 +1553,31 @@ static int monitor_output(pid_t child,
>>  				 * exceeded the disk usage limit.
>>  				 */
>>  				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
>> +					char killmsg[256];
>> +
>>  					timeoutresult = false;
>> +					snprintf(killmsg, sizeof(killmsg),
>> +						 "runner: This test was killed due to exceeding disk usage limit. "
>> +						 "(Used %zd bytes, limit %zd)\n",
>> +						 disk_usage,
>> +						 settings->disk_usage_limit);
>>  
>>  					if (socket_comms_used) {
>>  						struct runnerpacket *message;
>> -						char killmsg[256];
>>  
>> -						snprintf(killmsg, sizeof(killmsg),
>> -							 "runner: This test was killed due to exceeding disk usage limit. "
>> -							 "(Used %zd bytes, limit %zd)\n",
>> -							 disk_usage,
>> -							 settings->disk_usage_limit);
>>  						message = runnerpacket_log(STDOUT_FILENO, killmsg);
>>  						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
>>  						free(message);
>>  					} else {
>> -						dprintf(outputs[_F_OUT],
>> -							"\nrunner: This test was killed due to exceeding disk usage limit. "
>> -							"(Used %zd bytes, limit %zd)\n",
>> -							disk_usage,
>> -							settings->disk_usage_limit);
>> +						dprintf(outputs[_F_OUT], "%s", killmsg);
>>  						if (settings->sync)
>>  							fdatasync(outputs[_F_OUT]);
>>  					}
>> +
>> +					if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
>> +						asprintf(abortreason, "Dmesg ratio exceeded during test run.");
>> +						aborting = true;
>> +					}
>>  				}
>>  
>>  				if (socket_comms_used) {
>> @@ -1587,7 +1679,7 @@ static int monitor_output(pid_t child,
>>  	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
>>  	if (settings->sync)
>>  		fdatasync(outputs[_F_DMESG]);
>> -	if (dmesgwritten > 0) {
>> +	if (dmesgwritten > 0 && !aborting) {
>>  		disk_usage += dmesgwritten;
>>  		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
>>  			char disk[1024];
>> @@ -1599,6 +1691,11 @@ static int monitor_output(pid_t child,
>>  			} else if (killed) {
>>  				errf("%s", disk);
>>  			}
>> +
>> +			if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
>> +				asprintf(abortreason, "Dmesg ratio exceeded after test ends.");
>> +				aborting = true;
>> +			}
>>  		}
>>  	}
>>  
>> @@ -1766,6 +1863,7 @@ static int execute_next_entry(struct execute_state *state,
>>  			      size_t total,
>>  			      double *time_spent,
>>  			      struct settings *settings,
>> +			      double max_dmesg_ratio,
>>  			      struct job_list_entry *entry,
>>  			      int testdirfd, int resdirfd,
>>  			      int sigfd, sigset_t *sigmask,
>> @@ -1814,7 +1912,7 @@ static int execute_next_entry(struct execute_state *state,
>>  		goto out_pipe;
>>  	}
>>  
>> -	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
>> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
>>  		errf("Warning: Cannot open /dev/kmsg\n");
>>  	} else {
>>  		/* TODO: Checking of abort conditions in pre-execute dmesg */
>> @@ -1885,7 +1983,7 @@ static int execute_next_entry(struct execute_state *state,
>>  
>>  	result = monitor_output(child, outfd, errfd, socketfd,
>>  				kmsgfd, sigfd,
>> -				outputs, time_spent, settings,
>> +				outputs, time_spent, settings, max_dmesg_ratio,
>>  				abortreason, abort_already_written);
>>  
>>  out_kmsgfd:
>> @@ -2418,6 +2516,8 @@ bool execute(struct execute_state *state,
>>  	     struct settings *settings,
>>  	     struct job_list *job_list)
>>  {
>> +	static double dmesg_bps = -1.0;
>> +	static double max_dmesg_bps = -1.0;
>>  	int resdirfd, testdirfd, unamefd, timefd, sigfd;
>>  	struct environment_variable *env_var;
>>  	struct utsname unamebuf;
>> @@ -2560,6 +2660,26 @@ bool execute(struct execute_state *state,
>>  		}
>>  	}
>>  
>> +	if (max_dmesg_bps < 0.0) {
>> +		double ncpu_bps = 4 * 1024 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 4);
>> +		double set_bps = 0.0;
>> +
>> +		dmesg_bps = measure_dmesg_bytes_per_sec(0);
>> +
>> +		if (settings->disk_usage_limit > 0 && settings->per_test_timeout > 0)
>> +			set_bps = (double)settings->disk_usage_limit / (double)settings->per_test_timeout;
>> +
>> +		outf("Dmesg KB/s ratio settings:%0.3f ncpu:%0.3f current:%0.3f\n",
>> +		     set_bps / 1024, ncpu_bps / 1024, dmesg_bps / 1024);
>> +
>> +		if (set_bps > 0.0)
>> +			max_dmesg_bps = set_bps;
>> +		else
>> +			max_dmesg_bps = dmesg_bps > ncpu_bps ? dmesg_bps : ncpu_bps;
>> +
>> +		outf("Using max level dmesg ratio %0.3fKB/s\n", max_dmesg_bps / 1024);
>> +	}
>> +
>>  	for (; state->next < job_list->size;
>>  	     state->next++) {
>>  		char *reason = NULL;
>> @@ -2596,6 +2716,7 @@ bool execute(struct execute_state *state,
>>  						    job_list->size,
>>  						    &time_spent,
>>  						    settings,
>> +						    max_dmesg_bps,
>>  						    &job_list->entries[state->next],
>>  						    testdirfd, resdirfd,
>>  						    sigfd, &sigmask,
>> @@ -2651,6 +2772,8 @@ bool execute(struct execute_state *state,
>>  			break;
>>  		}
>>  
>> +		check_dmesg_ratio(max_dmesg_bps, settings->log_level, settings->sync, 0);
>> +
>>  		if (result > 0) {
>>  			double time_left = state->time_left;
>>  
> 

