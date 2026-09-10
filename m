Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FA1C79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 05:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7B610E042;
	Thu, 10 Sep 2026 05:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dL0CsO8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A77110E042
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 05:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789017376; x=1820553376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VMR6p/U8yNfBnoyfr0pSrRTSNn7UI5NBYHGKjsuvv9U=;
 b=dL0CsO8HR0YC2Z8Ow+WmT2S6DiA1GPNn5ge/6bwSZ1DRJTE9j+jrpmaw
 nm18AQ3vzUs9YMiuvYmWGBLnjBbrFjaO+Ggox5tMMRBS1k5tsz1Q/kCrH
 7kn5dB4jCQ5FT8EAxVA80qPT1kiBZHirId5ADAa0LHiHWWxjC24bWhCIQ
 OuY5R+JucKxLVfca9LKTUYPm7NAlor3ct+YgJbOw802ebQq+zBOp2XuCH
 FEfsMpwmz4bPLdvCvkCekFVYOCjK5vYmLNUjLHn+CUfyWqt/HxWhmUytr
 p2EeUE395SY+TPmaPHT6UKoR5yLBb0OzzTrngGrfisk5gXfk69SyVFGFI Q==;
X-CSE-ConnectionGUID: sTKWKgwuRkq0yjgUKe3RGw==
X-CSE-MsgGUID: hie+GSUVT+2UDkaSurYb4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89489184"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="89489184"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 22:16:15 -0700
X-CSE-ConnectionGUID: PIm4EkrETDeCwNvV9LUKIg==
X-CSE-MsgGUID: HHYp5bR5Q0y4IpwOT3AEcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="276765639"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 22:16:12 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH i-g-t] tools/intel_pr_bw: measure the USB4 bandwidth Panel
 Replay frees
Date: Thu, 10 Sep 2026 11:07:35 +0530
Message-Id: <20260910053735.846264-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

A Thunderbolt cable carries video, storage and USB traffic in separate
tunnels sharing one fixed capacity. Panel Replay lets the dock recreate
unchanged pixels locally instead of carrying them over the cable
(DisplayPort spec 5.14.1), freeing room for everything else.

Nothing counts that happening. intel_psr_allow_pr_bw_optimization() sets
TRANS_DP2_PR_TUNNELING_ENABLE and never calls drm_dp_tunnel_alloc_bw(), so
no allocation moves and the dock reports its negotiated ceiling, not live
occupancy. The only way to see the effect is to put a competing device on
the cable, starve it of bandwidth, and watch its throughput while that one
bit is toggled. That is a measurement rather than a pass or a fail, and it
needs a specific rig plus kernel parameters that only apply at boot, so it
is a tool rather than a test.

  check       validate the rig, read-only, no DRM master, no disk touched
  sweep       step the video load to find where the cable becomes the limit
  ab          the measurement: Panel Replay on in both halves, only
              TRANS_DP2_PR_TUNNELING_ENABLE differs
  accounting  the dock's own bookkeeping with Panel Replay on and off

Cc: Animesh Manna <animesh.manna@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 man/intel_pr_bw.rst |  547 ++++++
 man/meson.build     |    1 +
 tools/intel_pr_bw.c | 4463 +++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build   |    1 +
 4 files changed, 5012 insertions(+)
 create mode 100644 man/intel_pr_bw.rst
 create mode 100644 tools/intel_pr_bw.c

diff --git a/man/intel_pr_bw.rst b/man/intel_pr_bw.rst
new file mode 100644
index 000000000..e316c0afc
--- /dev/null
+++ b/man/intel_pr_bw.rst
@@ -0,0 +1,547 @@
+.. SPDX-License-Identifier: MIT
+
+============
+intel_pr_bw
+============
+
+---------------------------------------------------------------
+Measure the USB4 bandwidth Panel Replay frees for other traffic
+---------------------------------------------------------------
+.. include:: defs.rst
+:Author: Kunal Joshi <kunal1.joshi@intel.com>
+:Date: 2026-08-28
+:Version: |PACKAGE_STRING|
+:Copyright: 2026 Intel Corporation
+:Manual section: |MANUAL_SECTION|
+:Manual group: |MANUAL_GROUP|
+
+SYNOPSIS
+========
+
+**intel_pr_bw** *COMMAND* [*OPTIONS*]
+
+DESCRIPTION
+===========
+
+A Thunderbolt cable carries video, storage and USB traffic at the same time,
+each in its own tunnel, sharing one fixed capacity. Panel Replay can mark
+unchanged pixel data so the dock recreates it locally instead of carrying it
+across the cable, which frees room for everything else. DisplayPort
+specification section 5.14.1 describes this.
+
+Nothing counts it happening. The driver enables it by setting one bit in
+TRANS_DP2_CTL and never renegotiates a bandwidth reservation, and the dock
+reports its negotiated ceiling rather than live occupancy. So the only way to
+see the effect is to put a competing device on the cable, make it genuinely
+short of bandwidth, and watch its throughput while that one bit is toggled.
+
+This is a measurement rather than a pass/fail check, and it needs a specific
+rig plus kernel settings that can only be applied at boot, which is why it is
+a tool and not a test.
+
+COMMANDS
+========
+
+check
+    Report whether this machine can do the measurement, and why not if it
+    cannot. Read-only: it reads registers, debugfs and the kernel log, but
+    writes no register, commits no modeset and writes nothing to any disk.
+    Start here.
+
+    It does open the DRM device, so on a machine with no other DRM master it
+    becomes master implicitly; it never calls ``drmSetMaster()`` and never
+    changes a mode, so a running desktop is unaffected. The one thing it
+    cannot report is whether a drive is still writable, because proving that
+    means writing to it - the measuring commands do that check themselves
+    before their first window.
+
+sweep
+    Raise the video load step by step and report disk throughput at each step,
+    to find where the disks start running short of bandwidth. Feed the load
+    that comes out of this into **ab**.
+
+ab
+    The measurement. Panel Replay stays active in both halves and only the
+    tunnelling bit is toggled, so display engine idling, power states and
+    memory traffic are held constant and the difference is attributable to the
+    bit alone.
+
+accounting
+    Report the dock's own bandwidth bookkeeping with Panel Replay on and off.
+    Needs no disks. Demonstrates why throughput is the only usable instrument;
+    there is no reason to run it repeatedly.
+
+OPTIONS
+=======
+
+--secs SECONDS
+    Seconds of disk traffic per measurement. Default 4.
+
+--reps N
+    Repetitions per load level. Default 4, maximum 16. Keep it even: **ab**
+    alternates which half runs first, so an odd count over-represents one
+    ordering. A single rep leaves no spread to measure, which disables the only
+    check on whether the ratio means anything.
+
+--size-mb N
+    Disk file size cap in MB. The traffic wraps to the start on reaching it.
+    Default 1024.
+
+--dp-targets A,B,C
+    Exact video loads in Mb/s, instead of percentage steps. Percentages are far
+    too coarse: the whole window where the effect is visible can be three
+    percent of the cable wide.
+
+--custom-fill
+    Build a filler video mode that hits each target exactly, instead of picking
+    the closest advertised mode. Advertised modes leave gaps of thousands of
+    Mb/s that can hide the entire transition. Above roughly 73000 Mb/s the
+    driver quietly lowers the colour depth and the result lands lower than
+    without it - that is above the default ``--max-dp``, so it is only
+    reachable, and only a hazard, once that has been raised.
+
+    Only one filler is driven, because any advertised mode put on a second one
+    would take budget away from the exact figure being aimed at. On a rig with
+    more than two panels the rest stay dark, so the reachable load is lower than
+    a plain run's and results from the two are not comparable. ``check`` reports
+    how many panels this costs.
+
+--read-agents
+    Read from the disks instead of writing. Reads travel the direction video
+    does not occupy, so this is the control: a real cable-level effect must show
+    on writes and not on reads.
+
+--sham
+    **ab** only. Run the A/B with bit 26 held clear in both halves. They are
+    then identical, so the ratio reported is the tool's own bias, and it must
+    come out near 1.0.
+
+    Held clear rather than left at the driver's value, which is set. With the
+    bit set the disks are no longer paced by the cable and their readings wander
+    by tens of percent, so a control run there is measuring the null in the one
+    regime where the instrument is blunt. Clear puts the control in the same
+    cable-paced state as the measurement it exists to check, where a bias of a
+    few percent would actually be visible.
+
+--max-dp N
+    Safety ceiling on the video load in Mb/s. Default 70000. Around 76000 on the
+    reference rig the storage tunnel is starved until the drives need a physical
+    power cycle, so the default leaves a few thousand Mb/s of margin; raise it
+    only if the drives are expendable.
+
+--help
+    Show usage.
+
+REQUIRED KERNEL SETTINGS
+========================
+
+::
+
+    thunderbolt.asym_threshold=0
+
+Essential, and the parameter is read-only at runtime so it must be on the boot
+line. The cable rearranges its lanes from two each way to three down and one up
+when video demand rises, which adds 40000 Mb/s downstream in the middle of a
+measurement - more bandwidth than the video stream being shrunk. Only 0
+disables this; a large threshold does not.
+
+::
+
+    thunderbolt.dyndbg=+p
+    drm.debug=0x10e
+
+Not essential, but ``thunderbolt.dyndbg=+p`` changes what the numbers mean.
+Without it the connection manager's own usable capacity is unknown, so every
+headroom figure is computed against the raw lane product instead - and USB4
+encoding and protocol overhead come off that, 72000 usable out of 80000 raw on a
+Thunderbolt 5 cable. Each report says which base it used. Without them the
+dock's bandwidth figures and the video allocation read-back are unavailable, and
+the tool says so rather than substituting a default. ``drm.debug`` may also be
+set at runtime through
+``/sys/module/drm/parameters/debug``; DRM_UT_KMS (0x04) is the bit the DP tunnel
+messages need, and it must be set before the modeset whose allocation is to be
+read back. Without the tunnel group mapping the per-group caps cannot be
+enforced and the load is bounded by the cable alone.
+
+A large kernel log helps: with ``drm.debug`` on, one modeset emits well over a
+thousand lines, and the tool marks the log around each measurement so it can
+tell its own window apart. If the ring wraps and the marker is lost, the
+read-back is reported as unknown rather than guessed. ``log_buf_len=8M`` is
+enough.
+
+::
+
+    nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off
+
+Recommended if drives behind the dock drop off the bus. ``thunderbolt.clx=0``
+is also worth trying, as it stops the cable itself entering low-power states.
+
+ENVIRONMENT
+===========
+
+IGT_PR_BW_NVME_PATHS
+    Comma separated mount points of the competing disks. They must be NVMe
+    behind the dock, on the storage tunnel. USB drives are refused: the dock
+    protects the USB tunnel, so a USB drive gets faster under video load rather
+    than slower and cannot be used as an instrument.
+
+IGT_PR_BW_TBT_ROUTER
+    Thunderbolt router to measure the cable width from, if the dock is not the
+    widest depth-1 router.
+
+IGT_PR_BW_PR_OUTPUT
+    Which connected output to treat as the Panel Replay panel, for example
+    ``DP-1``. By default a tunnelled candidate is preferred over an untunnelled
+    one - an internal eDP can advertise Panel Replay and is enumerated first,
+    and measuring it would be measuring a panel whose video never touches the
+    cable. Between two tunnelled candidates the choice falls to enumeration
+    order, which is not stable across boots, so pin it on a rig with more than
+    one.
+
+EXIT STATUS
+===========
+
+0
+    Something was measured.
+
+77
+    This machine cannot do the measurement. The reason is printed.
+
+98
+    A run failed or was abandoned.
+
+1
+    Bad command line.
+
+128 + N
+    Interrupted by signal N. The display state and the tunnelling bit are put
+    back first.
+
+MEASUREMENT RATIONALE
+=====================
+
+These constraints explain the guards in the implementation. They keep load
+levels comparable and prevent a missing observation or a failed instrument
+from looking like a bandwidth measurement.
+
+Bandwidth and units
+-------------------
+
+The reported MB/s rates are binary megabytes per second: bytes divided by
+1024 squared and the measured duration. Converting them to decimal Mb/s
+requires 8.388608, not 8. The difference is large enough to matter when the
+effect being measured is only a few thousand Mb/s.
+
+Tunnel allocations use the connection manager's usable budget, not the raw
+lane rate. Mixing these bases overstates disk headroom by the encoding and
+protocol overhead. The raw lane product remains useful for detecting width
+changes and as a clearly identified fallback when CM logging is unavailable.
+The PCIe reservation is held even when no device is attached. Sweep headroom
+deducts that reservation; A/B's nominal headroom is before that deduction.
+
+Display selection and load targeting
+------------------------------------
+
+A joiner both consumes another pipe and disables Panel Replay. The tool must
+exclude joiner modes before committing. ``igt_get_max_dotclock()`` exposes
+``cdclk.max_dotclk_freq``, a DSC-capable ceiling, so the IGT joiner helper alone
+is not a sufficient filter for uncompressed modes.
+
+i915 moves panel connectors first with
+``drm_helper_move_panel_connectors_to_head()``. A PR-capable internal eDP can
+therefore precede the dock's panel; selection must prefer a tunnelled candidate
+unless a valid output override pins the choice.
+
+The additional limits follow ``intel_max_uncompressed_dotclock()`` in the
+kernel's ``intel_display.c``: 1350000 kHz for display 30 and 937500 kHz for
+30.02. IGT exposes the integer display version, not ``DISPLAY_VERx100``, so
+the tool uses the lower limit for version 30 and 1350000 kHz for later versions.
+This may omit usable modes but avoids accidentally selecting a joiner. Below
+display 30 the kernel deliberately does not enforce an uncompressed limit,
+and the tool cannot establish a safe filter; that hardware also lacks the
+tunnelling optimization required here.
+
+Modes are copied rather than referenced through the connector: IGT can
+refetch and free the connector across commits. Only the first candidate at
+each distinct clock is retained, since prediction depends on clock and BPC.
+Duplicate clocks would expand an exhaustive search without changing the
+available bandwidth choices.
+
+The PR stream is pinned once within its known group cap and the safety
+ceiling. Resizing it for each target would change the amount of bandwidth
+whose release is being measured. Targets below the pin are therefore refused.
+The advertised-mode solver includes dark fillers and checks both the target
+and each known group cap. Independently advertised group caps can sum to more
+than the cable can carry.
+
+For uncompressed 8b/10b, the overhead in ``intel_dp_link_required()`` is close
+to 1.0. The prediction uses integer ``clock_khz * 3 * effective_bpc / 1000``,
+then rounds up to 500 Mb/s. It is an estimate, not proof that a commit will
+allocate that amount: the driver can silently lower BPC to make a mode fit.
+
+Custom fill keeps the highest-clock candidate's timing template and changes
+its clock, updating the reported refresh accordingly. This stays near a
+demonstrated training range but cannot guarantee the panel will accept the
+new clock; commit failures remain failures. The request is floored to a
+granule before prediction rounds up, preventing an unaligned target from
+crossing the safety ceiling. The 500000 kHz minimum still leaves an unavoidable
+first-filler step. Only one filler is synthesized, as described under
+``--custom-fill``.
+
+Each load application first commits all pipes off, waits 200 ms, and then
+commits the selected modes. A fastset may not reprogram Panel Replay and can
+leave the previous register state in place. After the selected commit, the
+tool waits 600 ms for allocation and logging. It can make up to four attempts
+to correct an allocation undershoot, with every correction bounded by
+``--max-dp``.
+
+Correction is meaningful only when all lit outputs share one known group:
+``Group alloc:`` describes one group, whereas the target covers all outputs.
+Otherwise the other groups' shares would look like an undershoot and push
+the request to the ceiling. Sweep, A/B, and accounting use the same convergence
+policy; converging only in A/B would apply a higher load than an earlier sweep
+at the same requested target had established as survivable.
+
+Topology and log formats
+------------------------
+
+Thunderbolt router names use ``<domain>-<hex route>`` in sysfs
+(``switch.c``). Retimers share that bus but use names such as ``0-0:1.1``
+(``retimer.c``); they must not count as routers or attached enclosures.
+The default link selection examines depth-1 routers, not a nested enclosure
+such as ``0-705``. The dock's ``rx_speed`` and ``rx_lanes`` describe the
+downstream direction occupied by video.
+
+``tb_port_dbg()`` prefixes CM port messages with ``<route>:<port>:``.
+Host route 0 identifies the host-to-dock link; accepting a later message from
+a nested or remote router can substitute another cable's budget. The pairs
+used by ``tb_maximum_bandwidth()``, ``tb_tunnel_reserved_pci()``, and
+``tb_tunnel_consumed_bandwidth()`` are upstream first, downstream second::
+
+    0:5: link maximum bandwidth 72000/72000 Mb/s
+    0:5: reserving 1500/1500 Mb/s for PCIe
+
+``i915_display_info`` supplies connector-to-pipe and connector-to-encoder
+mapping inside CRTC sections, and Type-C mode inside connector sections::
+
+    [CRTC:159:pipe A]:
+        [ENCODER:529:DDI TC1/PHY TC1]: connectors:
+            [CONNECTOR:530:DP-1]
+
+    [CONNECTOR:530:DP-1]: status: connected
+        TC Port D/TC#1: mode: tbt-alt, pin assignment: -, max lanes: 4
+
+The parser distinguishes top-level headers at column 0 from indented
+connector references. It reads the whole file because the connector section
+is at the end and can exceed fixed debugfs buffers. Read or allocation
+failure discards partial data instead of presenting a truncated topology.
+
+DP tunnel bandwidth messages are device-level ``drm_dbg_kms()`` messages
+from ``drm_dp_tunnel.c`` and need not name a connector::
+
+    [DPTUN 0:1:13][AUX USBC1/DDI TC1] Allocating 48500/77500: Group alloc:73500/103500
+
+The kernel builds the AUX name as ``AUX <channel>/<encoder name>``
+(``intel_dp_aux.c``). The encoder from display info therefore ties a connector
+to a tunnel. Both ``DDI TC1`` and ``DDI TC1/PHY TC1`` have appeared in logs;
+prefix matching must stop at a component boundary so TC1 does not match TC12.
+An explicit connector tag is useful when present, but tags on suspend/resume
+paths cannot be required on a freshly booted rig. Fillers in another group
+do not consume the PR group's budget.
+
+Register identity and state
+---------------------------
+
+``TRANS_DP2_CTL(A)`` is at 0x600a0, with a 0x1000 stride between transcoders.
+Bit 31 selects 128b/132b coding, bit 30 enables Panel Replay, and bit 26 controls
+the tunnelling optimization. The kernel indexes this register through
+``intel_dp->psr.transcoder``, not a pipe number.
+
+The supported configurations have display version at least 30, no DSI, and
+no TRANSCODER_EDP, so their pipe and transcoder indices coincide. That
+assumption must still be checked against the driver's full debugfs value:
+an unrelated transcoder can also have bit 30 set. The tool keeps the PR
+panel on its startup pipe when possible and otherwise assigns a pipe.
+Register access follows that assignment, not a hardcoded pipe A or an old
+connector mapping.
+
+On a tunnelled DP panel, ``PanelReplay ctl:`` reports TRANS_DP2_CTL.
+``intel_psr_status()`` omits that line when PSR/PR is disabled, so its absence
+cannot supply a hardware value for the accounting off arm. Accounting reads
+MMIO in both arms. On eDP the same label can instead describe EDP_PSR2_CTL
+or PSR_CTL; those are not interchangeable with this register.
+
+``dg2_activate_panel_replay()`` programs the tunnelling bit during PR
+activation. With bit 30 clear, bit 26 can be stale and must not be saved as
+the driver's restoration value. If PR is initially inactive or has no pipe,
+the tool captures the driver value after activation and before its own bit
+writes. It must not reject a panel merely because it was dark at startup.
+
+Log windows and unavailable data
+--------------------------------
+
+``drm.debug`` is read as an unsigned mask because values such as 0xffffffff
+do not fit a signed int. The live DRM_UT_KMS bit determines whether tunnel
+logging is enabled now. On CONFIG_DRM_USE_DYNAMIC_DEBUG kernels the categories
+can be dynamic-debug classes instead, making the parameter unavailable.
+A historical DPTUN line then provides only evidence of past logging.
+Thunderbolt logging is likewise inferred from earlier messages, not a live
+switch equivalent to ``drm.debug``.
+
+The latest ``intel_pr_bw: MARK`` starts each parsed window. A modeset can
+produce more than a thousand lines, so neither a fixed tail nor an entire
+unmarked ring identifies the relevant operation. A missing marker yields
+unknown values, and missing DPTUN evidence is not a clean BPC check. An
+all-dark commit is separately marked not applicable.
+
+A/B marks each arm before its bit write, then waits one second before
+starting disk I/O. Sharing a marker from the last modeset would make the
+first arm's events appear in both halves. Accounting instead marks after
+the modeset and PR settling, then observes five seconds of unsolicited dock
+activity. These are intentionally different observation boundaries.
+
+Allocation announcements are counted separately from their last reported
+value. A quiet bit-only window normally has no allocation announcement at
+all; that is not the same as failing to read the committed allocation.
+Counts and changed values must be accumulated over every repetition, not
+just the last. Missing figures remain unknown rather than becoming zero.
+
+Storage safety and timing
+-------------------------
+
+A successful O_DIRECT open does not establish which disk is being measured.
+The mount must be on a device distinct from the root filesystem and its
+parent directory. Otherwise an unmounted dock path can silently write to the
+boot drive. USB ancestry is rejected; the deepest PCI function's
+``removable`` attribute identifies the storage tunnel used by the reference
+rig. For example, ``/sys/bus/pci/devices/0000:20:00.0/removable`` contains
+``removable`` for the dock's NVMe controller, whereas the internal boot NVMe
+normally has no such attribute.
+
+The storage gate's probe creates and removes an empty file; ``check`` omits
+it entirely. Measuring commands also issue a real 4 MiB health write before
+their first measurement. A nested enclosure whose drives do not answer
+requires different recovery advice from an enclosure that is not connected.
+
+All agents use O_DIRECT so the page cache cannot turn the measurement into
+DRAM bandwidth. They run concurrently to a shared deadline, wrapping at
+their file caps. Fixed byte counts would let faster disks finish early and
+remove sustained competition. The total is the sum of per-disk rates, each
+using its own elapsed time, not all bytes divided by the slowest disk's time.
+Per-disk output distinguishes one slow drive from a cable-wide shortage.
+
+Partial writes are valid; source creation and health probes finish their
+chunks rather than treating a short transfer as proof of dead storage.
+Read sources may reach EOF before the cap and wrap without an errno failure.
+An empty source instead produces a moved-nothing result.
+
+Timing stops before ``fdatasync()``. A flush can cost more in the starved arm,
+so including it would bias the ratio in the same direction as the effect.
+This state-dependent bias is not exposed by a sham run whose two states are
+identical. The sync remains useful for reporting I/O errors.
+
+Read-source creation writes data, even though the later measurement uses
+reads. It happens before the command applies video load, so setup does not
+write through a deliberately starved tunnel. The read-direction control
+does not run the downstream shortage probe.
+
+Excess video load can turn an initial I/O error into journal failure and a
+controller requiring a physical power cycle. Release the video allocation
+before further recovery work: the normal release path waits two seconds for
+the dock and synchronizes pending I/O. If the first A/B arm fails, the second
+must not run. Every successfully started worker must be joined before normal
+control returns, including after thread-creation failure, or workers can race
+load release, file reuse, and result counters.
+
+Interpreting the measurements
+-----------------------------
+
+The contention probe uses PR off, the tightest case, and requires both a
+slowdown below 90% of the all-dark rate and at most 5% spread over three
+loaded samples. Disk-limited rates can vary by 30% or more, while a
+cable-limited rate is often steady to around 1%. These observations motivate
+the checks; a large ratio alone is not sufficient evidence.
+
+The probe distinguishes confirmed shortage, no shortage, incomplete setup,
+and dead storage. No shortage can be an intentional control with ratio near
+1.0; incomplete setup cannot establish that conclusion. Dead storage
+requires stopping, not interpreting another throughput sample.
+
+A/B compares the arm medians and alternates which arm runs first to balance
+cache and thermal drift. One repetition has zero spread by construction;
+odd repetition counts over-represent one ordering. If the faster arm becomes
+disk-limited, its gain is only a lower bound on released cable bandwidth.
+Keeping PR active in both arms holds display fetch, package power states,
+and memory traffic constant. PR entry can stop several GB/s of display
+memory fetch. Comparing PR off against on would also change competition
+between NVMe DMA and display reads through their shared root complex.
+
+For bandwidth-allocation-mode DP tunnels,
+``tb_dp_bandwidth_mode_consumed_bandwidth()`` obtains downstream consumption
+from ``usb4_dp_port_allocated_bandwidth()`` and hardcodes upstream consumption
+to zero. The downstream figure is an allocation read from port registers,
+not a count of pixel-carrying symbols.
+``intel_psr_allow_pr_bw_optimization()`` sets the tunnelling bit without
+calling ``drm_dp_tunnel_alloc_bw()``, so enabling the optimization does not
+itself change that figure. Accounting compares both programming orders and
+background event counts, and requires actual data before declaring two
+halves identical. Equal unknown values do not establish a result.
+
+Restoration and exit paths
+--------------------------
+
+Cleanup must handle library exits as well as explicit errors.
+``psr_set()`` can exit through ``igt_require_f()`` rather than return false.
+Tools such as ``amd_hdmi_compliance.c`` also rely on IGT requirement/skip
+exits; checking a boolean return alone does not cover those paths.
+The tool uses IGT exit handlers so its restoration runs alongside the VT
+handler installed by ``kmstest_set_vt_graphics_mode()``. A private signal
+exit could bypass that restoration and leave the console blank.
+
+``finish()`` and the exit hook both call restoration, so cleanup is
+idempotent and marks released resources unavailable. Bit 26 is restored
+only if the tool wrote it and knows the driver's value; restoration must
+not assume that value is 1. Read sources and interrupted write targets are
+registered for cleanup before creation or worker startup.
+
+Normal exit explicitly releases and settles a remaining video load before
+dropping framebuffers. Signal cleanup avoids an atomic commit and relies on
+removal of in-use framebuffers through ``drmModeRmFB()`` to stop their display
+use. Its interruption message uses ``write()``, not stdio, because a signal
+can arrive while a stdio lock is held.
+
+IGT's PSR handler is installed later and runs first, restoring the global
+``i915_edp_psr_debug`` override. Calling ``psr_enable()`` from tool cleanup
+would force the override again immediately after IGT cleared it. It could
+also raise another IGT requirement and re-enter the exit-handler list.
+Neither is a valid restoration operation.
+
+The command status is returned from ``main()``, as in
+``intel_dp_compliance.c``, ``msm_dp_compliance.c``, and ``intel_gvtg_test.c``,
+rather than passed through ``igt_exit()``. That preserves the tool's
+98 failure status instead of the framework's default and avoids a test-style
+SUCCESS line. Registered atexit handlers still run, while library skip paths
+retain exit code 77 and IGT handles signal exit status.
+
+EXAMPLES
+========
+
+intel_pr_bw check
+    Report whether this machine is capable, writing nothing.
+
+intel_pr_bw sweep --dp-targets 0,58000,68000,70000 --secs 3
+    Find where the disks start to run short of bandwidth.
+
+sudo IGT_PR_BW_NVME_PATHS=/mnt/d1,/mnt/d2 intel_pr_bw ab --dp-targets 70000 --reps 6
+    The measurement, at a load the sweep showed to be cable-limited.
+
+intel_pr_bw ab --dp-targets 70000 --reps 6 --sham
+    The harness bias control. Must report a ratio near 1.0.
+
+intel_pr_bw ab --dp-targets 70000 --reps 6 --read-agents
+    The direction control. Must report a ratio near 1.0.
+
+REPORTING BUGS
+==============
+
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues
diff --git a/man/meson.build b/man/meson.build
index 5c976c5d0..cf3445092 100644
--- a/man/meson.build
+++ b/man/meson.build
@@ -10,6 +10,7 @@ manpages = [
 	'intel_infoframes',
 	'intel_lid',
 	'intel_panel_fitter',
+	'intel_pr_bw',
 	'intel_reg',
 	'intel_stepping',
 	'intel_upload_blit_large',
diff --git a/tools/intel_pr_bw.c b/tools/intel_pr_bw.c
new file mode 100644
index 000000000..314474bab
--- /dev/null
+++ b/tools/intel_pr_bw.c
@@ -0,0 +1,4463 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/*
+ * intel_pr_bw - measure the USB4 bandwidth Panel Replay hands back
+ *
+ * Keep storage bandwidth-limited and toggle only the PR tunnelling bit.
+ * Dock counters report allocations, not live traffic, so measure throughput.
+ *
+ * check is read-only. sweep finds contention; ab measures the bit's effect;
+ * accounting compares dock bookkeeping without using disks.
+ *
+ * See man/intel_pr_bw.rst for setup, commands, and measurement rationale.
+ */
+
+#include "igt.h"
+#include "igt_kms.h"
+#include "igt_psr.h"
+#include "igt_sysfs.h"
+#include "intel_io.h"
+#include "intel_chipset.h"
+
+#include <ctype.h>
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <inttypes.h>
+#include <limits.h>
+#include <math.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <sys/types.h>
+#include <time.h>
+#include <unistd.h>
+
+#ifndef __printf
+#define __printf(a, b)		__attribute__((format(printf, a, b)))
+#endif
+
+/* Round predictions up to the DP tunnel allocation granularity, in Mb/s. */
+#define BW_GRANULE		500
+
+/* Ignore modes too small to compete for bandwidth, to keep the search small. */
+#define CLOCK_MIN		500000
+
+/*
+ * Kernel uncompressed single-pipe limits. Joiners disable Panel Replay.
+ * The IGT dotclock limit allows DSC and is not sufficient to exclude joiners;
+ * max_non_joiner_clock() selects a safe limit for the display generation.
+ */
+#define CLOCK_MAX_DISPLAY_30	1350000
+#define CLOCK_MAX_DISPLAY_3002	937500
+
+/*
+ * Rates use MiB/s, although the report labels them MB/s.
+ * Convert to decimal Mb/s with 8 * 1048576 / 1000000, not 8.
+ */
+#define MIB_S_TO_MBIT_S		8.388608
+
+#define MAX_CAND		64
+#define MAX_OUTPUTS		4
+#define MAX_AGENTS		4
+#define MAX_REPS		16
+#define MAX_GROUPS		8
+#define MAX_TARGETS		24
+
+/*
+ * Video-load ceiling in Mb/s. Excess load can cause EIO, aborted journals,
+ * and controllers that need a power cycle. Clamp corrections too.
+ * Raising --max-dp risks the drives.
+ */
+#define DP_MAX_SAFE		70000
+
+#define IO_CHUNK		(4 << 20)
+#define DEFAULT_WRITE_MB	1024
+/* Even, so the alternating arm order stays balanced. */
+#define DEFAULT_REPS		4
+#define DEFAULT_SECS		4.0
+
+#define DEFAULT_AGENT_PATHS	"/mnt/d1,/mnt/d2"
+
+/*
+ * TRANS_DP2_CTL(A) and transcoder stride. Bit 30 enables Panel Replay;
+ * bit 26 controls the tunnelling optimization being measured.
+ */
+#define TRANS_DP2_CTL_A			0x600A0
+#define TRANS_DP2_CTL_STRIDE		0x1000
+#define TRANS_DP2_PANEL_REPLAY_EN	(1u << 30)
+#define TRANS_DP2_PR_TUNNELING_EN	(1u << 26)
+
+/*
+ * Keep unavailable debugfs/log values distinct from known zero.
+ * Missing data prints as "unknown", not as a fabricated measurement.
+ */
+struct fact {
+	int val;
+	bool known;
+};
+
+static inline struct fact fact_known(int v)
+{
+	return (struct fact){ .val = v, .known = true };
+}
+
+static inline struct fact fact_unknown(void)
+{
+	return (struct fact){ .val = 0, .known = false };
+}
+
+/*
+ * Each fact_str() in one printf() needs its own buffer.
+ * Keep the ring larger than the widest call, or earlier values get overwritten.
+ */
+#define FACT_BUFS		16
+
+static const char *fact_str(struct fact f)
+{
+	static char buf[FACT_BUFS][32];
+	static int next;
+	char *b = buf[next++ % FACT_BUFS];
+
+	if (f.known)
+		snprintf(b, 32, "%d", f.val);
+	else
+		snprintf(b, 32, "unknown");
+
+	return b;
+}
+
+enum verdict {
+	V_PASS,
+	V_WARN,
+	V_FAIL,
+};
+
+static int n_fail, n_warn;
+
+/*
+ * Startup cable facts: raw width for change detection, and the CM budget
+ * and PCIe reservation for headroom calculations.
+ */
+static int g_link_down;
+static struct fact g_link_usable;
+static struct fact g_pcie_reserved;
+
+/*
+ * Only lack of root should stop check from inspecting displays.
+ * Other software-gate failures must not hide the rest of the report.
+ */
+static bool g_is_root;
+
+/*
+ * Prefer the CM's usable downstream budget over the raw lane product.
+ * The raw fallback includes encoding overhead; @exact identifies the basis.
+ */
+static int link_budget(bool *exact)
+{
+	if (exact)
+		*exact = g_link_usable.known;
+
+	return g_link_usable.known ? g_link_usable.val : g_link_down;
+}
+
+/* Print one gate result and count warnings and failures. */
+static void __printf(3, 4)
+report(enum verdict v, const char *what, const char *fmt, ...)
+{
+	static const char * const tag[] = { "PASS", "WARN", "FAIL" };
+	va_list args;
+
+	printf("  %-4s  %-28s ", tag[v], what);
+	va_start(args, fmt);
+	vprintf(fmt, args);
+	va_end(args);
+	printf("\n");
+
+	if (v == V_FAIL)
+		n_fail++;
+	else if (v == V_WARN)
+		n_warn++;
+}
+
+static void __printf(1, 2)
+report_hint(const char *fmt, ...)
+{
+	va_list args;
+
+	printf("        %*s ", 28, "");
+	va_start(args, fmt);
+	vprintf(fmt, args);
+	va_end(args);
+	printf("\n");
+}
+
+/* Options, filled by parse_opts(). */
+static struct {
+	int write_mb;
+	int reps;
+	double secs;
+	int max_dp;
+	int targets[MAX_TARGETS];
+	int n_targets;
+	bool custom_fill;
+	bool read_agents;
+	bool sham;
+} opts = {
+	.write_mb = DEFAULT_WRITE_MB,
+	.reps = DEFAULT_REPS,
+	.secs = DEFAULT_SECS,
+	.max_dp = DP_MAX_SAFE,
+};
+
+static double now_sec(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+
+	return ts.tv_sec + ts.tv_nsec / 1e9;
+}
+
+/*
+ * O_DIRECT writes may be partial. Finish each probe/source chunk instead of
+ * mistaking a partial transfer for a dead storage tunnel.
+ */
+static ssize_t write_full(int fd, const void *buf, size_t len)
+{
+	const char *p = buf;
+	size_t done = 0;
+
+	while (done < len) {
+		ssize_t n = write(fd, p + done, len - done);
+
+		if (n < 0)
+			return -1;
+		if (!n)
+			break;
+
+		done += n;
+	}
+
+	return (ssize_t)done;
+}
+
+/* Read a small file and trim trailing newlines and spaces. */
+static bool read_file_str(const char *path, char *out, size_t len)
+{
+	ssize_t n;
+	int fd;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return false;
+
+	n = read(fd, out, len - 1);
+	close(fd);
+
+	if (n <= 0)
+		return false;
+
+	out[n] = '\0';
+	while (n > 0 && (out[n - 1] == '\n' || out[n - 1] == ' '))
+		out[--n] = '\0';
+
+	return true;
+}
+
+static struct fact read_file_int(const char *path)
+{
+	char buf[64];
+	char *end;
+	long v;
+
+	if (!read_file_str(path, buf, sizeof(buf)))
+		return fact_unknown();
+
+	v = strtol(buf, &end, 0);
+	if (end == buf)
+		return fact_unknown();
+
+	return fact_known((int)v);
+}
+
+/* drm.debug is unsigned and may exceed a signed int, for example 0xffffffff. */
+static bool read_file_ulong(const char *path, unsigned long long *out)
+{
+	char buf[64];
+	char *end;
+
+	if (!read_file_str(path, buf, sizeof(buf)))
+		return false;
+
+	*out = strtoull(buf, &end, 0);
+
+	return end != buf;
+}
+
+static struct fact tbt_param_int(const char *name)
+{
+	char path[PATH_MAX];
+
+	snprintf(path, sizeof(path), "/sys/module/thunderbolt/parameters/%s",
+		 name);
+
+	return read_file_int(path);
+}
+
+static bool tbt_param_str(const char *name, char *out, size_t len)
+{
+	char path[PATH_MAX];
+
+	snprintf(path, sizeof(path), "/sys/module/thunderbolt/parameters/%s",
+		 name);
+
+	return read_file_str(path, out, len);
+}
+
+/*
+ * Tunnel groups and CM accounting are available only in driver logs.
+ * Their wording can change: keep missing values unknown and report which
+ * logging is available.
+ */
+static bool log_line_present(const char *needle)
+{
+	char line[1024];
+	bool found = false;
+	FILE *f;
+
+	f = popen("dmesg 2>/dev/null", "r");
+	if (!f)
+		return false;
+
+	while (!found && fgets(line, sizeof(line), f))
+		found = strstr(line, needle);
+
+	pclose(f);
+
+	return found;
+}
+
+/*
+ * Tunnel messages use DRM_UT_KMS. Read the live setting, not historical logs.
+ * If the parameter is unavailable on a dyndbg kernel, the caller probes dmesg.
+ */
+#define DRM_UT_KMS_BIT		0x04
+
+static bool drm_debug_has_kms(bool *known)
+{
+	unsigned long long v;
+
+	*known = read_file_ulong("/sys/module/drm/parameters/debug", &v);
+
+	return *known && (v & DRM_UT_KMS_BIT);
+}
+
+/*
+ * CM port messages use "<route>:<port>:". Keep host route 0, not a nested link.
+ * Bandwidth pairs are upstream/downstream; video uses the second value.
+ */
+static bool line_is_host_router(const char *line)
+{
+	const char *p = strstr(line, " 0:");
+
+	return p && isdigit((unsigned char)p[3]);
+}
+
+/*
+ * Read the host's last positive downstream CM budget.
+ * Requires thunderbolt.dyndbg=+p; the CM budget excludes encoding overhead.
+ */
+static struct fact read_link_usable(void)
+{
+	struct fact best = fact_unknown();
+	char line[1024];
+	FILE *f;
+
+	f = popen("dmesg 2>/dev/null", "r");
+	if (!f)
+		return best;
+
+	while (fgets(line, sizeof(line), f)) {
+		char *p = strstr(line, "link maximum bandwidth ");
+		int up, down;
+
+		if (!p || !line_is_host_router(line))
+			continue;
+		if (sscanf(p, "link maximum bandwidth %d/%d", &up, &down) == 2 &&
+		    down > 0)
+			best = fact_known(down);
+	}
+	pclose(f);
+
+	return best;
+}
+
+/*
+ * Read the host's standing downstream PCIe reservation.
+ * It reduces available headroom even when no device is attached.
+ */
+static struct fact read_pcie_reserved(void)
+{
+	struct fact best = fact_unknown();
+	char line[1024];
+	FILE *f;
+
+	f = popen("dmesg 2>/dev/null", "r");
+	if (!f)
+		return best;
+
+	while (fgets(line, sizeof(line), f)) {
+		char *p = strstr(line, "reserving ");
+		int up, down;
+
+		if (!p || !strstr(line, "for PCIe") ||
+		    !line_is_host_router(line))
+			continue;
+		if (sscanf(p, "reserving %d/%d", &up, &down) == 2 && down > 0)
+			best = fact_known(down);
+	}
+	pclose(f);
+
+	return best;
+}
+
+/*
+ * Return the hex route from a "<domain>-<route>" router name.
+ * Reject retimers such as "0-0:1.1"; they share the bus but are not routers.
+ */
+static const char *tbt_router_route(const char *name)
+{
+	const char *dash = strchr(name, '-');
+	const char *p;
+
+	if (!dash || !dash[1])
+		return NULL;
+
+	for (p = dash + 1; *p; p++) {
+		if (!isxdigit((unsigned char)*p))
+			return NULL;
+	}
+
+	return dash + 1;
+}
+
+/*
+ * Downstream Mb/s from the dock's rx_speed and rx_lanes.
+ * Pick the widest depth-1 router unless IGT_PR_BW_TBT_ROUTER selects one.
+ */
+static int read_link_downstream(char *who, size_t who_len)
+{
+	const char *env = getenv("IGT_PR_BW_TBT_ROUTER");
+	const char *base = "/sys/bus/thunderbolt/devices";
+	char path[PATH_MAX];
+	struct dirent *de;
+	int best = 0;
+	DIR *d;
+
+	if (who && who_len)
+		who[0] = '\0';
+
+	d = opendir(base);
+	if (!d)
+		return 0;
+
+	while ((de = readdir(d))) {
+		const char *route = tbt_router_route(de->d_name);
+		double gbps;
+		int lanes, mbps;
+		struct fact f;
+		FILE *fp;
+
+		if (!route)
+			continue;
+		if (env) {
+			if (strcmp(de->d_name, env))
+				continue;
+		} else if (strlen(route) != 1 || route[0] == '0') {
+			/* depth 1 only, and not the host router itself */
+			continue;
+		}
+
+		snprintf(path, sizeof(path), "%s/%s/rx_speed", base,
+			 de->d_name);
+		fp = fopen(path, "r");
+		if (!fp)
+			continue;
+		if (fscanf(fp, "%lf", &gbps) != 1) {
+			fclose(fp);
+			continue;
+		}
+		fclose(fp);
+
+		snprintf(path, sizeof(path), "%s/%s/rx_lanes", base,
+			 de->d_name);
+		f = read_file_int(path);
+		if (!f.known)
+			continue;
+		lanes = f.val;
+
+		mbps = (int)(gbps * 1000) * lanes;
+		if (mbps > best) {
+			best = mbps;
+			if (who && who_len) {
+				char name[64] = "", vendor[64] = "";
+
+				snprintf(path, sizeof(path), "%s/%s/device_name",
+					 base, de->d_name);
+				read_file_str(path, name, sizeof(name));
+				snprintf(path, sizeof(path), "%s/%s/vendor_name",
+					 base, de->d_name);
+				read_file_str(path, vendor, sizeof(vendor));
+
+				/* Many docks repeat the vendor in the name. */
+				if (vendor[0] && !strstr(name, vendor))
+					snprintf(who, who_len,
+						 "%.32s (%.40s %.40s, %.1f Gb/s x %d)",
+						 de->d_name, vendor, name,
+						 gbps, lanes);
+				else
+					snprintf(who, who_len,
+						 "%.32s (%.80s, %.1f Gb/s x %d)",
+						 de->d_name, name, gbps, lanes);
+			}
+		}
+	}
+	closedir(d);
+
+	return best;
+}
+
+/*
+ * Gate 1: report software and cable prerequisites without changing them.
+ * Reject unsuitable settings before a measuring command changes state.
+ */
+static bool gate_software(void)
+{
+	char tbt_router[192] = "";
+	struct fact f;
+	char buf[64];
+	int link;
+	bool ok = true;
+
+	printf("== software settings\n");
+
+	g_is_root = !geteuid();
+	if (!g_is_root) {
+		report(V_FAIL, "running as root",
+		       "no - need root for MMIO, debugfs and the kernel log");
+		ok = false;
+	} else {
+		report(V_PASS, "running as root", "yes");
+	}
+
+	/*
+	 * Only zero prevents 2+2 to 3+1 lane switching under load.
+	 * A wider cable would hide the bandwidth shortage being measured.
+	 */
+	f = tbt_param_int("asym_threshold");
+	if (!f.known) {
+		report(V_FAIL, "thunderbolt.asym_threshold",
+		       "cannot read - is the thunderbolt module loaded?");
+		ok = false;
+	} else if (f.val != 0) {
+		report(V_FAIL, "thunderbolt.asym_threshold",
+		       "%d - the cable will widen under load and hide the effect",
+		       f.val);
+		report_hint("boot with thunderbolt.asym_threshold=0 (only 0 disables it)");
+		ok = false;
+	} else {
+		report(V_PASS, "thunderbolt.asym_threshold",
+		       "0 - lane switching disabled");
+	}
+
+	/* Fixed tunnel shares do not exercise bandwidth reallocation. */
+	if (!tbt_param_str("bw_alloc_mode", buf, sizeof(buf))) {
+		report(V_WARN, "thunderbolt.bw_alloc_mode", "cannot read");
+	} else if (buf[0] != 'Y' && buf[0] != '1') {
+		report(V_FAIL, "thunderbolt.bw_alloc_mode",
+		       "%s - tunnels get fixed shares, nothing to reallocate",
+		       buf);
+		ok = false;
+	} else {
+		report(V_PASS, "thunderbolt.bw_alloc_mode", "%s", buf);
+	}
+
+	/* Link power saving is optional but may explain enclosure failures. */
+	if (tbt_param_str("clx", buf, sizeof(buf))) {
+		if (buf[0] == 'Y' || buf[0] == '1')
+			report(V_WARN, "thunderbolt.clx",
+			       "%s - the link may enter low-power states; "
+			       "boot with thunderbolt.clx=0 if drives drop out",
+			       buf);
+		else
+			report(V_PASS, "thunderbolt.clx",
+			       "%s - link low-power states off", buf);
+	}
+
+	link = read_link_downstream(tbt_router, sizeof(tbt_router));
+	g_link_down = link;
+	if (link <= 0) {
+		report(V_FAIL, "USB4 link",
+		       "no depth-1 Thunderbolt router found");
+		report_hint("plug in the dock, or set IGT_PR_BW_TBT_ROUTER");
+		ok = false;
+	} else {
+		report(V_PASS, "USB4 link", "%d Mb/s downstream via %s", link,
+		       tbt_router);
+	}
+
+	/* Missing logging removes read-backs, not the ability to measure. */
+	if (log_line_present("link maximum bandwidth ")) {
+		g_link_usable = read_link_usable();
+		g_pcie_reserved = read_pcie_reserved();
+
+		/* Historical lines show past logging, not its current state. */
+		report(V_PASS, "thunderbolt debug logging",
+		       "was on - CM budget %s Mb/s, PCIe reserved %s Mb/s",
+		       fact_str(g_link_usable), fact_str(g_pcie_reserved));
+	} else {
+		report(V_WARN, "thunderbolt debug logging",
+		       "off - the dock's own bandwidth figures are unavailable");
+		report_hint("boot with thunderbolt.dyndbg=+p to get them; without them every budget below is the raw lane product, which overstates what is left for the disks");
+	}
+
+	/* Make the raw-versus-usable budget basis visible in the report. */
+	if (link > 0) {
+		bool exact;
+		int budget = link_budget(&exact);
+
+		report(exact ? V_PASS : V_WARN, "budget base",
+		       "%d Mb/s - %s", budget,
+		       exact ? "the connection manager's own usable figure" :
+			       "the raw lane product, encoding overhead not deducted");
+	}
+
+	{
+		bool live_known;
+		bool kms = drm_debug_has_kms(&live_known);
+
+		if (live_known && kms) {
+			report(V_PASS, "drm debug logging",
+			       "DRM_UT_KMS set now - DP tunnel group allocations are readable");
+		} else if (live_known) {
+			report(V_WARN, "drm debug logging",
+			       "DRM_UT_KMS clear now - cannot read back what video load was allocated");
+			report_hint("echo 0x10e > /sys/module/drm/parameters/debug, or boot with drm.debug=0x10e");
+		} else if (log_line_present("[DPTUN ")) {
+			/* No live parameter: report only past logging. */
+			report(V_WARN, "drm debug logging",
+			       "cannot read the parameter; a [DPTUN ] line exists in the log");
+			report_hint("that line may predate the logging being turned off again - treat unknown read-backs as expected");
+		} else {
+			report(V_WARN, "drm debug logging",
+			       "off - cannot read back what video load was allocated");
+			report_hint("boot with drm.debug=0x10e; without it the load targeting runs blind");
+		}
+	}
+
+	return ok;
+}
+
+/*
+ * The PR panel must use tbt-alt to share the cable with storage.
+ * DP-alt uses dedicated wires; legacy is a normal DisplayPort connection.
+ */
+enum tc_mode {
+	TC_NONE,		/* not a Type-C port at all */
+	TC_UNKNOWN,
+	TC_TBT_ALT,
+	TC_DP_ALT,
+	TC_LEGACY,
+};
+
+static const char *tc_mode_name(enum tc_mode m)
+{
+	switch (m) {
+	case TC_TBT_ALT:
+		return "tbt-alt";
+	case TC_DP_ALT:
+		return "dp-alt";
+	case TC_LEGACY:
+		return "legacy";
+	case TC_NONE:
+		return "not Type-C";
+	default:
+		return "unknown";
+	}
+}
+
+#define MAX_DCONN		32
+
+/* What i915_display_info says about one connector. */
+struct dconn {
+	uint32_t id;
+	char name[32];
+	bool connected;
+	int pipe;		/* -1 if not driven by a CRTC */
+	enum tc_mode mode;
+	char port[48];		/* e.g. "TC Port D/TC#1" */
+	/*
+	 * Match the driving encoder to "AUX <ch>/<encoder>" in tunnel logs.
+	 * See parse_topology().
+	 */
+	char encoder[64];
+};
+
+/*
+ * Read the complete file into a malloc'd, NUL-terminated buffer.
+ * Fixed-size reads can lose the connector section at the end of display info.
+ * Discard partial data on read or allocation failure.
+ */
+static char *read_debugfs_all(int dir, const char *name)
+{
+	size_t cap = 64 << 10, len = 0;
+	char *buf;
+	int fd;
+
+	fd = openat(dir, name, O_RDONLY);
+	if (fd < 0)
+		return NULL;
+
+	buf = malloc(cap);
+	if (!buf) {
+		close(fd);
+		return NULL;
+	}
+
+	for (;;) {
+		ssize_t n = read(fd, buf + len, cap - len - 1);
+
+		if (n < 0) {
+			free(buf);
+			close(fd);
+			return NULL;
+		}
+		if (!n)
+			break;
+
+		len += n;
+		if (len + 1 >= cap) {
+			char *bigger = realloc(buf, cap * 2);
+
+			if (!bigger) {
+				free(buf);
+				close(fd);
+				return NULL;
+			}
+			buf = bigger;
+			cap *= 2;
+		}
+	}
+
+	buf[len] = '\0';
+	close(fd);
+
+	return buf;
+}
+
+/*
+ * CRTC blocks map connectors to pipes and encoders; connector blocks give
+ * Type-C modes. Top-level headers start at column 0, unlike nested connectors.
+ * The manpage's measurement rationale shows the input format.
+ */
+static int parse_display_info(char *buf, struct dconn *out, int max)
+{
+	char cur_enc[sizeof(out[0].encoder)] = "";
+	int n = 0, cur_pipe = -1, cur = -1;
+	char *line, *save = NULL;
+
+	for (line = strtok_r(buf, "\n", &save); line;
+	     line = strtok_r(NULL, "\n", &save)) {
+		char name[32];
+		unsigned int id;
+		char pipe_ch;
+		char *p;
+		int i;
+
+		if (line[0] == '[') {
+			/* A new top-level section ends any previous block. */
+			cur = -1;
+			cur_enc[0] = '\0';
+
+			if (sscanf(line, "[CRTC:%u:pipe %c]", &id,
+				   &pipe_ch) == 2) {
+				cur_pipe = pipe_ch - 'A';
+				continue;
+			}
+			cur_pipe = -1;
+
+			if (sscanf(line, "[CONNECTOR:%u:%31[^]]", &id,
+				   name) == 2) {
+				for (i = 0; i < n; i++) {
+					if (out[i].id == id)
+						break;
+				}
+				if (i == n) {
+					if (n == max)
+						continue;
+					memset(&out[n], 0, sizeof(out[n]));
+					out[n].id = id;
+					out[n].pipe = -1;
+					out[n].mode = TC_NONE;
+					snprintf(out[n].name,
+						 sizeof(out[n].name), "%s",
+						 name);
+					n++;
+				}
+				cur = i;
+				out[cur].connected =
+					strstr(line, "status: connected");
+			}
+			continue;
+		}
+
+		/* CRTC block: encoder for the following connectors. */
+		if (cur_pipe >= 0) {
+			p = strstr(line, "[ENCODER:");
+			if (p && sscanf(p, "[ENCODER:%u:%63[^]]", &id,
+					cur_enc) == 2)
+				continue;
+		}
+
+		/* Inside a CRTC block: the connectors that encoder drives. */
+		p = cur_pipe >= 0 ? strstr(line, "[CONNECTOR:") : NULL;
+		if (p && sscanf(p, "[CONNECTOR:%u:%31[^]]", &id, name) == 2) {
+			for (i = 0; i < n; i++) {
+				if (out[i].id == id)
+					break;
+			}
+			if (i == n) {
+				if (n == max)
+					continue;
+				memset(&out[n], 0, sizeof(out[n]));
+				out[n].id = id;
+				out[n].mode = TC_NONE;
+				snprintf(out[n].name, sizeof(out[n].name), "%s",
+					 name);
+				n++;
+			}
+			out[i].pipe = cur_pipe;
+			snprintf(out[i].encoder, sizeof(out[i].encoder), "%s",
+				 cur_enc);
+			continue;
+		}
+
+		/* Inside a connector block: the Type-C port and its mode. */
+		p = cur >= 0 ? strstr(line, "TC Port ") : NULL;
+		if (p) {
+			char *colon = strstr(p, ": mode: ");
+			char *m;
+
+			if (!colon)
+				continue;
+
+			snprintf(out[cur].port, sizeof(out[cur].port), "%.*s",
+				 (int)(colon - p), p);
+
+			m = colon + strlen(": mode: ");
+			if (!strncmp(m, "tbt-alt", 7))
+				out[cur].mode = TC_TBT_ALT;
+			else if (!strncmp(m, "dp-alt", 6))
+				out[cur].mode = TC_DP_ALT;
+			else if (!strncmp(m, "legacy", 6))
+				out[cur].mode = TC_LEGACY;
+			else
+				out[cur].mode = TC_UNKNOWN;
+		}
+	}
+
+	return n;
+}
+
+static struct dconn *find_dconn(struct dconn *c, int n, uint32_t id)
+{
+	int i;
+
+	for (i = 0; i < n; i++) {
+		if (c[i].id == id)
+			return &c[i];
+	}
+
+	return NULL;
+}
+
+/*
+ * This register is transcoder-indexed. Supported configurations map pipes
+ * one-to-one, but debugfs must confirm the value before it is trusted.
+ * Use pr_ctl_offset() to follow the PR panel's pipe, not a fixed pipe A.
+ */
+static uint32_t trans_dp2_ctl_offset(int pipe)
+{
+	return TRANS_DP2_CTL_A + (uint32_t)pipe * TRANS_DP2_CTL_STRIDE;
+}
+
+/*
+ * On the tunnelled DP panel, "PanelReplay ctl:" reports TRANS_DP2_CTL.
+ * The line is absent when PSR/PR is disabled; use MMIO to confirm PR is off.
+ * eDP may report a different register under the same label.
+ */
+static bool read_ctl_debugfs(int debugfs_fd, const char *conn_name,
+			     uint32_t *val)
+{
+	char path[PATH_MAX], buf[PSR_STATUS_MAX_LEN];
+	char *p;
+
+	snprintf(path, sizeof(path), "%s/i915_psr_status", conn_name);
+
+	if (igt_debugfs_simple_read(debugfs_fd, path, buf, sizeof(buf)) < 0)
+		return false;
+
+	p = strstr(buf, "PanelReplay ctl:");
+	if (!p)
+		return false;
+
+	p = strchr(p, '[');
+
+	return p && sscanf(p, "[0x%x]", val) == 1;
+}
+
+static const int bpc_list[] = { 6, 8, 10, 12 };
+#define N_BPC ((int)ARRAY_SIZE(bpc_list))
+
+static int ceil_granule(int64_t v)
+{
+	return (int)(((v + BW_GRANULE - 1) / BW_GRANULE) * BW_GRANULE);
+}
+
+/*
+ * Own each mode: IGT replaces the connector's mode list across commits.
+ */
+struct cand {
+	drmModeModeInfo mode;
+	int clock;
+};
+
+struct out_state {
+	igt_output_t *output;
+	struct dconn *conn;
+	igt_crtc_t *crtc;
+	struct igt_fb fb;
+	bool fb_valid;
+
+	int sink_max_bpc;
+	int group;
+
+	int n_cand;
+	/*
+	 * Keep EDID candidates; discard appended synthetic modes at the next
+	 * custom selection.
+	 */
+	int n_cand_edid;
+	struct cand cand[MAX_CAND];
+
+	/* Current selection; sel_cand < 0 leaves this output dark. */
+	int sel_cand;
+	int sel_bpc;
+	int predicted;
+};
+
+static struct out_state outs[MAX_OUTPUTS];
+static int n_out;
+static int pr_idx = -1;
+static int group_cap[MAX_GROUPS];
+
+/* Distinguish absent tunnel logging from failed connector matching. */
+static bool topo_saw_dptun;
+
+/* max_non_joiner_clock() for this hardware, filled by gate_display(). */
+static int g_max_clock;
+
+/*
+ * Pin the PR stream once for the whole run. Changing it between levels or
+ * halves would change the bandwidth block whose release is being measured.
+ */
+static int pr_pin_cand = -1;
+static int pr_pin_bpc;
+static int pr_pin_bw;
+
+static int eff_bpc(const struct out_state *o, int bpc)
+{
+	if (o->sink_max_bpc > 0 && bpc > o->sink_max_bpc)
+		bpc = o->sink_max_bpc;
+
+	return bpc;
+}
+
+/*
+ * Estimate clock x bpp, rounded up to an allocation granule.
+ * Uncompressed 8b/10b overhead is about 1.0; set_load() reads allocations back.
+ */
+static int predict_bw(const struct out_state *o, int clock_khz, int bpc)
+{
+	return ceil_granule((int64_t)clock_khz * 3 * eff_bpc(o, bpc) / 1000);
+}
+
+/*
+ * IGT cannot distinguish display 30 from 30.02. Use their lower uncompressed
+ * limit to exclude joiners, even if that skips some usable modes.
+ */
+static int max_non_joiner_clock(int drm_fd)
+{
+	unsigned int ver = intel_display_ver(intel_get_drm_devid(drm_fd));
+
+	if (ver > 30)
+		return CLOCK_MAX_DISPLAY_30;
+	if (ver == 30)
+		return CLOCK_MAX_DISPLAY_3002;
+
+	/*
+	 * Below display 30 the kernel enforces no uncompressed limit.
+	 * Without a safe filter, gate_display() refuses the measurement.
+	 */
+	return 0;
+}
+
+static void build_candidates(int drm_fd, int max_clock, int max_dotclock,
+			     struct out_state *o)
+{
+	drmModeConnector *conn = o->output->config.connector;
+	int i;
+
+	o->n_cand = 0;
+
+	for (i = 0; i < conn->count_modes; i++) {
+		drmModeModeInfo *mode = &conn->modes[i];
+		int j;
+
+		if ((int)mode->clock < CLOCK_MIN)
+			continue;
+		/*
+		 * Exclude joiners with both the uncompressed limit and IGT's
+		 * helper; the library limit alone is too permissive.
+		 */
+		if ((int)mode->clock > max_clock)
+			continue;
+		if (igt_bigjoiner_possible(drm_fd, mode, max_dotclock))
+			continue;
+		if (o->n_cand == MAX_CAND)
+			break;
+
+		/*
+		 * Keep the first mode at each clock. Equal clocks have equal
+		 * predicted bandwidth at each BPC, so duplicates only expand
+		 * the exhaustive search.
+		 */
+		for (j = 0; j < o->n_cand; j++) {
+			if (o->cand[j].clock == (int)mode->clock)
+				break;
+		}
+		if (j < o->n_cand)
+			continue;
+
+		o->cand[o->n_cand].mode = *mode;
+		o->cand[o->n_cand].clock = mode->clock;
+		o->n_cand++;
+	}
+
+	o->n_cand_edid = o->n_cand;
+}
+
+/*
+ * Map outputs to tunnel groups and caps through the AUX encoder name.
+ * Bandwidth log lines need not name a connector. Match either the full encoder
+ * name or its component prefix, as kernel versions have emitted both.
+ * Only fillers in the PR group consume that group's budget.
+ * See the manpage's measurement rationale for log formats and mapping details.
+ */
+static bool aux_matches_encoder(const char *aux, const char *encoder)
+{
+	const char *slash = strchr(aux, '/');
+	size_t na, ne, n;
+
+	if (!slash || !encoder[0])
+		return false;
+
+	aux = slash + 1;
+	na = strlen(aux);
+	ne = strlen(encoder);
+
+	if (!na)
+		return false;
+
+	n = na < ne ? na : ne;
+	if (strncmp(aux, encoder, n))
+		return false;
+
+	/*
+	 * Prefix matches must end at '/': TC1 must not match TC12 and
+	 * assign the connector to the wrong group.
+	 */
+	if (na < ne)
+		return encoder[n] == '/';
+	if (ne < na)
+		return aux[n] == '/';
+
+	return true;
+}
+
+static void parse_topology(void)
+{
+	char line[1024];
+	FILE *f;
+	int i;
+
+	for (i = 0; i < MAX_GROUPS; i++)
+		group_cap[i] = 0;
+	for (i = 0; i < n_out; i++)
+		outs[i].group = -1;
+
+	topo_saw_dptun = false;
+
+	f = popen("dmesg 2>/dev/null", "r");
+	if (!f)
+		return;
+
+	while (fgets(line, sizeof(line), f)) {
+		int dom, grp, adap, conn, a, b;
+		char *tun = strstr(line, "[DPTUN ");
+		char aux[96];
+		char *p;
+
+		if (!tun)
+			continue;
+		if (sscanf(tun, "[DPTUN %d:%d:%d]", &dom, &grp, &adap) != 3) {
+			/* group totals use "d:g:*" */
+			if (sscanf(tun, "[DPTUN %d:%d:*]", &dom, &grp) != 2)
+				continue;
+		}
+		if (grp < 0 || grp >= MAX_GROUPS)
+			continue;
+
+		topo_saw_dptun = true;
+
+		p = strstr(line, "Group alloc:");
+		if (p && sscanf(p, "Group alloc:%d/%d", &a, &b) == 2 && b > 0)
+			group_cap[grp] = b;
+
+		/* Start at DPTUN to avoid brackets in the log prefix. */
+		p = strstr(tun, "][");
+		if (p && sscanf(p + 1, "[%95[^]]", aux) == 1) {
+			for (i = 0; i < n_out; i++) {
+				if (aux_matches_encoder(aux,
+							outs[i].conn->encoder))
+					outs[i].group = grp;
+			}
+		}
+
+		/* Also use an explicit connector tag when one is present. */
+		p = strstr(line, "[CONNECTOR:");
+		if (p && sscanf(p, "[CONNECTOR:%d:", &conn) == 1) {
+			for (i = 0; i < n_out; i++) {
+				if (outs[i].output->id == (uint32_t)conn)
+					outs[i].group = grp;
+			}
+		}
+	}
+	pclose(f);
+}
+
+/*
+ * Zero means dark; choice - 1 encodes the mode and BPC indices.
+ * Dark must be available when the budget cannot fit even the cheapest mode.
+ */
+static int choice_bw(const struct out_state *o, int choice)
+{
+	if (!choice)
+		return 0;
+
+	choice--;
+
+	return predict_bw(o, o->cand[choice / N_BPC].clock,
+			  bpc_list[choice % N_BPC]);
+}
+
+static void apply_choice(struct out_state *o, int choice)
+{
+	if (!choice) {
+		o->sel_cand = -1;
+		o->sel_bpc = 0;
+		o->predicted = 0;
+		return;
+	}
+
+	choice--;
+	o->sel_cand = choice / N_BPC;
+	o->sel_bpc = bpc_list[choice % N_BPC];
+	o->predicted = predict_bw(o, o->cand[o->sel_cand].clock, o->sel_bpc);
+}
+
+/*
+ * Choose the largest total <= @target that also fits every group cap.
+ * Use arithmetic, not commits: a driver may silently reduce BPC to make a
+ * commit succeed. The first configuration wins ties.
+ */
+static bool maximise_under_target(const int *use, int n_use, int target)
+{
+	int base = outs[pr_idx].predicted;
+	int best[MAX_OUTPUTS], choice[MAX_OUTPUTS] = { 0 };
+	int nchoice[MAX_OUTPUTS];
+	int best_total = -1;
+	int i;
+
+	for (i = 0; i < n_use; i++)
+		nchoice[i] = 1 + outs[use[i]].n_cand * N_BPC;
+
+	for (;;) {
+		int gsum[MAX_GROUPS] = { 0 };
+		struct out_state *pr = &outs[pr_idx];
+		int total = base;
+		bool done, fits = true;
+
+		/*
+		 * Enforce both budgets: independently advertised group caps
+		 * can sum to more than the cable target.
+		 */
+		if (pr->group >= 0)
+			gsum[pr->group] += pr->predicted;
+
+		for (i = 0; i < n_use; i++) {
+			struct out_state *o = &outs[use[i]];
+			int bw = choice_bw(o, choice[i]);
+
+			total += bw;
+			if (o->group >= 0)
+				gsum[o->group] += bw;
+		}
+
+		for (i = 0; i < MAX_GROUPS; i++) {
+			if (group_cap[i] > 0 && gsum[i] > group_cap[i]) {
+				fits = false;
+				break;
+			}
+		}
+
+		if (fits && total <= target && total > best_total) {
+			best_total = total;
+			for (i = 0; i < n_use; i++)
+				best[i] = choice[i];
+		}
+
+		done = true;
+		for (i = 0; i < n_use; i++) {
+			if (++choice[i] < nchoice[i]) {
+				done = false;
+				break;
+			}
+			choice[i] = 0;
+		}
+		if (done)
+			break;
+	}
+
+	if (best_total < 0)
+		return false;
+
+	for (i = 0; i < n_use; i++)
+		apply_choice(&outs[use[i]], best[i]);
+
+	return true;
+}
+
+/*
+ * Pick the largest configuration within @cap rather than asking the driver
+ * to lower BPC, which would shrink the PR stream being measured.
+ */
+static bool pin_best_fitting(struct out_state *o, int cap)
+{
+	int best = -1, best_bw = -1, best_bpc = 0;
+	int i, b;
+
+	for (i = 0; i < o->n_cand; i++) {
+		for (b = 0; b < N_BPC; b++) {
+			int bw = predict_bw(o, o->cand[i].clock, bpc_list[b]);
+
+			if (bw <= cap && bw > best_bw) {
+				best_bw = bw;
+				best = i;
+				best_bpc = bpc_list[b];
+			}
+		}
+	}
+
+	if (best < 0)
+		return false;
+
+	o->sel_cand = best;
+	o->sel_bpc = best_bpc;
+	o->predicted = best_bw;
+
+	return true;
+}
+
+/*
+ * Pin PR once, within its known group cap and the safety ceiling.
+ * Do not resize it for individual load levels.
+ */
+static bool pin_pr_output(void)
+{
+	struct out_state *pr = &outs[pr_idx];
+	int cap = opts.max_dp;
+
+	if (pr->group >= 0 && group_cap[pr->group] > 0 &&
+	    group_cap[pr->group] < cap)
+		cap = group_cap[pr->group];
+
+	if (!pin_best_fitting(pr, cap))
+		return false;
+
+	pr_pin_cand = pr->sel_cand;
+	pr_pin_bpc = pr->sel_bpc;
+	pr_pin_bw = pr->predicted;
+
+	return true;
+}
+
+/* Re-apply that one decision. */
+static bool apply_pr_pin(void)
+{
+	struct out_state *pr = &outs[pr_idx];
+
+	if (pr_pin_cand < 0 || pr_pin_cand >= pr->n_cand)
+		return false;
+
+	pr->sel_cand = pr_pin_cand;
+	pr->sel_bpc = pr_pin_bpc;
+	pr->predicted = pr_pin_bw;
+
+	return true;
+}
+
+/*
+ * Fill up to @target while keeping the PR pin unchanged.
+ * Reject targets below the pin; shrinking PR would change the measurement.
+ */
+static bool select_load(int target)
+{
+	int use[MAX_OUTPUTS], n_use = 0;
+	int i;
+
+	for (i = 0; i < n_out; i++)
+		apply_choice(&outs[i], 0);
+
+	if (!apply_pr_pin())
+		return false;
+
+	if (pr_pin_bw > target)
+		return false;
+
+	for (i = 0; i < n_out && n_use < MAX_OUTPUTS; i++) {
+		if (i != pr_idx)
+			use[n_use++] = i;
+	}
+
+	if (!n_use)
+		return true;
+
+	return maximise_under_target(use, n_use, target);
+}
+
+/*
+ * Retarget the highest-clock candidate's timings to the requested bandwidth.
+ * This fills gaps between advertised modes that can hide the useful load range.
+ * The panel may still reject the new clock; report that as a commit failure.
+ */
+static bool synth_filler(struct out_state *o, int bw)
+{
+	static const int try_bpc[] = { 8, 10, 12, 6 };
+	int i, tmpl = -1;
+
+	for (i = 0; i < o->n_cand; i++) {
+		if (tmpl < 0 || o->cand[i].clock > o->cand[tmpl].clock)
+			tmpl = i;
+	}
+
+	if (tmpl < 0 || o->n_cand >= MAX_CAND)
+		return false;
+
+	/*
+	 * Floor before predict_bw() rounds up. Otherwise an unaligned target
+	 * could overshoot the requested load, including the safety ceiling.
+	 */
+	bw -= bw % BW_GRANULE;
+	if (bw < BW_GRANULE)
+		return false;
+
+	for (i = 0; i < (int)ARRAY_SIZE(try_bpc); i++) {
+		int b = eff_bpc(o, try_bpc[i]);
+		int64_t clock = (int64_t)bw * 1000 / (3 * b);
+		drmModeModeInfo *m;
+		struct cand *c;
+		int htot, vtot;
+
+		if (clock < CLOCK_MIN || clock > g_max_clock)
+			continue;
+
+		c = &o->cand[o->n_cand];
+		c->mode = o->cand[tmpl].mode;
+		c->clock = (int)clock;
+
+		m = &c->mode;
+		m->clock = (int)clock;
+
+		/* Update refresh to match the new clock. */
+		htot = m->htotal ? m->htotal : m->hdisplay;
+		vtot = m->vtotal ? m->vtotal : m->vdisplay;
+		if (htot > 0 && vtot > 0)
+			m->vrefresh = (int)((int64_t)clock * 1000 /
+					    ((int64_t)htot * vtot));
+
+		o->sel_cand = o->n_cand++;
+		o->sel_bpc = try_bpc[i];
+		o->predicted = predict_bw(o, c->clock, try_bpc[i]);
+
+		return true;
+	}
+
+	return false;
+}
+
+/*
+ * Keep the PR pin and synthesize one filler for the remaining bandwidth.
+ * Other fillers stay dark, so rigs with more than two panels have a lower
+ * reachable range than plain selection. gate_modes() reports this tradeoff.
+ */
+static bool select_load_custom(int desired)
+{
+	int i, filler = -1, rem;
+
+	for (i = 0; i < n_out; i++) {
+		outs[i].n_cand = outs[i].n_cand_edid;
+		apply_choice(&outs[i], 0);
+	}
+
+	if (!apply_pr_pin())
+		return false;
+
+	if (pr_pin_bw > desired)
+		return false;
+
+	rem = desired - pr_pin_bw;
+	if (rem < BW_GRANULE)
+		return true;		/* PR alone supplies the load */
+
+	for (i = 0; i < n_out; i++) {
+		if (i != pr_idx) {
+			filler = i;
+			break;
+		}
+	}
+	if (filler < 0)
+		return false;
+
+	if (!synth_filler(&outs[filler], rem)) {
+		/*
+		 * Name the clock-limit failure: custom timings cannot fill the
+		 * gap below the minimum filler clock.
+		 */
+		printf("  --custom-fill: no filler mode can carry %d Mb/s - the implied pixel clock falls outside %d..%d kHz, and no monitor will train below that\n",
+		       rem, CLOCK_MIN, g_max_clock);
+		return false;
+	}
+
+	return true;
+}
+
+/* How many panels --custom-fill has to leave dark to hit a target exactly. */
+static int custom_fill_dark_panels(void)
+{
+	return n_out > 2 ? n_out - 2 : 0;
+}
+
+/*
+ * Gate 2: inspect display capabilities without requesting DRM master or
+ * committing a modeset. Opening DRM may grant master implicitly.
+ */
+struct display_ctx {
+	int drm_fd;
+	int debugfs_fd;
+	igt_display_t display;
+	int max_dotclock;
+	struct intel_mmio_data mmio;
+	bool mmio_ready;
+	bool display_ready;
+
+	struct dconn conn[MAX_DCONN];
+	int n_conn;
+
+	igt_output_t *pr_output;
+	struct dconn *pr_conn;
+	/*
+	 * Saved driver control value. Restore bit 26 from it, not blindly to 1.
+	 */
+	uint32_t pr_ctl;
+	bool pr_ctl_known;
+};
+
+static bool gate_display(struct display_ctx *ctx)
+{
+	const char *pr_want = getenv("IGT_PR_BW_PR_OUTPUT");
+	bool pr_pinned = false;
+	igt_output_t *output;
+	char *info;
+	bool ok = true;
+	int n_tbt = 0;
+
+	printf("\n== displays\n");
+
+	ctx->drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+	if (ctx->drm_fd < 0) {
+		report(V_FAIL, "Intel display device", "cannot open i915 or xe");
+		return false;
+	}
+
+	ctx->debugfs_fd = igt_debugfs_dir(ctx->drm_fd);
+	if (ctx->debugfs_fd < 0) {
+		report(V_FAIL, "debugfs", "cannot open the device's debugfs dir");
+		return false;
+	}
+
+	igt_display_require(&ctx->display, ctx->drm_fd);
+	ctx->display_ready = true;
+	if (!ctx->display.is_atomic) {
+		report(V_FAIL, "atomic modesetting",
+		       "not available - the load cannot be committed");
+		ok = false;
+	} else {
+		report(V_PASS, "atomic modesetting", "yes");
+	}
+
+	info = read_debugfs_all(ctx->debugfs_fd, "i915_display_info");
+	if (!info) {
+		report(V_FAIL, "i915_display_info",
+		       "cannot read - no way to tell whether video is tunnelled");
+		return false;
+	}
+	ctx->n_conn = parse_display_info(info, ctx->conn, MAX_DCONN);
+	free(info);
+
+	if (!ctx->n_conn) {
+		report(V_FAIL, "i915_display_info",
+		       "no connectors parsed - has the format changed?");
+		return false;
+	}
+
+	/*
+	 * Report outputs and their connection types.
+	 * The PR panel must be tunnelled; fillers are selected separately.
+	 */
+	ctx->max_dotclock = igt_get_max_dotclock(ctx->drm_fd);
+	g_max_clock = max_non_joiner_clock(ctx->drm_fd);
+	n_out = 0;
+	pr_idx = -1;
+	pr_pin_cand = -1;
+
+	if (!g_max_clock) {
+		report(V_FAIL, "non-joiner mode limit",
+		       "unknown on display version %u - the kernel enforces no uncompressed dotclock limit there, so joiner modes cannot be kept out",
+		       intel_display_ver(intel_get_drm_devid(ctx->drm_fd)));
+		report_hint("this hardware cannot advertise the tunnelling optimization either");
+		return false;
+	}
+	report(V_PASS, "non-joiner mode limit", "%d kHz", g_max_clock);
+
+	for_each_connected_output(&ctx->display, output) {
+		struct dconn *c = find_dconn(ctx->conn, ctx->n_conn,
+					     output->id);
+		unsigned int max_bpc;
+		struct out_state *o;
+		bool is_pr;
+
+		if (!c) {
+			report(V_WARN, igt_output_name(output),
+			       "connected, but absent from i915_display_info");
+			continue;
+		}
+
+		if (n_out == MAX_OUTPUTS) {
+			report(V_WARN, igt_output_name(output),
+			       "ignored - only %d outputs are used", MAX_OUTPUTS);
+			continue;
+		}
+
+		o = &outs[n_out];
+		memset(o, 0, sizeof(*o));
+		o->output = output;
+		o->conn = c;
+		o->sel_cand = -1;
+		o->group = -1;
+		o->sink_max_bpc = igt_get_output_max_bpc(output, &max_bpc) ?
+				  (int)max_bpc : 0;
+
+		build_candidates(ctx->drm_fd, g_max_clock, ctx->max_dotclock, o);
+		if (!o->n_cand) {
+			report(V_WARN, igt_output_name(output),
+			       "no usable non-joiner mode, ignored");
+			continue;
+		}
+
+		is_pr = psr_sink_support(ctx->drm_fd, ctx->debugfs_fd,
+					 PR_MODE_SEL_FETCH, output);
+		/*
+		 * Prefer a tunnelled PR panel over an eDP enumerated first.
+		 * A valid IGT_PR_BW_PR_OUTPUT override pins the choice;
+		 * otherwise enumeration order breaks ties.
+		 */
+		if (is_pr && !pr_pinned) {
+			bool forced = pr_want &&
+				      !strcmp(igt_output_name(output), pr_want);
+
+			if (forced || pr_idx < 0 ||
+			    (c->mode == TC_TBT_ALT &&
+			     ctx->pr_conn->mode != TC_TBT_ALT)) {
+				pr_idx = n_out;
+				ctx->pr_output = output;
+				ctx->pr_conn = c;
+				pr_pinned = forced;
+			}
+		}
+
+		if (c->mode == TC_TBT_ALT)
+			n_tbt++;
+
+		report(c->mode == TC_TBT_ALT ? V_PASS : V_WARN,
+		       igt_output_name(output),
+		       "%s, %s, pipe %s, %d mode(s), max %d bpc%s",
+		       c->port[0] ? c->port : "not a Type-C port",
+		       tc_mode_name(c->mode),
+		       c->pipe >= 0 ? kmstest_pipe_name(c->pipe) : "none",
+		       o->n_cand, o->sink_max_bpc,
+		       is_pr ? "   <- Panel Replay capable" : "");
+
+		n_out++;
+	}
+
+	if (pr_want && !pr_pinned) {
+		report(V_WARN, "IGT_PR_BW_PR_OUTPUT",
+		       "\"%s\" is not a connected Panel Replay output; choosing one instead",
+		       pr_want);
+	}
+
+	if (!ctx->pr_output) {
+		report(V_FAIL, "Panel Replay panel",
+		       "no connected output supports Panel Replay selective update");
+		return false;
+	}
+
+	/* PR can free shared cable bandwidth only on a tunnelled panel. */
+	if (ctx->pr_conn->mode != TC_TBT_ALT) {
+		report(V_FAIL, "PR panel is tunnelled",
+		       "%s is in %s mode - its video does not share the cable",
+		       igt_output_name(ctx->pr_output),
+		       tc_mode_name(ctx->pr_conn->mode));
+		/*
+		 * Give actionable advice: an internal panel cannot be moved
+		 * to a dock port.
+		 */
+		if (ctx->pr_conn->mode == TC_NONE)
+			report_hint("attach a Panel Replay monitor to a Thunderbolt dock port; %s cannot be moved",
+				    igt_output_name(ctx->pr_output));
+		else
+			report_hint("move it to a Thunderbolt dock port, or set IGT_PR_BW_PR_OUTPUT to a tunnelled one");
+		ok = false;
+	} else {
+		report(V_PASS, "PR panel is tunnelled",
+		       "%s via %s", igt_output_name(ctx->pr_output),
+		       ctx->pr_conn->port);
+	}
+
+	if (n_tbt < 2) {
+		report(V_WARN, "tunnelled panels",
+		       "%d - one panel alone may not reach a load high enough to create a shortage",
+		       n_tbt);
+	} else {
+		report(V_PASS, "tunnelled panels", "%d", n_tbt);
+	}
+
+	/*
+	 * Map MMIO even if PR has no pipe yet; prepare() assigns one later.
+	 * Later register access must never use an uninitialized mapping.
+	 */
+	intel_register_access_init(&ctx->mmio, intel_get_pci_device_display(),
+				   0);
+	ctx->mmio_ready = true;
+
+	/* The register, derived from the pipe rather than assumed. */
+	if (ctx->pr_conn->pipe < 0) {
+		report(V_WARN, "TRANS_DP2_CTL",
+		       "%s is not on a pipe, so the register cannot be read yet",
+		       igt_output_name(ctx->pr_output));
+
+		return ok;
+	}
+
+	ctx->pr_ctl = intel_register_read(&ctx->mmio,
+					  trans_dp2_ctl_offset(ctx->pr_conn->pipe));
+	/*
+	 * Bit 26 is stale until PR is active. Do not save it for restoration
+	 * with bit 30 clear; note_driver_pr_ctl() captures it after activation.
+	 */
+	ctx->pr_ctl_known = !!(ctx->pr_ctl & TRANS_DP2_PANEL_REPLAY_EN);
+
+	report(V_PASS, "TRANS_DP2_CTL",
+	       "pipe %s -> 0x%05x reads 0x%08x",
+	       kmstest_pipe_name(ctx->pr_conn->pipe),
+	       trans_dp2_ctl_offset(ctx->pr_conn->pipe), ctx->pr_ctl);
+
+	/*
+	 * Compare the full value with debugfs to catch a wrong transcoder.
+	 * A mismatch must prevent later register writes.
+	 */
+	{
+		uint32_t dbg = 0;
+
+		if (read_ctl_debugfs(ctx->debugfs_fd,
+				     igt_output_name(ctx->pr_output), &dbg)) {
+			if (dbg == ctx->pr_ctl) {
+				report(V_PASS, "register cross-check",
+				       "driver agrees: 0x%08x", dbg);
+			} else {
+				report(V_FAIL, "register cross-check",
+				       "MMIO says 0x%08x, driver says 0x%08x - wrong transcoder",
+				       ctx->pr_ctl, dbg);
+				ok = false;
+			}
+		} else {
+			report(V_WARN, "register cross-check",
+			       "driver does not report it right now (Panel Replay not the active mode)");
+		}
+	}
+
+	/*
+	 * This confirms only the startup pipe. Measurement paths repeat the
+	 * cross-check after committing the pipe assigned by prepare().
+	 */
+	if (!(ctx->pr_ctl & TRANS_DP2_PANEL_REPLAY_EN)) {
+		report(V_WARN, "PR active right now",
+		       "no - bit 30 clear; the measurement turns it on itself");
+	} else {
+		report(V_PASS, "PR active right now", "yes");
+	}
+
+	/*
+	 * With PR active, a driver-cleared bit 26 means the panel or dock
+	 * does not advertise the optimization.
+	 */
+	if (ctx->pr_ctl & TRANS_DP2_PANEL_REPLAY_EN) {
+		if (ctx->pr_ctl & TRANS_DP2_PR_TUNNELING_EN) {
+			report(V_PASS, "tunnelling optimization",
+			       "bit 26 set by the driver - there is something to measure");
+		} else {
+			report(V_FAIL, "tunnelling optimization",
+			       "bit 26 clear with Panel Replay active - this panel or dock does not advertise it");
+			ok = false;
+		}
+	}
+
+	return ok;
+}
+
+/*
+ * Only storage on the dock's PCIe tunnel is a suitable instrument.
+ * The CM protects USB bandwidth; a USB drive cannot expose the same shortage.
+ * Being separate from the boot drive does not establish which tunnel it uses.
+ */
+enum tunnel {
+	TUN_UNKNOWN,
+	TUN_STORAGE,		/* PCIe tunnel behind the dock - usable */
+	TUN_USB,		/* USB tunnel - the dock protects it */
+	TUN_INTERNAL,		/* not on the cable at all */
+};
+
+static const char *tunnel_name(enum tunnel t)
+{
+	switch (t) {
+	case TUN_STORAGE:
+		return "storage tunnel";
+	case TUN_USB:
+		return "USB tunnel";
+	case TUN_INTERNAL:
+		return "internal, not on the cable";
+	default:
+		return "unknown";
+	}
+}
+
+/*
+ * Classify the sysfs path: USB ancestry, or a removable PCI function behind
+ * the dock. Return a human-readable device description in @desc.
+ */
+static enum tunnel classify_block_dev(dev_t dev, char *desc, size_t desc_len)
+{
+	char sys[64], resolved[PATH_MAX], bdf[32], path[PATH_MAX];
+	char removable[32];
+	const char *last = NULL, *p;
+
+	snprintf(desc, desc_len, "dev %u:%u", major(dev), minor(dev));
+
+	snprintf(sys, sizeof(sys), "/sys/dev/block/%u:%u", major(dev),
+		 minor(dev));
+	if (!realpath(sys, resolved))
+		return TUN_UNKNOWN;
+
+	if (strstr(resolved, "/usb")) {
+		snprintf(desc, desc_len, "dev %u:%u, USB device",
+			 major(dev), minor(dev));
+		return TUN_USB;
+	}
+
+	/* Inspect the device's deepest PCI function, not an upstream bridge. */
+	for (p = resolved; (p = strstr(p, "/0000:")); p++)
+		last = p + 1;
+
+	if (!last)
+		return TUN_UNKNOWN;
+
+	snprintf(bdf, sizeof(bdf), "%.*s", (int)strcspn(last, "/"), last);
+	snprintf(desc, desc_len, "dev %u:%u, PCI %s", major(dev), minor(dev),
+		 bdf);
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/removable", bdf);
+	if (!read_file_str(path, removable, sizeof(removable)))
+		return TUN_INTERNAL;
+
+	return strcmp(removable, "removable") ? TUN_INTERNAL : TUN_STORAGE;
+}
+
+/*
+ * Require a separate mounted device. An unmounted directory may accept writes
+ * on the root filesystem, measuring the boot drive instead of cable traffic.
+ */
+static bool is_separate_mount(const char *dir, dev_t *dev)
+{
+	struct stat st, st_root, st_parent;
+	char parent[PATH_MAX];
+
+	if (stat(dir, &st) || stat("/", &st_root))
+		return false;
+
+	if (st.st_dev == st_root.st_dev)
+		return false;
+
+	/* A mount point differs in st_dev from its own parent directory. */
+	snprintf(parent, sizeof(parent), "%s/..", dir);
+	if (stat(parent, &st_parent) || st.st_dev == st_parent.st_dev)
+		return false;
+
+	*dev = st.st_dev;
+
+	return true;
+}
+
+/*
+ * Check that the mount accepts an O_DIRECT write open; transfer no data.
+ */
+static bool probe_writable(const char *dir, char *err, size_t err_len)
+{
+	char probe[PATH_MAX];
+	int fd;
+
+	snprintf(probe, sizeof(probe), "%.*s/.intel_pr_bw.probe",
+		 PATH_MAX - 32, dir);
+
+	fd = open(probe, O_WRONLY | O_CREAT | O_TRUNC | O_DIRECT, 0600);
+	if (fd < 0) {
+		snprintf(err, err_len, "%s", strerror(errno));
+		return false;
+	}
+	close(fd);
+	unlink(probe);
+
+	return true;
+}
+
+/*
+ * Distinguish a missing enclosure from one whose drives stopped answering,
+ * so the report recommends connection or recovery as appropriate.
+ */
+static bool nested_enclosure_present(char *who, size_t who_len)
+{
+	const char *base = "/sys/bus/thunderbolt/devices";
+	struct dirent *de;
+	bool found = false;
+	DIR *d;
+
+	d = opendir(base);
+	if (!d)
+		return false;
+
+	while (!found && (de = readdir(d))) {
+		const char *route = tbt_router_route(de->d_name);
+		char path[PATH_MAX], name[64] = "";
+
+		/*
+		 * Look for a longer router route, not a retimer name.
+		 * Retimers must not trigger enclosure recovery advice.
+		 */
+		if (!route || strlen(route) < 2)
+			continue;
+
+		snprintf(path, sizeof(path), "%s/%s/device_name", base,
+			 de->d_name);
+		read_file_str(path, name, sizeof(name));
+
+		snprintf(who, who_len, "%.32s (%.60s)", de->d_name, name);
+		found = true;
+	}
+	closedir(d);
+
+	return found;
+}
+
+/* One competing device. */
+struct agent {
+	char dir[PATH_MAX];
+	/* Room for dir plus the longest suffix appended below. */
+	char file[PATH_MAX + 32];
+	enum tunnel tunnel;
+	char desc[PATH_MAX];
+	uint64_t cap_bytes;
+	double deadline;
+	uint64_t bytes;
+	double secs;
+	int err;
+	pthread_t thread;
+};
+
+static struct agent agents[MAX_AGENTS];
+static int n_agents;
+
+/*
+ * Named agent files may need cleanup, including after interrupted writes.
+ * Read workers leave their sources in place; restore_state() removes them.
+ */
+static bool agent_files_live;
+
+/*
+ * Gate 3: find suitable storage on the cable.
+ * @probe creates/removes an empty file for write access; check passes false.
+ * Measuring commands also use agents_healthy() to probe actual transfers.
+ */
+static bool gate_storage(bool probe)
+{
+	const char *env = getenv("IGT_PR_BW_NVME_PATHS");
+	char enclosure[128] = "";
+	int n_usb = 0, n_bad = 0;
+	char *list, *tok, *save = NULL;
+
+	printf("\n== storage on the cable\n");
+
+	list = strdup(env ? env : DEFAULT_AGENT_PATHS);
+	if (!list) {
+		report(V_FAIL, "memory", "out of memory");
+		return false;
+	}
+
+	n_agents = 0;
+	for (tok = strtok_r(list, ",", &save); tok;
+	     tok = strtok_r(NULL, ",", &save)) {
+		char desc[PATH_MAX], err[128];
+		enum tunnel t;
+		dev_t dev;
+
+		if (n_agents == MAX_AGENTS) {
+			report(V_WARN, tok, "ignored - only %d disks are used",
+			       MAX_AGENTS);
+			continue;
+		}
+
+		if (!is_separate_mount(tok, &dev)) {
+			report(V_WARN, tok,
+			       "not a mount point on its own device - is the filesystem mounted?");
+			n_bad++;
+			continue;
+		}
+
+		t = classify_block_dev(dev, desc, sizeof(desc));
+
+		if (t != TUN_STORAGE) {
+			/*
+			 * Refuse unsuitable tunnels rather than measuring a
+			 * misleading flat response to video load.
+			 */
+			report(V_WARN, tok, "%s (%s) - cannot be used",
+			       tunnel_name(t), desc);
+			if (t == TUN_USB) {
+				report_hint("the dock protects the USB tunnel; "
+					    "it gets faster under video load, not slower");
+				n_usb++;
+			} else if (t == TUN_INTERNAL) {
+				report_hint("this device is not behind the Thunderbolt cable at all");
+			}
+			n_bad++;
+			continue;
+		}
+
+		if (probe && !probe_writable(tok, err, sizeof(err))) {
+			report(V_WARN, tok, "%s but not writable: %s",
+			       tunnel_name(t), err);
+			n_bad++;
+			continue;
+		}
+
+		report(V_PASS, tok, "%s (%s)%s", tunnel_name(t), desc,
+		       probe ? "" : " - writability not probed, nothing written");
+
+		snprintf(agents[n_agents].dir, sizeof(agents[0].dir), "%s", tok);
+		snprintf(agents[n_agents].desc, sizeof(agents[0].desc), "%s",
+			 desc);
+		agents[n_agents].tunnel = t;
+		n_agents++;
+	}
+	free(list);
+
+	if (n_agents) {
+		/*
+		 * One drive may saturate itself before exhausting cable
+		 * headroom, leaving no shortage for PR to relieve.
+		 */
+		if (n_agents < 2)
+			report(V_WARN, "usable disks",
+			       "%d - one drive may not be able to use up the leftover bandwidth on its own",
+			       n_agents);
+		else
+			report(V_PASS, "usable disks", "%d", n_agents);
+
+		return true;
+	}
+
+	/* Explain whether to attach, replace, or recover the instrument. */
+	if (n_usb) {
+		report(V_FAIL, "usable disks",
+		       "none - only USB drives were offered");
+		report_hint("attach NVMe behind the dock, on the PCIe tunnel");
+	} else if (nested_enclosure_present(enclosure, sizeof(enclosure))) {
+		report(V_FAIL, "usable disks",
+		       "none, but an enclosure is attached: %s", enclosure);
+		report_hint("its drives are not answering - power-cycle the enclosure, then re-mount by UUID");
+	} else {
+		report(V_FAIL, "usable disks",
+		       "none, and no enclosure is attached to the dock");
+		report_hint("set IGT_PR_BW_NVME_PATHS (default \"%s\")",
+			    DEFAULT_AGENT_PATHS);
+	}
+
+	return false;
+}
+
+/*
+ * Gate 4: find the reachable load range and gaps before measuring.
+ * Advertised modes may skip the narrow range where storage is cable-limited.
+ * This gate uses arithmetic only: no modesets or disk access.
+ */
+static bool gate_modes(struct display_ctx *ctx, struct fact pcie_reserved)
+{
+	int probe, lo = 0, hi = 0, prev = 0, biggest_gap = 0, gap_at = 0;
+	int first_filler = 0;
+	int reserved = pcie_reserved.known ? pcie_reserved.val : 0;
+	int pr_alone, leftover_mb, budget;
+	bool budget_exact;
+	int i;
+
+	budget = link_budget(&budget_exact);
+
+	printf("\n== reachable video loads%s\n",
+	       opts.custom_fill ? " (--custom-fill: modes synthesised)" : "");
+
+	parse_topology();
+
+	/*
+	 * Report whether fillers share the PR group and consume its budget.
+	 */
+	{
+		int pr_group = outs[pr_idx].group;
+		int n_same = 0, n_known = 0;
+
+		for (i = 0; i < n_out; i++) {
+			if (outs[i].group < 0)
+				continue;
+			n_known++;
+			if (i != pr_idx && outs[i].group == pr_group)
+				n_same++;
+		}
+
+		if (!n_known && !topo_saw_dptun) {
+			report(V_WARN, "tunnel groups",
+			       "unknown - no [DPTUN ] line in the log at all");
+			report_hint("needs drm.debug with DRM_UT_KMS (0x04) set before the last modeset");
+		} else if (!n_known) {
+			/*
+			 * Logging exists, but connector matching failed.
+			 * Enabling drm.debug again would not fix this.
+			 */
+			report(V_WARN, "tunnel groups",
+			       "unknown - [DPTUN ] lines exist but none matches a connector's encoder");
+			report_hint("group caps cannot be enforced; the load will be bounded by the cable alone");
+		} else if (n_out > 1 && !n_same) {
+			report(V_WARN, "tunnel groups",
+			       "the Panel Replay panel is alone in group %d - filler load may not squeeze its budget",
+			       pr_group);
+		} else {
+			report(V_PASS, "tunnel groups",
+			       "%d panel(s) share group %d with the Panel Replay panel, cap %d Mb/s",
+			       n_same, pr_group,
+			       pr_group >= 0 ? group_cap[pr_group] : 0);
+		}
+	}
+
+	/*
+	 * Choose the fixed PR load before probing any filler combinations.
+	 */
+	if (!pin_pr_output()) {
+		report(V_FAIL, "Panel Replay panel load",
+		       "no mode fits - cannot pin it");
+		return false;
+	}
+	pr_alone = pr_pin_bw;
+	report(V_PASS, "Panel Replay panel load",
+	       "%d Mb/s pinned at %dx%d@%d, %d bpc (held for the whole run)",
+	       pr_alone,
+	       outs[pr_idx].cand[pr_pin_cand].mode.hdisplay,
+	       outs[pr_idx].cand[pr_pin_cand].mode.vdisplay,
+	       outs[pr_idx].cand[pr_pin_cand].mode.vrefresh,
+	       eff_bpc(&outs[pr_idx], pr_pin_bpc));
+
+	/*
+	 * Report the panels left dark by custom fill; its range differs from
+	 * plain selection on larger rigs.
+	 */
+	if (opts.custom_fill && custom_fill_dark_panels()) {
+		report(V_WARN, "--custom-fill cost",
+		       "%d panel(s) stay dark - only one filler can be synthesised",
+		       custom_fill_dark_panels());
+		report_hint("the reachable range below is lower than a plain run's, and the two are not comparable");
+	}
+
+	/* Probe in granule steps without committing any modes. */
+	for (probe = pr_alone; probe <= opts.max_dp; probe += BW_GRANULE) {
+		int got, total = 0;
+
+		if (!(opts.custom_fill ? select_load_custom(probe)
+				       : select_load(probe)))
+			continue;
+
+		for (i = 0; i < n_out; i++)
+			total += outs[i].predicted;
+		got = total;
+
+		if (!lo)
+			lo = got;
+		if (got > hi)
+			hi = got;
+
+		if (!first_filler && got > pr_alone)
+			first_filler = got;
+
+		if (prev && got > prev && prev > pr_alone &&
+		    got - prev > biggest_gap) {
+			biggest_gap = got - prev;
+			gap_at = prev;
+		}
+		if (got > prev)
+			prev = got;
+	}
+
+	if (!hi) {
+		report(V_FAIL, "reachable loads",
+		       "none - no combination of modes fits under %d Mb/s",
+		       opts.max_dp);
+		return false;
+	}
+
+	report(V_PASS, "reachable loads", "%d to %d Mb/s (ceiling %d)", lo, hi,
+	       opts.max_dp);
+
+	/*
+	 * The first filler must meet CLOCK_MIN even with custom timings.
+	 * Report this unavoidable step separately from gaps above it.
+	 */
+	if (first_filler > 0) {
+		report(V_PASS, "smallest filler step",
+		       "%d -> %d Mb/s (%d Mb/s) - nothing smaller can exist, a filler that small needs a pixel clock no monitor accepts",
+		       pr_alone, first_filler, first_filler - pr_alone);
+	}
+
+	/*
+	 * Gaps above the first filler step can hide the contention range.
+	 * Custom fill can address these gaps, not the clock floor.
+	 */
+	if (biggest_gap > BW_GRANULE * 2) {
+		report(V_WARN, "biggest gap in the load range",
+		       "%d Mb/s, just above %d - a transition inside it cannot be reached",
+		       biggest_gap, gap_at);
+		if (!opts.custom_fill)
+			report_hint("--custom-fill synthesises a filler mode to hit a target exactly (but not above ~73000, see --help)");
+	} else {
+		report(V_PASS, "biggest gap in the load range",
+		       "%d Mb/s - fine enough to aim with", biggest_gap);
+	}
+
+	/*
+	 * Too much remaining headroom leaves the disks self-limited.
+	 * Estimate it here; throughput measurements establish contention.
+	 */
+	leftover_mb = (int)((budget - hi - reserved) / MIB_S_TO_MBIT_S);
+	report(leftover_mb > 0 ? V_PASS : V_WARN, "headroom at the top load",
+	       "%d Mb/s = %d MB/s left for the disks%s%s",
+	       budget - hi - reserved, leftover_mb,
+	       pcie_reserved.known ? "" : " (PCIe reservation unknown)",
+	       budget_exact ? "" :
+	       " (against the raw lane product, so an overestimate)");
+
+	if (leftover_mb > 2000) {
+		report(V_WARN, "can the disks be starved?",
+		       "probably not - %d MB/s of headroom is more than most NVMe pairs will use",
+		       leftover_mb);
+		report_hint("add another panel, or one with a higher-bandwidth mode, to push the load up");
+	}
+
+	/* Fatal findings returned early; warnings still permit measurement. */
+	return true;
+}
+
+/*
+ * Missing log evidence is neither a clean commit nor a failure.
+ * Keep unknown and all-dark states separate from checked BPC outcomes.
+ */
+enum bpp_check {
+	BPP_UNKNOWN,		/* the log could not tell us */
+	BPP_NA,			/* nothing was allocated, so nothing to check */
+	BPP_CLEAN,		/* the driver committed what was asked for */
+	BPP_LOWERED,		/* the driver reduced someone's colour depth */
+};
+
+static const char *bpp_check_name(enum bpp_check c)
+{
+	switch (c) {
+	case BPP_CLEAN:
+		return "committed as asked";
+	case BPP_LOWERED:
+		return "DRIVER LOWERED THE COLOUR DEPTH";
+	case BPP_NA:
+		return "n/a, every panel dark";
+	default:
+		return "could not be checked (drm.debug off?)";
+	}
+}
+
+struct commit_info {
+	struct fact group_alloc;
+	struct fact group_cap;
+	/*
+	 * Count announcements separately from their last value.
+	 * A quiet bit-only window has no allocation value to compare.
+	 */
+	int group_alloc_lines;
+	enum bpp_check bpp;
+	int retries;
+
+	/*
+	 * CM bookkeeping from thunderbolt.dyndbg=+p, with directions explicit.
+	 * DP upstream consumption is hard-coded zero; video uses downstream.
+	 */
+	struct fact dp_consumed_up, dp_consumed_down;
+	struct fact usb3_alloc_up, usb3_alloc_down;
+	struct fact pcie_reserved;
+	struct fact est_bw;
+	int cm_events;
+};
+
+static void kmsg_mark(const char *tag)
+{
+	igt_kmsg(KMSG_INFO "intel_pr_bw: MARK %s\n", tag);
+}
+
+/*
+ * Parse only the window after the latest marker, not a fixed-size log tail.
+ * If the marker has wrapped out, return unknowns instead of stale measurements.
+ */
+static void read_commit_info(struct commit_info *m)
+{
+	bool saw_dptun = false, saw_mark = false;
+	char line[1024];
+	FILE *f;
+
+	memset(m, 0, sizeof(*m));
+
+	f = popen("dmesg 2>/dev/null", "r");
+	if (!f) {
+		igt_warn("cannot run dmesg; commit read-back unavailable\n");
+		return;
+	}
+
+	while (fgets(line, sizeof(line), f)) {
+		char *p;
+		int a, b, c;
+
+		if (strstr(line, "intel_pr_bw: MARK ")) {
+			memset(m, 0, sizeof(*m));
+			saw_dptun = false;
+			saw_mark = true;
+			continue;
+		}
+
+		if (strstr(line, "[DPTUN "))
+			saw_dptun = true;
+
+		if (strstr(line, "Not enough BW"))
+			m->retries++;
+
+		/*
+		 * Count CM activity as well as values: a recalculation without
+		 * a modeset is itself relevant to the measurement.
+		 */
+		p = strstr(line, "(DP): consumed bandwidth ");
+		if (p && sscanf(p, "(DP): consumed bandwidth %d/%d",
+				&a, &b) == 2) {
+			m->dp_consumed_up = fact_known(a);
+			m->dp_consumed_down = fact_known(b);
+			m->cm_events++;
+		}
+
+		p = strstr(line, "(USB3): ");
+		if (p)
+			p = strstr(p, "bandwidth allocation to ");
+		if (p && sscanf(p, "bandwidth allocation to %d/%d", &a, &b) == 2) {
+			m->usb3_alloc_up = fact_known(a);
+			m->usb3_alloc_down = fact_known(b);
+			m->cm_events++;
+		}
+
+		/* Match read_pcie_reserved(): host router, downstream value. */
+		p = strstr(line, "reserving ");
+		if (p && strstr(line, "for PCIe") &&
+		    line_is_host_router(line) &&
+		    sscanf(p, "reserving %d/%d", &a, &b) == 2) {
+			m->pcie_reserved = fact_known(b);
+			m->cm_events++;
+		}
+
+		/*
+		 * Prefer the total after '='; that is what the dock advertises.
+		 * Older lines may contain only the initial estimate.
+		 */
+		p = strstr(line, "re-calculated estimated bandwidth ");
+		if (p && sscanf(p, "re-calculated estimated bandwidth %d (+ %d reserved) = %d",
+				&a, &b, &c) == 3) {
+			m->est_bw = fact_known(c);
+			m->cm_events++;
+		} else if (p && sscanf(p, "re-calculated estimated bandwidth %d",
+				       &a) == 1) {
+			m->est_bw = fact_known(a);
+			m->cm_events++;
+		}
+
+		if (strstr(line, "bandwidth allocation changed to"))
+			m->cm_events++;
+
+		p = strstr(line, "Group alloc:");
+		if (p && sscanf(p, "Group alloc:%d/%d", &a, &b) == 2) {
+			m->group_alloc = fact_known(a);
+			m->group_cap = fact_known(b);
+			m->group_alloc_lines++;
+		}
+	}
+	pclose(f);
+
+	/* No marker means no known measurement window. */
+	if (!saw_mark) {
+		igt_warn("no intel_pr_bw marker left in dmesg - the ring wrapped, so this commit's read-back is unknown. Boot with a larger log_buf_len.\n");
+		memset(m, 0, sizeof(*m));
+		m->bpp = BPP_UNKNOWN;
+
+		return;
+	}
+
+	/*
+	 * No DPTUN evidence means unknown, even when no retries were seen.
+	 */
+	if (!saw_dptun)
+		m->bpp = BPP_UNKNOWN;
+	else
+		m->bpp = m->retries ? BPP_LOWERED : BPP_CLEAN;
+}
+
+/*
+ * A width change invalidates every load and headroom calculation.
+ * Recheck during the run even though gate 1 requires lane switching disabled.
+ */
+static bool link_unchanged(const char *when)
+{
+	int now = read_link_downstream(NULL, 0);
+
+	if (now == g_link_down)
+		return true;
+
+	printf("\n*** the USB4 cable changed width %s: %d -> %d Mb/s.\n"
+	       "*** Every load level and every headroom figure was computed from the old width,\n"
+	       "*** so both are now wrong. Boot with thunderbolt.asym_threshold=0.\n\n",
+	       when, g_link_down, now);
+
+	return false;
+}
+
+/*
+ * Writes share video's host->dock direction; reads use the opposite lanes.
+ * Read runs control for changes unrelated to downstream cable contention.
+ */
+enum agent_op {
+	AGENT_WRITE,
+	AGENT_READ,
+};
+
+static enum agent_op agent_op = AGENT_WRITE;
+
+static void *agent_io(void *arg)
+{
+	struct agent *a = arg;
+	uint64_t off = 0;
+	double t0;
+	void *buf;
+	int fd;
+
+	a->err = 0;
+	a->secs = 0;
+	a->bytes = 0;
+
+	if (posix_memalign(&buf, 4096, IO_CHUNK)) {
+		a->err = ENOMEM;
+		return NULL;
+	}
+	memset(buf, 0xa5, IO_CHUNK);
+
+	/*
+	 * Bypass the page cache so the transfer measures storage, not DRAM.
+	 * Read runs use existing sources without creating or truncating them.
+	 */
+	if (agent_op == AGENT_READ)
+		fd = open(a->file, O_RDONLY | O_DIRECT);
+	else
+		fd = open(a->file, O_WRONLY | O_CREAT | O_TRUNC | O_DIRECT,
+			  0600);
+	if (fd < 0) {
+		a->err = errno;
+		free(buf);
+		return NULL;
+	}
+
+	t0 = now_sec();
+
+	while (now_sec() < a->deadline) {
+		ssize_t w;
+
+		if (off >= a->cap_bytes) {
+			off = 0;
+			if (lseek(fd, 0, SEEK_SET) == (off_t)-1) {
+				a->err = errno;
+				break;
+			}
+		}
+
+		if (agent_op == AGENT_READ)
+			w = read(fd, buf, IO_CHUNK);
+		else
+			w = write(fd, buf, IO_CHUNK);
+		if (w < 0) {
+			a->err = errno;
+			break;
+		}
+		if (!w) {
+			/*
+			 * EOF on a short source is not an errno failure.
+			 * Wrap nonempty files; empty ones report no data.
+			 */
+			if (!off)
+				break;
+
+			off = a->cap_bytes;
+			continue;
+		}
+		off += w;
+		a->bytes += w;
+	}
+
+	/*
+	 * End timing before fdatasync(): flushing may cost more in the starved
+	 * arm and bias the ratio. Keep the sync for error detection only.
+	 */
+	a->secs = now_sec() - t0;
+
+	if (agent_op == AGENT_WRITE && !a->err && fdatasync(fd))
+		a->err = errno;
+
+	close(fd);
+	if (agent_op == AGENT_WRITE)
+		unlink(a->file);
+	free(buf);
+
+	return NULL;
+}
+
+/*
+ * Run disks concurrently to a shared deadline and sum their individual rates.
+ * A byte-count limit would let faster disks finish early and reduce contention.
+ * @per receives individual rates when requested. On failure return -1; callers
+ * must stop and release the load rather than continue against a starved tunnel.
+ */
+static double run_agents(double *per)
+{
+	double deadline = now_sec() + opts.secs;
+	double total = 0;
+	int started = 0;
+	bool setup_ok = true;
+	int i;
+
+	for (i = 0; i < n_agents; i++) {
+		struct agent *a = &agents[i];
+
+		if (agent_op == AGENT_WRITE) {
+			snprintf(a->file, sizeof(a->file),
+				 "%.*s/.intel_pr_bw.%d.tmp", PATH_MAX - 32,
+				 a->dir, i);
+			a->cap_bytes = (uint64_t)opts.write_mb << 20;
+			a->cap_bytes -= a->cap_bytes % IO_CHUNK;
+			if (!a->cap_bytes)
+				a->cap_bytes = IO_CHUNK;
+			/*
+			 * Register the file before starting its worker so
+			 * restore_state() can remove it after an interruption.
+			 */
+			agent_files_live = true;
+		}
+		if (agent_op == AGENT_READ && !a->file[0]) {
+			igt_warn("no read source file for %s yet; "
+				 "prepare_read_files() has to run first\n",
+				 a->dir);
+			setup_ok = false;
+			break;
+		}
+
+		a->deadline = deadline;
+
+		if (pthread_create(&a->thread, NULL, agent_io, a)) {
+			igt_warn("cannot start a thread for %s\n", a->dir);
+			setup_ok = false;
+			break;
+		}
+		started++;
+	}
+
+	/*
+	 * Join every started worker, including after setup failure.
+	 * Workers must not race load release, file reuse, or agent counters.
+	 */
+	for (i = 0; i < started; i++)
+		pthread_join(agents[i].thread, NULL);
+
+	if (!setup_ok)
+		return -1;
+
+	for (i = 0; i < n_agents; i++) {
+		struct agent *a = &agents[i];
+		double mbps;
+
+		if (a->err || a->secs <= 0 || !a->bytes) {
+			igt_warn("disk %s (%s) failed: %s - the storage tunnel has been starved past viability\n",
+				 a->dir,
+				 tunnel_name(a->tunnel),
+				 a->err ? strerror(a->err) : "moved nothing");
+			return -1;
+		}
+
+		mbps = (a->bytes / (1024.0 * 1024.0)) / a->secs;
+		total += mbps;
+		if (per)
+			per[i] = mbps;
+	}
+
+	return total;
+}
+
+/* Lay down the files a read run will consume, once, before any measurement. */
+static bool prepare_read_files(void)
+{
+	int i;
+
+	printf("laying down read source files (%d MB each)\n", opts.write_mb);
+
+	/* Register cleanup before creating anything; partial setup can fail. */
+	agent_files_live = true;
+
+	for (i = 0; i < n_agents; i++) {
+		struct agent *a = &agents[i];
+		uint64_t written = 0;
+		void *buf;
+		int fd;
+
+		snprintf(a->file, sizeof(a->file),
+			 "%.*s/.intel_pr_bw.src.%d", PATH_MAX - 32, a->dir, i);
+		a->cap_bytes = (uint64_t)opts.write_mb << 20;
+		a->cap_bytes -= a->cap_bytes % IO_CHUNK;
+		if (!a->cap_bytes)
+			a->cap_bytes = IO_CHUNK;
+
+		if (posix_memalign(&buf, 4096, IO_CHUNK))
+			return false;
+		memset(buf, 0x3c, IO_CHUNK);
+
+		fd = open(a->file, O_WRONLY | O_CREAT | O_TRUNC | O_DIRECT,
+			  0600);
+		if (fd < 0) {
+			igt_warn("cannot create %s: %s\n", a->file,
+				 strerror(errno));
+			free(buf);
+			return false;
+		}
+
+		while (written < a->cap_bytes) {
+			ssize_t w = write_full(fd, buf, IO_CHUNK);
+
+			if (w != IO_CHUNK) {
+				igt_warn("short write laying down %s: %s\n",
+					 a->file,
+					 w < 0 ? strerror(errno) : "truncated");
+				close(fd);
+				free(buf);
+				return false;
+			}
+			written += w;
+		}
+		if (fdatasync(fd))
+			igt_warn("fdatasync on %s: %s\n", a->file,
+				 strerror(errno));
+		close(fd);
+		free(buf);
+	}
+
+	return true;
+}
+
+static void remove_agent_files(void)
+{
+	int i;
+
+	if (!agent_files_live)
+		return;
+
+	for (i = 0; i < n_agents; i++) {
+		if (agents[i].file[0])
+			unlink(agents[i].file);
+	}
+
+	agent_files_live = false;
+}
+
+/*
+ * Probe an O_DIRECT transfer before measuring and after a suspected failure.
+ * A dead tunnel must not become a throughput result.
+ */
+static bool agents_healthy(void)
+{
+	char path[PATH_MAX + 32];
+	void *buf;
+	int i;
+
+	if (posix_memalign(&buf, 4096, IO_CHUNK))
+		return false;
+	memset(buf, 0x5a, IO_CHUNK);
+
+	for (i = 0; i < n_agents; i++) {
+		ssize_t w;
+		int fd;
+
+		snprintf(path, sizeof(path), "%.*s/.intel_pr_bw.health",
+			 PATH_MAX - 32, agents[i].dir);
+
+		fd = open(path, O_WRONLY | O_CREAT | O_TRUNC | O_DIRECT, 0600);
+		if (fd < 0) {
+			igt_warn("disk %s is not writable: %s\n",
+				 agents[i].dir, strerror(errno));
+			free(buf);
+			return false;
+		}
+
+		w = write_full(fd, buf, IO_CHUNK);
+		close(fd);
+		unlink(path);
+
+		if (w != IO_CHUNK) {
+			igt_warn("disk %s failed a %d byte probe write: %s\n",
+				 agents[i].dir, IO_CHUNK,
+				 w < 0 ? strerror(errno) : "short write");
+			free(buf);
+			return false;
+		}
+	}
+
+	free(buf);
+
+	return true;
+}
+
+static igt_display_t *disp;
+static int g_drm_fd = -1;
+static int g_debugfs_fd = -1;
+
+/*
+ * Track a lit commit whose video allocation must be released on exit.
+ */
+static bool load_committed;
+
+/* Clamp a requested video load to the safety ceiling and report it. */
+static int clamp_dp(int desired)
+{
+	if (desired > opts.max_dp) {
+		printf("  requested video load %d Mb/s exceeds the %d Mb/s safety ceiling; clamping (raise with --max-dp)\n",
+		       desired, opts.max_dp);
+		return opts.max_dp;
+	}
+
+	return desired;
+}
+
+/*
+ * Use the PR panel's assigned CRTC, falling back to its startup pipe.
+ * The register must follow this tool's pipe assignment, not an old mapping.
+ */
+static uint32_t pr_ctl_offset(void)
+{
+	const struct out_state *pr = &outs[pr_idx];
+
+	if (pr->crtc)
+		return trans_dp2_ctl_offset(pr->crtc->pipe);
+
+	return trans_dp2_ctl_offset(pr->conn->pipe);
+}
+
+/*
+ * Force a full modeset by turning every pipe off before applying the selection.
+ * Fastsets may leave PR registers unchanged from the previous configuration.
+ */
+static int apply_load(void)
+{
+	int i, ret;
+
+	igt_display_reset(disp);
+	ret = igt_display_try_commit_atomic(disp, DRM_MODE_ATOMIC_ALLOW_MODESET,
+					    NULL);
+	if (ret)
+		return ret;
+	usleep(200000);
+
+	igt_display_reset(disp);
+
+	for (i = 0; i < n_out; i++) {
+		struct out_state *o = &outs[i];
+		drmModeModeInfo *mode;
+		igt_plane_t *plane;
+
+		if (o->fb_valid) {
+			igt_remove_fb(g_drm_fd, &o->fb);
+			o->fb_valid = false;
+		}
+
+		if (o->sel_cand < 0)
+			continue;
+
+		mode = &o->cand[o->sel_cand].mode;
+
+		igt_output_set_crtc(o->output, o->crtc);
+		igt_output_override_mode(o->output, mode);
+
+		if (igt_output_has_prop(o->output, IGT_CONNECTOR_MAX_BPC))
+			igt_output_set_prop_value(o->output,
+						  IGT_CONNECTOR_MAX_BPC,
+						  o->sel_bpc);
+
+		igt_create_color_fb(g_drm_fd, mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    0.1 * (i + 1), 0.2, 0.3, &o->fb);
+		o->fb_valid = true;
+
+		plane = igt_crtc_get_plane_type(o->crtc, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(plane, &o->fb);
+	}
+
+	kmsg_mark("commit");
+	ret = igt_display_try_commit_atomic(disp,
+					    DRM_MODE_ATOMIC_ALLOW_MODESET,
+					    NULL);
+	if (!ret) {
+		load_committed = false;
+		for (i = 0; i < n_out; i++) {
+			if (outs[i].sel_cand >= 0) {
+				load_committed = true;
+				break;
+			}
+		}
+	}
+
+	/* Let the driver finish allocating and logging. */
+	usleep(600000);
+
+	return ret;
+}
+
+/*
+ * Release video bandwidth before unwinding an I/O failure.
+ * Keeping the load applied can turn a recoverable error into a dead controller.
+ * Wait for the dock and sync outstanding I/O before further recovery checks.
+ */
+static void relieve_load(void)
+{
+	int i, ret;
+
+	printf("  releasing the video load so the tunnel gets its share back\n");
+
+	for (i = 0; i < n_out; i++)
+		apply_choice(&outs[i], 0);
+
+	ret = apply_load();
+	if (ret)
+		igt_warn("all-dark commit failed while relieving: %s\n",
+			 strerror(-ret));
+
+	/* The dock re-advertises tunnel bandwidth asynchronously. */
+	sleep(2);
+	sync();
+}
+
+/*
+ * A group allocation matches the whole-rig target only when all lit outputs
+ * belong to one known group.
+ */
+static bool alloc_covers_target(void)
+{
+	int grp = -1, i;
+
+	for (i = 0; i < n_out; i++) {
+		if (outs[i].sel_cand < 0)
+			continue;
+		if (outs[i].group < 0)
+			return false;
+		if (grp < 0)
+			grp = outs[i].group;
+		else if (outs[i].group != grp)
+			return false;
+	}
+
+	return grp >= 0;
+}
+
+/*
+ * Commit, read back the allocation, and correct undershoot when comparable.
+ * Clamp every correction to the safety ceiling, not just the initial request.
+ */
+static bool set_load(int desired, bool converge, struct fact *alloc_out,
+		     int *pred_out, struct commit_info *m_out)
+{
+	struct commit_info m;
+	int target, next, predicted = 0;
+	int i, ret, iter;
+
+	*alloc_out = fact_unknown();
+	*pred_out = 0;
+
+	if (!desired) {
+		for (i = 0; i < n_out; i++)
+			apply_choice(&outs[i], 0);
+
+		ret = apply_load();
+		if (ret) {
+			printf("  all-dark commit failed: %s\n",
+			       strerror(-ret));
+			return false;
+		}
+
+		read_commit_info(&m);
+		/* An all-dark commit has no colour depth to check. */
+		m.bpp = BPP_NA;
+		*alloc_out = m.group_alloc.known ? m.group_alloc :
+						   fact_known(0);
+		if (m_out)
+			*m_out = m;
+
+		return true;
+	}
+
+	target = desired;
+
+	for (iter = 0; iter < 4; iter++) {
+		if (!(opts.custom_fill ? select_load_custom(target)
+				       : select_load(target))) {
+			printf("  %d Mb/s: no configuration fits\n", desired);
+			return false;
+		}
+
+		predicted = 0;
+		for (i = 0; i < n_out; i++)
+			predicted += outs[i].predicted;
+
+		ret = apply_load();
+		if (ret) {
+			printf("  %d Mb/s: commit failed: %s\n", desired,
+			       strerror(-ret));
+			return false;
+		}
+
+		read_commit_info(&m);
+
+		if (m.bpp == BPP_LOWERED)
+			printf("  %d Mb/s: the driver retried %d time(s) and lowered the colour depth, so the committed load is below target\n",
+			       desired, m.retries);
+
+		if (!converge || !m.group_alloc.known ||
+		    m.group_alloc.val >= desired - BW_GRANULE)
+			break;
+
+		/*
+		 * The read-back covers one group; @desired covers all outputs.
+		 * Correct only for a shared known group, or other groups'
+		 * allocations would look like a shortfall and hit the ceiling.
+		 */
+		if (!alloc_covers_target()) {
+			printf("  %d Mb/s: the lit outputs span more than one tunnel group, so the group allocation read-back is not comparable with the target; committing %d Mb/s uncorrected\n",
+			       desired, predicted);
+			break;
+		}
+
+		next = target + (desired - m.group_alloc.val);
+		if (next > opts.max_dp) {
+			printf("  %d Mb/s: correction to %d Mb/s clipped at the %d Mb/s safety ceiling\n",
+			       desired, next,
+			       opts.max_dp);
+			next = opts.max_dp;
+		}
+		if (next <= target)
+			break;		/* no headroom left to correct with */
+
+		target = next;
+	}
+
+	*alloc_out = m.group_alloc;
+	*pred_out = predicted;
+	if (m_out)
+		*m_out = m;
+
+	return true;
+}
+
+/*
+ * Recheck PR after modesets, which can undo psr_disable().
+ * Treat an absent debugfs control line as off here; accounting uses MMIO.
+ * @ctl_out receives the reported value when available.
+ */
+static bool pr_still_off(uint32_t *ctl_out)
+{
+	uint32_t ctl = 0;
+
+	if (!read_ctl_debugfs(g_debugfs_fd, igt_output_name(outs[pr_idx].output),
+			      &ctl))
+		return true;
+
+	if (ctl_out)
+		*ctl_out = ctl;
+
+	return !(ctl & TRANS_DP2_PANEL_REPLAY_EN);
+}
+
+static void print_modes(void)
+{
+	int i;
+
+	for (i = 0; i < n_out; i++) {
+		struct out_state *o = &outs[i];
+
+		if (o->sel_cand < 0) {
+			printf("           %-8s dark\n",
+			       igt_output_name(o->output));
+			continue;
+		}
+		printf("           %-8s %dx%d@%d %d kHz %d bpc -> %d Mb/s%s\n",
+		       igt_output_name(o->output),
+		       o->cand[o->sel_cand].mode.hdisplay,
+		       o->cand[o->sel_cand].mode.vdisplay,
+		       o->cand[o->sel_cand].mode.vrefresh,
+		       o->cand[o->sel_cand].clock,
+		       eff_bpc(o, o->sel_bpc), o->predicted,
+		       i == pr_idx ? "  (Panel Replay panel)" : "");
+	}
+}
+
+static struct display_ctx ctx = { .drm_fd = -1, .debugfs_fd = -1 };
+
+/*
+ * Restore bit 26 only after this tool has written it; clear after restoration.
+ * In particular, check must not write MMIO during cleanup.
+ */
+static bool pr_bit_written;
+
+/*
+ * Capture the driver value after activation if startup could not supply it.
+ * Save it before this tool changes bit 26 so cleanup has a value to restore.
+ */
+static void note_driver_pr_ctl(uint32_t val)
+{
+	if (ctx.pr_ctl_known)
+		return;
+
+	ctx.pr_ctl = val;
+	ctx.pr_ctl_known = true;
+}
+
+/*
+ * Clean up normal exits, IGT skips, and signals.
+ * This must be idempotent: finish() and the exit handler both call it.
+ * @sig is zero on normal exit and guards operations unsafe in signal context.
+ */
+static void restore_state(int sig)
+{
+	int i;
+
+	/* Restore only bit 26, using its saved driver value. */
+	if (pr_bit_written && ctx.mmio_ready && ctx.pr_ctl_known && pr_idx >= 0) {
+		uint32_t off = pr_ctl_offset();
+		uint32_t val = intel_register_read(&ctx.mmio, off);
+
+		val &= ~TRANS_DP2_PR_TUNNELING_EN;
+		val |= ctx.pr_ctl & TRANS_DP2_PR_TUNNELING_EN;
+		intel_register_write(&ctx.mmio, off, val);
+		pr_bit_written = false;
+	}
+
+	/*
+	 * Library skips may bypass explicit load release. On normal exit,
+	 * release and settle before dropping resources. In signal context,
+	 * avoid atomic commits and rely on framebuffer removal below.
+	 */
+	if (!sig && load_committed && disp && g_drm_fd >= 0)
+		relieve_load();
+
+	remove_agent_files();
+
+	if (disp && g_drm_fd >= 0) {
+		for (i = 0; i < n_out; i++) {
+			if (outs[i].fb_valid) {
+				igt_remove_fb(g_drm_fd, &outs[i].fb);
+				outs[i].fb_valid = false;
+			}
+		}
+	}
+}
+
+/*
+ * Use IGT's exit hooks so normal and signal cleanup run alongside VT restore.
+ * A private signal handler could skip those hooks and leave the console blank.
+ */
+static void pr_bw_exit_handler(int sig)
+{
+	static const char msg[] =
+		"\n*** interrupted - restoring the display state\n";
+
+	if (sig) {
+		/*
+		 * IGT calls this directly from signal context.
+		 * Use write(), not stdio, to avoid a stream-lock deadlock.
+		 */
+		ssize_t ignored = write(STDERR_FILENO, msg, sizeof(msg) - 1);
+
+		(void)ignored;
+	}
+
+	restore_state(sig);
+}
+
+/*
+ * Run the gates before taking DRM master and assigning pipes.
+ * Unlike check, measuring commands will change the display state.
+ */
+static void prepare(bool need_disks)
+{
+	igt_crtc_t *crtc;
+	int i = 0;
+
+	if (!gate_software())
+		igt_skip("the software settings above rule out a measurement\n");
+
+	if (!gate_display(&ctx))
+		igt_skip("the displays above rule out a measurement\n");
+
+	if (need_disks && !gate_storage(true))
+		igt_skip("no disk on the cable can act as the instrument\n");
+
+	if (!gate_modes(&ctx, g_pcie_reserved))
+		igt_skip("this rig cannot reach a useful video load\n");
+
+	g_drm_fd = ctx.drm_fd;
+	g_debugfs_fd = ctx.debugfs_fd;
+	disp = &ctx.display;
+	agent_op = opts.read_agents ? AGENT_READ : AGENT_WRITE;
+
+	igt_install_exit_handler(pr_bw_exit_handler);
+
+	if (drmSetMaster(g_drm_fd))
+		igt_skip("cannot take DRM master (%s) - stop the desktop session first\n",
+			 strerror(errno));
+
+	kmstest_set_vt_graphics_mode();
+
+	/*
+	 * Keep PR on its startup pipe when available, preserving the offset
+	 * checked by gate_display(). Assign other pipes in enumeration order.
+	 */
+	if (outs[pr_idx].conn->pipe >= 0) {
+		for_each_crtc(disp, crtc) {
+			if ((int)crtc->pipe == outs[pr_idx].conn->pipe) {
+				outs[pr_idx].crtc = crtc;
+				break;
+			}
+		}
+	}
+
+	for_each_crtc(disp, crtc) {
+		if (crtc == outs[pr_idx].crtc)
+			continue;
+		while (i < n_out && outs[i].crtc)
+			i++;
+		if (i == n_out)
+			break;
+		outs[i++].crtc = crtc;
+	}
+
+	for (i = 0; i < n_out; i++) {
+		if (!outs[i].crtc)
+			igt_skip("only %d pipe(s) for %d panels\n", i, n_out);
+	}
+
+	/*
+	 * Record the assigned pipe and offset. Measurement paths recheck the
+	 * full register against debugfs after committing.
+	 */
+	printf("Panel Replay panel %s on pipe %s, TRANS_DP2_CTL 0x%05x\n",
+	       igt_output_name(outs[pr_idx].output),
+	       kmstest_pipe_name(outs[pr_idx].crtc->pipe), pr_ctl_offset());
+
+	printf("\n");
+}
+
+static void finish(void)
+{
+	restore_state(0);
+
+	/*
+	 * Invalidate released resources: the exit hook calls restore_state()
+	 * again and must not reuse a closed fd or MMIO mapping.
+	 */
+	if (ctx.mmio_ready) {
+		intel_register_access_fini(&ctx.mmio);
+		ctx.mmio_ready = false;
+	}
+	if (ctx.debugfs_fd >= 0) {
+		close(ctx.debugfs_fd);
+		ctx.debugfs_fd = -1;
+		g_debugfs_fd = -1;
+	}
+	if (ctx.drm_fd >= 0) {
+		if (ctx.display_ready) {
+			igt_display_fini(&ctx.display);
+			ctx.display_ready = false;
+		}
+		disp = NULL;
+		drm_close_driver(ctx.drm_fd);
+		ctx.drm_fd = -1;
+		g_drm_fd = -1;
+	}
+}
+
+/* Percentage steps of the cable, used when no explicit targets are given. */
+static const int sweep_pct[] = { 0, 25, 50, 65, 75, 85, 90 };
+
+/*
+ * Find loads where storage throughput follows cable headroom, not disk speed.
+ * Keep PR off and compare each level with an all-dark baseline.
+ */
+static int cmd_sweep(void)
+{
+	double base = 0, base_per[MAX_AGENTS] = { 0 };
+	int level[MAX_TARGETS], n_level;
+	struct out_state *pr;
+	int i, j, rc = 0;
+
+	prepare(true);
+	pr = &outs[pr_idx];
+
+	/*
+	 * Use explicit targets or budget percentages, with an all-dark baseline
+	 * first so every later rate has a reference.
+	 */
+	if (opts.n_targets) {
+		n_level = 0;
+		if (opts.targets[0] != 0)
+			level[n_level++] = 0;
+		for (i = 0; i < opts.n_targets && n_level < MAX_TARGETS; i++)
+			level[n_level++] = opts.targets[i];
+	} else {
+		n_level = (int)ARRAY_SIZE(sweep_pct);
+		for (i = 0; i < n_level; i++)
+			level[i] = (int)((int64_t)link_budget(NULL) *
+					 sweep_pct[i] / 100);
+	}
+
+	/*
+	 * Keep the first occurrence of each clamped load to avoid repeated
+	 * modesets, measurements, and notices for equivalent targets.
+	 */
+	{
+		int kept = 0;
+
+		for (i = 0; i < n_level; i++) {
+			int seen, v = level[i] > opts.max_dp ? opts.max_dp :
+							       level[i];
+
+			for (seen = 0; seen < kept; seen++) {
+				if (level[seen] == v)
+					break;
+			}
+			if (seen == kept)
+				level[kept++] = v;
+		}
+		if (kept != n_level)
+			printf("(%d of %d requested levels were duplicates once clamped to the %d Mb/s ceiling, and were dropped)\n",
+			       n_level - kept, n_level,
+			       opts.max_dp);
+		n_level = kept;
+	}
+
+	if (!agents_healthy())
+		igt_skip("a disk is already unwritable before the sweep starts; "
+			 "recover the storage first\n");
+
+	/*
+	 * psr_disable() may exit 77 inside IGT rather than return false.
+	 * The exit hook must handle that path. Check the actual PR state after
+	 * modesets with pr_still_off(), regardless of this return value.
+	 */
+	if (!psr_disable(g_drm_fd, g_debugfs_fd, pr->output)) {
+		printf("could not switch Panel Replay off on %s, so it would be a variable in this sweep\n",
+		       igt_output_name(pr->output));
+		rc = 98;
+		goto out;
+	}
+
+	printf("Contention sweep: Panel Replay held OFF throughout%s.\n",
+	       opts.custom_fill ? ", filler modes synthesised" : "");
+	printf("cable %d Mb/s raw, %d Mb/s usable = %.0f MB/s, of which %s Mb/s is held back for PCIe\n",
+	       g_link_down, link_budget(NULL),
+	       link_budget(NULL) / MIB_S_TO_MBIT_S,
+	       fact_str(g_pcie_reserved));
+	printf("%d disk(s), %.1fs each, %s\n\n", n_agents, opts.secs,
+	       agent_op == AGENT_READ ? "READING" : "WRITING");
+
+	if (agent_op == AGENT_READ && !prepare_read_files()) {
+		rc = 98;
+		goto out;
+	}
+
+	for (i = 0; i < n_level; i++) {
+		double per[MAX_AGENTS] = { 0 }, tot;
+		struct commit_info m;
+		struct fact alloc;
+		int pred = 0, avail;
+		uint32_t ctl = 0;
+
+		/*
+		 * Converge explicit targets too, as ab does. Otherwise the A/B
+		 * may apply more load than this sweep proved survivable.
+		 */
+		if (!set_load(clamp_dp(level[i]), true, &alloc, &pred, &m)) {
+			/*
+			 * Stop if the first, all-dark commit fails.
+			 * Every later row depends on its baseline rate.
+			 */
+			if (!i) {
+				printf("  the all-dark baseline could not be committed, so nothing in this sweep can be interpreted; stopping\n");
+				rc = 98;
+				break;
+			}
+			continue;
+		}
+
+		if (!pr_still_off(&ctl)) {
+			printf("  Panel Replay came back on mid-sweep (TRANS_DP2_CTL 0x%08x); stopping\n",
+			       ctl);
+			rc = 98;
+			break;
+		}
+
+		printf("  video asked %6d Mb/s, allocated %6s (predicted %6d), colour depth %s:\n",
+		       level[i], fact_str(alloc), pred,
+		       bpp_check_name(m.bpp));
+
+		/* Record the load before any disk can fail. */
+		print_modes();
+
+		/* Discard a pass for drive-cache and thermal settling. */
+		if (!i) {
+			double warm = run_agents(NULL);
+
+			if (warm < 0) {
+				printf("  the warm-up pass itself failed, with no video load at all; the storage is broken rather than starved\n");
+				rc = 98;
+				break;
+			}
+			printf("  warm-up: %.1f MB/s (discarded)\n", warm);
+		}
+
+		tot = run_agents(per);
+		if (tot < 0) {
+			printf("  disk I/O failed at %s Mb/s allocated; "
+			       "stopping here\n", fact_str(alloc));
+			relieve_load();
+			if (!agents_healthy()) {
+				printf("  a disk did not recover after the load was released, so its tunnel is down rather than merely starved. Do not raise --max-dp past %s Mb/s on this rig.\n",
+				       fact_str(alloc));
+				rc = 98;
+			}
+			break;
+		}
+
+		if (!link_unchanged("during a sweep level")) {
+			rc = 98;
+			break;
+		}
+
+		if (!i) {
+			base = tot;
+			memcpy(base_per, per, sizeof(base_per));
+		}
+
+		/*
+		 * Compare throughput with budget minus video and PCIe reserves.
+		 * Use predicted video load only if its allocation is unknown.
+		 */
+		avail = link_budget(NULL) - (alloc.known ? alloc.val : pred) -
+			(g_pcie_reserved.known ? g_pcie_reserved.val : 0);
+		if (avail < 0)
+			avail = 0;
+
+		printf("           %6d Mb/s left for non-video = %5.0f MB/s\n",
+		       avail, avail / MIB_S_TO_MBIT_S);
+
+		for (j = 0; j < n_agents; j++)
+			printf("           disk %s %7.1f MB/s  (%.3f x its no-video rate)\n",
+			       agents[j].dir, per[j],
+			       base_per[j] > 0 ? per[j] / base_per[j] : 0.0);
+
+		printf("           TOTAL %10.1f MB/s  (%.3f x the no-video rate) -> %s\n\n",
+		       tot, base > 0 ? tot / base : 0.0,
+		       avail / MIB_S_TO_MBIT_S < base ? "CABLE-LIMITED" :
+							"disk-limited");
+	}
+
+	printf("A level is only useful if TOTAL tracks the \"left for non-video\" figure rather\n"
+	       "than the no-video rate. That is the regime where freeing video bandwidth can\n"
+	       "show up at all. If TOTAL stays near the no-video rate the disks are limited by\n"
+	       "themselves and the A/B has nothing to detect.\n");
+
+out:
+	finish();
+
+	return rc;
+}
+
+static void stats(const double *v, int n, double *lo, double *med, double *hi)
+{
+	double tmp[MAX_REPS];
+	int i, j;
+
+	memcpy(tmp, v, n * sizeof(*v));
+	for (i = 1; i < n; i++) {
+		double key = tmp[i];
+
+		for (j = i - 1; j >= 0 && tmp[j] > key; j--)
+			tmp[j + 1] = tmp[j];
+		tmp[j + 1] = key;
+	}
+
+	*lo = tmp[0];
+	*hi = tmp[n - 1];
+	*med = n & 1 ? tmp[n / 2] : (tmp[n / 2 - 1] + tmp[n / 2]) / 2;
+}
+
+static double spread_pct(double lo, double med, double hi)
+{
+	return med > 0 ? 100.0 * (hi - lo) / med : 0.0;
+}
+
+/*
+ * Contention requires both slower throughput than all-dark and a small spread.
+ * No shortage is a valid control; failed setup is unknown; dead disks require
+ * stopping immediately. Keep these outcomes separate.
+ */
+struct contention {
+	double base;
+	double med, lo, hi;
+	bool slower;
+	bool steady;
+};
+
+enum shortage {
+	SHORTAGE_YES,		/* slower and steady: the cable is the limit */
+	SHORTAGE_NONE,		/* measured, but disk-limited */
+	SHORTAGE_UNKNOWN,	/* the load could not be set up */
+	SHORTAGE_DISKS_DEAD,	/* the disks failed; stop, do not measure */
+};
+
+#define CONTENTION_REPS		3
+#define STEADY_PCT		5.0
+#define SLOWER_RATIO		0.90
+
+/* Allow the dock to react to bit 26 before measuring throughput. */
+#define ARM_SETTLE_SECS		1
+
+static enum shortage prove_contention(int target, struct contention *c)
+{
+	double v[CONTENTION_REPS];
+	struct fact alloc;
+	int pred, i;
+
+	memset(c, 0, sizeof(*c));
+
+	printf("== is there a bandwidth shortage at %d Mb/s?\n", target);
+
+	/*
+	 * Probe with PR off, the tightest case. PR already freeing bandwidth
+	 * could hide the shortage and leave the disks self-limited.
+	 */
+	if (!psr_disable(g_drm_fd, g_debugfs_fd, outs[pr_idx].output)) {
+		report(V_WARN, "baseline",
+		       "could not switch Panel Replay off, so this probe would not be measuring the tightest case");
+		return SHORTAGE_UNKNOWN;
+	}
+
+	/* With every panel dark: what the disks can do unhindered. */
+	if (!set_load(0, false, &alloc, &pred, NULL)) {
+		report(V_WARN, "baseline", "all-dark commit failed");
+		return SHORTAGE_UNKNOWN;
+	}
+
+	run_agents(NULL);			/* warm-up, discarded */
+	c->base = run_agents(NULL);
+	if (c->base < 0) {
+		report(V_FAIL, "baseline", "disk I/O failed with no video load");
+		return SHORTAGE_DISKS_DEAD;
+	}
+	report(V_PASS, "with no video", "%.1f MB/s", c->base);
+
+	if (!set_load(target, true, &alloc, &pred, NULL)) {
+		report(V_WARN, "under load", "no configuration fits %d Mb/s",
+		       target);
+		return SHORTAGE_UNKNOWN;
+	}
+
+	/*
+	 * Both load changes can re-enable PR. Confirm it stayed off before
+	 * interpreting the loaded samples.
+	 */
+	if (!pr_still_off(NULL)) {
+		report(V_WARN, "baseline",
+		       "Panel Replay came back on across the probe's modesets, so this is not the tightest case");
+		return SHORTAGE_UNKNOWN;
+	}
+
+	for (i = 0; i < CONTENTION_REPS; i++) {
+		v[i] = run_agents(NULL);
+		if (v[i] < 0) {
+			report(V_FAIL, "under load",
+			       "disk I/O failed - the tunnel is starved past viability");
+			relieve_load();
+			return SHORTAGE_DISKS_DEAD;
+		}
+	}
+	stats(v, CONTENTION_REPS, &c->lo, &c->med, &c->hi);
+
+	c->slower = c->med < c->base * SLOWER_RATIO;
+	c->steady = spread_pct(c->lo, c->med, c->hi) <= STEADY_PCT;
+
+	report(c->slower ? V_PASS : V_WARN, "under video load",
+	       "%.1f MB/s = %.3f x the no-video rate", c->med,
+	       c->base > 0 ? c->med / c->base : 0.0);
+	report(c->steady ? V_PASS : V_WARN, "steadiness",
+	       "%.1f%% spread over %d runs - %s",
+	       spread_pct(c->lo, c->med, c->hi), CONTENTION_REPS,
+	       c->steady ? "the cable is the limit" :
+			   "the disks are their own limit");
+
+	return c->slower && c->steady ? SHORTAGE_YES : SHORTAGE_NONE;
+}
+
+/* Both halves of the A/B need Panel Replay back on afterwards. */
+static bool contention_done(void)
+{
+	return psr_enable(g_drm_fd, g_debugfs_fd, PR_MODE_SEL_FETCH,
+			  outs[pr_idx].output);
+}
+
+/*
+ * Keep PR active and toggle only bit 26 to avoid changing display fetch,
+ * power, and memory traffic between halves. Re-read the full register after
+ * each arm and reject samples if the driver reprogrammed it.
+ */
+static void write_pr_tunnel_bit(bool set, uint32_t *ctl_out)
+{
+	uint32_t off = pr_ctl_offset();
+	uint32_t val = intel_register_read(&ctx.mmio, off);
+
+	if (set)
+		val |= TRANS_DP2_PR_TUNNELING_EN;
+	else
+		val &= ~TRANS_DP2_PR_TUNNELING_EN;
+
+	intel_register_write(&ctx.mmio, off, val);
+	pr_bit_written = true;
+
+	/* Read back through MMIO: a posted write is not a measurement. */
+	*ctl_out = intel_register_read(&ctx.mmio, off);
+}
+
+/*
+ * Sham holds bit 26 clear in both halves, keeping the cable-paced state.
+ * Leaving the driver's set value would allow disk variability to hide bias.
+ */
+static bool arm_bit_state(bool bit_on)
+{
+	return opts.sham ? false : bit_on;
+}
+
+/*
+ * One half of the bit-only A/B. Returns the total disk rate, or -1 if the half
+ * is void because the hardware state moved underneath us.
+ */
+static double bit_arm(bool bit_on, struct commit_info *m)
+{
+	struct out_state *pr = &outs[pr_idx];
+	uint32_t off = pr_ctl_offset();
+	bool want = arm_bit_state(bit_on);
+	uint32_t before, after, dbg = 0;
+	double rate;
+
+	/*
+	 * Mark each arm before toggling. A shared commit window would attribute
+	 * one arm's allocation events to both halves.
+	 */
+	kmsg_mark(bit_on ? "arm-set" : "arm-clear");
+
+	write_pr_tunnel_bit(want, &before);
+
+	/* Verify the programmed state in sham runs too. */
+	if (!!(before & TRANS_DP2_PR_TUNNELING_EN) != want) {
+		printf("  VOID: could not %s bit 26; TRANS_DP2_CTL reads 0x%08x\n",
+		       want ? "set" : "clear", before);
+		return -1;
+	}
+
+	/* PR must stay active, or the halves differ by more than bit 26. */
+	if (!(before & TRANS_DP2_PANEL_REPLAY_EN)) {
+		printf("  VOID: Panel Replay went inactive when bit 26 was %s (TRANS_DP2_CTL 0x%08x); the halves would differ by more than the one bit\n",
+		       bit_on ? "set" : "cleared", before);
+		return -1;
+	}
+
+	/*
+	 * Compare the full value with debugfs. Bit 30 alone could also be set
+	 * on an unrelated transcoder.
+	 */
+	if (!read_ctl_debugfs(g_debugfs_fd, igt_output_name(pr->output), &dbg)) {
+		printf("  VOID: the driver does not report Panel Replay active on %s while MMIO says 0x%08x\n",
+		       igt_output_name(pr->output), before);
+		return -1;
+	}
+	if (dbg != before) {
+		printf("  VOID: MMIO says 0x%08x, the driver says 0x%08x - 0x%05x is not this panel's transcoder\n",
+		       before, dbg, off);
+		return -1;
+	}
+
+	/*
+	 * Let the dock settle before I/O. Measuring the transition mixes the
+	 * two arm states and pulls the alternating A/B ratio toward 1.0.
+	 */
+	sleep(ARM_SETTLE_SECS);
+
+	rate = run_agents(NULL);
+
+	after = intel_register_read(&ctx.mmio, off);
+
+	if (rate < 0)
+		return rate;
+
+	if (after != before) {
+		printf("  VOID: TRANS_DP2_CTL changed during the measurement (0x%08x -> 0x%08x); the driver reprogrammed it\n",
+		       before, after);
+		return -1;
+	}
+
+	/* Capture any allocation announcements in this arm. */
+	read_commit_info(m);
+
+	return rate;
+}
+
+static int cmd_ab(void)
+{
+	double on[MAX_REPS], off[MAX_REPS];
+	double lo_on, med_on, hi_on, lo_off, med_off, hi_off;
+	struct commit_info m_on, m_off;
+	struct contention cont;
+	struct out_state *pr;
+	uint32_t base_ctl, dummy;
+	struct fact alloc;
+	double sp_off, sp_on, ratio;
+	const char *lo_label, *hi_label, *lo_short, *hi_short;
+	bool shortage, alloc_moved = false;
+	enum shortage st = SHORTAGE_UNKNOWN;
+	int target, pred = 0, i, reneg = 0, rc = 0;
+
+	prepare(true);
+
+	/*
+	 * Use neutral sham labels: neither half sets bit 26.
+	 */
+	lo_label = opts.sham ? "half A" : "bit 26 clear";
+	hi_label = opts.sham ? "half B" : "bit 26 set";
+	lo_short = opts.sham ? "half A" : "clear";
+	hi_short = opts.sham ? "half B" : "set";
+	pr = &outs[pr_idx];
+
+	/*
+	 * prepare() assigned a CRTC even if PR was dark at startup.
+	 * Use that assignment; do not reject the old pr->conn->pipe value.
+	 */
+	target = clamp_dp(opts.n_targets ? opts.targets[0] : 68000);
+
+	if (!agents_healthy())
+		igt_skip("a disk is unwritable before the run starts\n");
+
+	/*
+	 * Create read sources before applying this command's video load.
+	 * Writing them through an already starved tunnel would endanger the
+	 * drives during a run intended as a read-only traffic control.
+	 */
+	if (agent_op == AGENT_READ && !prepare_read_files()) {
+		rc = 98;
+		goto out;
+	}
+
+	if (agent_op == AGENT_READ) {
+		/*
+		 * Reads use the opposite direction from video, so the
+		 * downstream contention probe does not apply.
+		 */
+		printf("== bandwidth shortage check: not applicable\n");
+		printf("  This is a read run. Reads travel dock->host, the direction video does not\n"
+		       "  occupy, so there is no shortage to find. That is the point: this run is a\n"
+		       "  control and must come out at 1.0.\n");
+		memset(&cont, 0, sizeof(cont));
+		shortage = false;
+	} else {
+		st = prove_contention(target, &cont);
+
+		/*
+		 * Dead disks require load release and recovery, not more A/B
+		 * windows at the load that caused the failure.
+		 */
+		if (st == SHORTAGE_DISKS_DEAD) {
+			relieve_load();
+			if (!agents_healthy())
+				printf("\na disk did not recover after the load was released, so its tunnel is down rather than merely starved; power-cycle the enclosure\n");
+			else
+				printf("\nthe disks answered again once the load was released; lower the target and retry\n");
+			rc = 98;
+			goto out;
+		}
+
+		shortage = st == SHORTAGE_YES;
+	}
+	printf("\n");
+
+	/* Panel Replay on, and it stays on for the rest of the run. */
+	if (!contention_done()) {
+		printf("could not switch Panel Replay back on for %s; it has to be active in both halves\n",
+		       igt_output_name(pr->output));
+		rc = 98;
+		goto out;
+	}
+
+	if (!set_load(target, true, &alloc, &pred, NULL)) {
+		printf("no configuration fits %d Mb/s\n", target);
+		rc = 98;
+		goto out;
+	}
+
+	if (!psr_wait_entry(g_debugfs_fd, PR_MODE_SEL_FETCH, pr->output)) {
+		printf("Panel Replay did not activate on %s\n",
+		       igt_output_name(pr->output));
+		rc = 98;
+		goto out;
+	}
+
+	base_ctl = intel_register_read(&ctx.mmio, pr_ctl_offset());
+	note_driver_pr_ctl(base_ctl);
+	if (!(base_ctl & TRANS_DP2_PR_TUNNELING_EN))
+		igt_skip("TRANS_DP2_CTL bit 26 is clear as the driver programs it (0x%08x): this panel or dock does not advertise the optimization, so there is nothing to toggle\n",
+			 base_ctl);
+
+	printf("== the measurement\n");
+	printf("Panel Replay ACTIVE in both halves; only TRANS_DP2_PR_TUNNELING_ENABLE differs.\n");
+	printf("video allocated %s Mb/s of %d cable, %.0f MB/s nominal headroom\n",
+	       fact_str(alloc), link_budget(NULL),
+	       (link_budget(NULL) - (alloc.known ? alloc.val : pred)) /
+	       MIB_S_TO_MBIT_S);
+	printf("TRANS_DP2_CTL as the driver programs it: 0x%08x\n", base_ctl);
+	printf("%d disk(s) %s, %.1fs each, %d reps, %ds settle per half\n\n",
+	       n_agents,
+	       agent_op == AGENT_READ ?
+	       "READING (dock->host, the direction video does NOT occupy - this is the control)" :
+	       "WRITING (host->dock, the direction video occupies)",
+	       opts.secs, opts.reps, ARM_SETTLE_SECS);
+
+	if (opts.sham)
+		printf("SHAM MODE: bit 26 is held CLEAR in both halves, so they are identical and the\n"
+		       "ratio below is this tool's own bias. It must come out at 1.0. Clear rather than\n"
+		       "left alone because that is the cable-paced state, the one where a bias would\n"
+		       "actually show.\n\n");
+
+	{
+		double warm = run_agents(NULL);
+
+		if (warm < 0) {
+			printf("  warm-up : the disks failed before the first measurement\n");
+			relieve_load();
+			rc = 98;
+			goto out;
+		}
+		printf("  warm-up : %8.1f MB/s (discarded)\n", warm);
+	}
+
+	for (i = 0; i < opts.reps; i++) {
+		/*
+		 * Alternate arm order to balance drive-state drift.
+		 * If the first arm fails, skip the second: -1 can mean dead
+		 * storage, not just a register mismatch.
+		 */
+		if (i & 1) {
+			on[i] = bit_arm(true, &m_on);
+			off[i] = on[i] < 0 ? -1 : bit_arm(false, &m_off);
+		} else {
+			off[i] = bit_arm(false, &m_off);
+			on[i] = off[i] < 0 ? -1 : bit_arm(true, &m_on);
+		}
+
+		if (on[i] < 0 || off[i] < 0) {
+			write_pr_tunnel_bit(true, &dummy);
+			relieve_load();
+			if (!agents_healthy())
+				printf("\na disk did not recover after the load was released, so its tunnel is down rather than merely starved; power-cycle the enclosure\n");
+			printf("\nrun abandoned; the load was released and the bit restored\n");
+			rc = 98;
+			goto out;
+		}
+
+		/*
+		 * Both halves must use the same cable width. Firmware,
+		 * hot-plug, or resume can invalidate the startup setting.
+		 */
+		if (!link_unchanged("across a rep")) {
+			write_pr_tunnel_bit(true, &dummy);
+			relieve_load();
+			rc = 98;
+			goto out;
+		}
+
+		/*
+		 * Accumulate announcements across all reps, not just the last.
+		 * Quiet arms have no value to compare; any announced allocation
+		 * must still match the committed one.
+		 */
+		reneg += m_off.group_alloc_lines + m_on.group_alloc_lines;
+
+		if (m_off.group_alloc.known && alloc.known &&
+		    m_off.group_alloc.val != alloc.val)
+			alloc_moved = true;
+		if (m_on.group_alloc.known && alloc.known &&
+		    m_on.group_alloc.val != alloc.val)
+			alloc_moved = true;
+
+		printf("  rep %d (%s first): %6s %8.1f   %6s %8.1f MB/s\n",
+		       i + 1, (i & 1) ? hi_short : lo_short,
+		       lo_short, off[i], hi_short, on[i]);
+	}
+
+	/*
+	 * Set bit 26 for now; restore_state() later restores the saved driver
+	 * value rather than treating this write as the final decision.
+	 */
+	write_pr_tunnel_bit(true, &dummy);
+
+	stats(off, opts.reps, &lo_off, &med_off, &hi_off);
+	stats(on, opts.reps, &lo_on, &med_on, &hi_on);
+
+	sp_off = spread_pct(lo_off, med_off, hi_off);
+	sp_on = spread_pct(lo_on, med_on, hi_on);
+	ratio = med_off > 0 ? med_on / med_off : 0.0;
+
+	printf("\n=== result at %s Mb/s of video, Panel Replay active throughout ===\n",
+	       fact_str(alloc));
+	printf("  %-13s: %8.1f MB/s   (min %.1f, max %.1f, spread %.1f%%)\n",
+	       lo_label, med_off, lo_off, hi_off, sp_off);
+	printf("  %-13s: %8.1f MB/s   (min %.1f, max %.1f, spread %.1f%%)\n",
+	       hi_label, med_on, lo_on, hi_on, sp_on);
+	printf("  %-13s: %8.3f x   (%s divided by %s)\n", "ratio", ratio,
+	       hi_label, lo_label);
+
+	/*
+	 * A bit-only comparison must keep the committed allocation unchanged.
+	 * Zero announcements is expected in marked, no-modeset windows; it is
+	 * distinct from an unknown committed allocation.
+	 */
+	if (!alloc.known)
+		printf("  allocation   : %d announcement(s) inside the measurement windows; the committed figure could not be read, so it is not known what stayed put\n",
+		       reneg);
+	else if (alloc_moved)
+		printf("  allocation   : %d Mb/s committed, but a half announced a different figure - something renegotiated and this is not a bit-only comparison\n",
+		       alloc.val);
+	else if (reneg)
+		printf("  allocation   : %d Mb/s committed, re-announced unchanged %d time(s) inside the windows\n",
+		       alloc.val, reneg);
+	else
+		printf("  allocation   : %d Mb/s committed, and no renegotiation announced in either half of any rep\n",
+		       alloc.val);
+
+	/*
+	 * Report released bandwidth only for real bit toggles with writes.
+	 * Sham releases nothing; reads do not compete with downstream video.
+	 */
+	if (!opts.sham && agent_op == AGENT_WRITE && med_on > med_off) {
+		double freed = (med_on - med_off) * MIB_S_TO_MBIT_S;
+
+		/*
+		 * If the faster arm is disk-limited, its gain is only a lower
+		 * bound on the cable bandwidth released.
+		 */
+		if (sp_on > STEADY_PCT)
+			printf("  %-13s: at least %.0f Mb/s of cable bandwidth handed back\n",
+			       "released", freed);
+		else
+			printf("  %-13s: %.0f Mb/s of cable bandwidth handed back\n",
+			       "released", freed);
+	}
+
+	/* Explain whether each arm remained cable-limited. */
+	printf("\n  Reading the spread: a disk limited by its own speed wanders 30%% or more.\n"
+	       "  One limited by the cable holds to about 1%%, because the cable paces it.\n");
+	printf("    %-13s %5.1f%% - %s\n", lo_label, sp_off,
+	       sp_off <= STEADY_PCT ? "steady, so the cable was its limit" :
+				      "wandering, so the disks were their own limit");
+	printf("    %-13s %5.1f%% - %s\n", hi_label, sp_on,
+	       sp_on <= STEADY_PCT ? "steady, so the cable was its limit" :
+				     "wandering, so the disks were their own limit");
+
+	/* Qualify the ratio using the control mode and contention evidence. */
+	printf("\n");
+	if (opts.sham) {
+		printf("This was a sham run: bit 26 was held clear in both halves, so the ratio above\n"
+		       "is this tool's own bias. Anything near 1.0 means the harness is honest. Both\n"
+		       "spreads should be small, because the clear state is the one the cable paces;\n"
+		       "if they are not, the disks were their own limit and this control proved little.\n");
+	} else if (agent_op == AGENT_READ) {
+		printf("These were READS, which travel the direction video does not occupy. A real\n"
+		       "wire-level effect must show on writes and NOT here, so a ratio near 1.0 is\n"
+		       "the expected and desired outcome.\n");
+	} else if (st == SHORTAGE_UNKNOWN) {
+		/*
+		 * An incomplete probe is not evidence of no shortage.
+		 * Keep its interpretation separate from a measured control.
+		 */
+		printf("NOTE: the bandwidth shortage probe did not complete (see above), so whether\n"
+		       "      the disks were short of cable bandwidth at this load is not known. The\n"
+		       "      ratio above cannot be read either way - not as evidence of an effect,\n"
+		       "      and not as a valid control.\n");
+	} else if (!shortage) {
+		printf("NOTE: there was no bandwidth shortage at this load (see above), so the disks\n"
+		       "      were limited by themselves rather than by the cable. A ratio near 1.0 is\n"
+		       "      expected and is a valid control; it is not evidence that the feature\n"
+		       "      does nothing. Run `sweep` to find a load where the cable is the limit.\n");
+	} else if (spread_pct(lo_off, med_off, hi_off) > 20.0) {
+		printf("CAUTION: the slower half's spread is %.0f%%, so the cable was not reliably the\n"
+		       "         limit and this ratio is mostly noise.\n",
+		       spread_pct(lo_off, med_off, hi_off));
+	} else {
+		printf("Panel Replay was active in BOTH halves, so display engine idling, package\n"
+		       "power states and memory traffic are held constant. The difference above is\n"
+		       "attributable to the tunnelling bit and nothing else.\n");
+	}
+
+out:
+	finish();
+
+	return rc;
+}
+
+/* Observe unsolicited dock activity after each settled modeset. */
+#define SETTLE_SECS		5
+
+static bool facts_equal(struct fact a, struct fact b)
+{
+	return a.known == b.known && (!a.known || a.val == b.val);
+}
+
+/*
+ * Compare dock accounting with PR off/on, without disks.
+ * Start each observation window after the modeset and PR settling, so commit
+ * activity is excluded. Unchanged allocations do not imply PR had no effect
+ * on live traffic; see the manpage's measurement rationale.
+ */
+static int cmd_accounting(void)
+{
+	static const int seq_fwd[2] = { 0, 1 }, seq_rev[2] = { 1, 0 };
+	struct commit_info commit[2], settle[2];
+	uint32_t ctl[2] = { 0, 0 };
+	struct out_state *pr;
+	int target, pass, rc = 0;
+
+	prepare(false);
+	pr = &outs[pr_idx];
+
+	target = clamp_dp(opts.n_targets ? opts.targets[0] : 60000);
+
+	printf("== does Panel Replay change what the dock sees?\n");
+	printf("video target %d Mb/s, %d s settle window per half, no disks involved\n\n",
+	       target, SETTLE_SECS);
+
+	for (pass = 0; pass < 2; pass++) {
+		const int *seq = pass ? seq_rev : seq_fwd;
+		int arm, k;
+
+		printf("--- pass %d: Panel Replay %s programmed first ---\n",
+		       pass + 1, pass ? "on" : "off");
+
+		/*
+		 * Arm 0 is off and arm 1 is on. Run both programming orders
+		 * to distinguish ordering effects from PR behavior.
+		 */
+		for (k = 0; k < 2; k++) {
+			bool pr_on = seq[k] == 1;
+			struct fact alloc;
+			int pred;
+
+			arm = seq[k];
+
+			if (pr_on) {
+				if (!psr_enable(g_drm_fd, g_debugfs_fd,
+						PR_MODE_SEL_FETCH, pr->output)) {
+					printf("could not ask for Panel Replay on %s\n",
+					       igt_output_name(pr->output));
+					rc = 98;
+					goto out;
+				}
+			} else if (!psr_disable(g_drm_fd, g_debugfs_fd,
+						pr->output)) {
+				printf("could not switch Panel Replay off on %s\n",
+				       igt_output_name(pr->output));
+				rc = 98;
+				goto out;
+			}
+
+			if (!set_load(target, true, &alloc, &pred,
+				      &commit[arm])) {
+				printf("no configuration fits %d Mb/s\n",
+				       target);
+				rc = 98;
+				goto out;
+			}
+
+			/*
+			 * Use MMIO for both arms; debugfs omits the value
+			 * when PR is off, so it cannot verify the off state or
+			 * supply the value printed for that arm.
+			 */
+			ctl[arm] = intel_register_read(&ctx.mmio, pr_ctl_offset());
+
+			if (pr_on) {
+				uint32_t dbg = 0;
+
+				if (!psr_wait_entry(g_debugfs_fd,
+						    PR_MODE_SEL_FETCH,
+						    pr->output)) {
+					printf("Panel Replay did not activate on %s\n",
+					       igt_output_name(pr->output));
+					rc = 98;
+					goto out;
+				}
+
+				/* Re-read: psr_wait_entry() waited for it. */
+				ctl[arm] = intel_register_read(&ctx.mmio,
+							       pr_ctl_offset());
+				note_driver_pr_ctl(ctl[arm]);
+
+				if (!(ctl[arm] & TRANS_DP2_PANEL_REPLAY_EN)) {
+					printf("Panel Replay expected on but TRANS_DP2_CTL is 0x%08x\n",
+					       ctl[arm]);
+					rc = 98;
+					goto out;
+				}
+				if (!read_ctl_debugfs(g_debugfs_fd,
+						      igt_output_name(pr->output),
+						      &dbg) || dbg != ctl[arm]) {
+					printf("MMIO says 0x%08x, the driver says 0x%08x - 0x%05x is not this panel's transcoder\n",
+					       ctl[arm], dbg,
+					       pr_ctl_offset());
+					rc = 98;
+					goto out;
+				}
+				if (!(ctl[arm] & TRANS_DP2_PR_TUNNELING_EN))
+					igt_skip("TRANS_DP2_CTL bit 26 is clear: this panel or dock does not advertise the optimization, so there is nothing to look for\n");
+			} else if (ctl[arm] & TRANS_DP2_PANEL_REPLAY_EN) {
+				printf("Panel Replay still on after psr_disable() plus a full modeset: 0x%08x\n",
+				       ctl[arm]);
+				rc = 98;
+				goto out;
+			}
+
+			/* Start the window after the state settles. */
+			kmsg_mark(pr_on ? "settle-pr-on" : "settle-pr-off");
+			sleep(SETTLE_SECS);
+			read_commit_info(&settle[arm]);
+
+			if (!link_unchanged("during a settle window")) {
+				rc = 98;
+				goto out;
+			}
+		}
+
+		for (arm = 0; arm < 2; arm++) {
+			printf("  Panel Replay %-3s: TRANS_DP2_CTL 0x%08x (PR=%d tunnel-opt=%d)\n",
+			       arm ? "on" : "off", ctl[arm],
+			       !!(ctl[arm] & TRANS_DP2_PANEL_REPLAY_EN),
+			       !!(ctl[arm] & TRANS_DP2_PR_TUNNELING_EN));
+			printf("      at commit: group alloc %s/%s",
+			       fact_str(commit[arm].group_alloc),
+			       fact_str(commit[arm].group_cap));
+			/*
+			 * Video uses downstream; upstream is reported as zero.
+			 * Print both directions explicitly.
+			 */
+			printf(", video consumed %s Mb/s downstream (%s up)",
+			       fact_str(commit[arm].dp_consumed_down),
+			       fact_str(commit[arm].dp_consumed_up));
+			printf(", USB3 %s/%s",
+			       fact_str(commit[arm].usb3_alloc_up),
+			       fact_str(commit[arm].usb3_alloc_down));
+			printf(", PCIe held %s",
+			       fact_str(commit[arm].pcie_reserved));
+			printf(", estimated %s Mb/s\n",
+			       fact_str(commit[arm].est_bw));
+			printf("      in the %ds window: %d unsolicited dock bandwidth event(s)\n",
+			       SETTLE_SECS,
+			       settle[arm].cm_events);
+		}
+
+		/*
+		 * Compare the halves, including background event counts.
+		 * Unknowns compare equal too; require at least one allocation
+		 * or downstream-consumption value before drawing a conclusion.
+		 */
+		if (!commit[0].dp_consumed_down.known &&
+		    !commit[1].dp_consumed_down.known &&
+		    !commit[0].group_alloc.known && !commit[1].group_alloc.known) {
+			printf("\n  RESULT: none of the dock's figures could be read in either half, so\n"
+			       "          nothing can be concluded. Enable thunderbolt.dyndbg=+p and\n"
+			       "          drm.debug=0x10e and run this again.\n");
+		} else if (facts_equal(commit[0].dp_consumed_down,
+				       commit[1].dp_consumed_down) &&
+			   facts_equal(commit[0].dp_consumed_up,
+				       commit[1].dp_consumed_up) &&
+			   facts_equal(commit[0].group_alloc, commit[1].group_alloc) &&
+			   facts_equal(commit[0].usb3_alloc_up,
+				       commit[1].usb3_alloc_up) &&
+			   facts_equal(commit[0].usb3_alloc_down,
+				       commit[1].usb3_alloc_down) &&
+			   facts_equal(commit[0].pcie_reserved,
+				       commit[1].pcie_reserved) &&
+			   facts_equal(commit[0].est_bw, commit[1].est_bw) &&
+			   settle[0].cm_events == settle[1].cm_events) {
+			printf("\n  RESULT: the driver sets the tunnelling bit, but the dock sees no\n"
+			       "          difference whatsoever - identical consumed bandwidth, identical\n"
+			       "          group allocation, and no unsolicited renegotiation while Panel\n"
+			       "          Replay is active. No counter here can show the feature working,\n"
+			       "          however well it works. Only throughput on a tunnel that is\n"
+			       "          genuinely short of bandwidth can.\n");
+		} else {
+			printf("\n  RESULT: the dock DOES react to Panel Replay - the two halves differ\n"
+			       "          above. A throughput measurement under contention is then worth\n"
+			       "          running to see how much it is worth.\n");
+		}
+
+		/*
+		 * DP "consumed" bandwidth is the allocated port bandwidth,
+		 * not live pixel traffic. Toggling the optimization does not
+		 * reallocate it.
+		 */
+		if (facts_equal(commit[0].dp_consumed_down,
+				commit[1].dp_consumed_down) &&
+		    commit[0].dp_consumed_down.known)
+			printf("\n  NOTE: video consumed bandwidth is %s Mb/s in both halves. That figure is\n"
+			       "        the tunnel's *allocated* bandwidth read back from the port, not a count\n"
+			       "        of symbols carrying pixels - so it can only move when something\n"
+			       "        reallocates, and enabling the optimization does not. No counter here\n"
+			       "        could reflect elided filler symbols even in principle.\n",
+			       fact_str(commit[0].dp_consumed_down));
+
+		printf("\n");
+	}
+
+out:
+	finish();
+
+	return rc;
+}
+
+static const char *prog = "intel_pr_bw";
+
+static void __noreturn usage(int code)
+{
+	printf("Usage: %s <command> [options]\n"
+"\n"
+"Measure the USB4 cable bandwidth that Panel Replay hands back to storage and\n"
+"USB traffic sharing the cable with video.\n"
+"\n"
+"Commands:\n"
+"  check         report whether this machine can do the measurement.\n"
+"                Read-only: no register write, no modeset, and nothing\n"
+"                written to any disk. Start here.\n"
+"  sweep         raise the video load step by step and report throughput at\n"
+"                each step, to find where the disks start to run short.\n"
+"  ab            the measurement. Panel Replay stays active in both halves and\n"
+"                only TRANS_DP2_PR_TUNNELING_ENABLE is toggled.\n"
+"  accounting    report the dock's own bandwidth bookkeeping with Panel Replay\n"
+"                on and off. Needs no disks.\n"
+"\n"
+"Options:\n"
+"  --secs <f>            seconds of disk traffic per measurement (default %.0f)\n"
+"  --reps <n>            repetitions per load level (default %d, max %d)\n"
+"  --size-mb <n>         disk file size cap in MB, wraps at the end (default %d)\n"
+"  --dp-targets <a,b,..> exact video loads in Mb/s instead of percentage steps.\n"
+"                        Percentages are far too coarse - the whole window\n"
+"                        where the effect is visible can be 3%% of the cable.\n"
+"  --custom-fill         build a filler video mode that hits each target\n"
+"                        exactly. Advertised modes leave gaps of thousands of\n"
+"                        Mb/s that can hide the entire transition. Above about\n"
+"                        73000 the driver quietly lowers the colour depth and\n"
+"                        you land lower than without it, so that is only\n"
+"                        reachable - and only a hazard - with --max-dp raised.\n"
+"                        Only ONE filler is driven, so on a rig with more than\n"
+"                        two panels the rest stay dark: the reachable load is\n"
+"                        lower than a plain run's and the two are not\n"
+"                        comparable. `check` reports how many that is.\n"
+"  --read-agents         read from the disks instead of writing. Reads travel\n"
+"                        the other way down the cable, which video never uses,\n"
+"                        so this is the control: a real effect shows on writes\n"
+"                        and not on reads.\n"
+"  --sham                `ab` only: run the A/B with bit 26 held clear in both\n"
+"                        halves, so they are identical and the ratio reported\n"
+"                        is this tool's own bias. Must come out at 1.0. Clear\n"
+"                        rather than left alone because that is the state the\n"
+"                        cable paces, and a bias only shows where the readings\n"
+"                        are steady.\n"
+"  --max-dp <n>          safety ceiling on the video load in Mb/s (default %d).\n"
+"                        Around 76000 on the reference rig the storage tunnel\n"
+"                        is starved until the drives need a physical power\n"
+"                        cycle, so the default leaves a few thousand Mb/s of\n"
+"                        margin. Raise at your own risk.\n"
+"  --help                this message\n"
+"\n"
+"Environment:\n"
+"  IGT_PR_BW_NVME_PATHS  comma-separated mount points of the competing disks\n"
+"                        (default \"%s\").\n"
+"  IGT_PR_BW_PR_OUTPUT   which connected output to measure, e.g. DP-1. By\n"
+"                        default a tunnelled Panel Replay panel is preferred\n"
+"                        over an untunnelled one, and enumeration order decides\n"
+"                        between equals - which is not a stable choice on a rig\n"
+"                        with two of them.\n"
+"  IGT_PR_BW_TBT_ROUTER  which depth-1 Thunderbolt router is the dock, e.g.\n"
+"                        0-1, if it is not the widest one.\n"
+"\n"
+"Exit codes: 0 measured, 77 cannot measure here, 98 failed, 1 bad command line,\n"
+"128 + signal number if interrupted.\n",
+		prog, DEFAULT_SECS, DEFAULT_REPS, MAX_REPS, DEFAULT_WRITE_MB,
+		DP_MAX_SAFE, DEFAULT_AGENT_PATHS);
+
+	exit(code);
+}
+
+enum command {
+	CMD_CHECK,
+	CMD_SWEEP,
+	CMD_AB,
+	CMD_ACCOUNTING,
+};
+
+static struct {
+	const char *name;
+	enum command cmd;
+} const commands[] = {
+	{ "check",	CMD_CHECK },
+	{ "sweep",	CMD_SWEEP },
+	{ "ab",		CMD_AB },
+	{ "accounting",	CMD_ACCOUNTING },
+};
+
+/*
+ * Reject malformed, overflowing, and non-finite values; do not coerce them.
+ * Infinite or NaN durations would hang I/O or falsely report "moved nothing".
+ */
+static int opt_int(const char *s, const char *name)
+{
+	char *end;
+	long v;
+
+	errno = 0;
+	v = strtol(s, &end, 10);
+	if (errno || end == s || *end || v < INT_MIN || v > INT_MAX) {
+		fprintf(stderr, "%s: not an integer: \"%s\"\n", name, s);
+		exit(1);
+	}
+
+	return (int)v;
+}
+
+static double opt_double(const char *s, const char *name)
+{
+	char *end;
+	double v;
+
+	errno = 0;
+	v = strtod(s, &end);
+	if (errno || end == s || *end || !isfinite(v)) {
+		fprintf(stderr, "%s: not a finite number: \"%s\"\n", name, s);
+		exit(1);
+	}
+
+	return v;
+}
+
+static void parse_opts(int argc, char *argv[])
+{
+	static const struct option long_opts[] = {
+		{ "size-mb",	 required_argument, NULL, 's' },
+		{ "reps",	 required_argument, NULL, 'r' },
+		{ "secs",	 required_argument, NULL, 'S' },
+		{ "dp-targets",	 required_argument, NULL, 'T' },
+		{ "custom-fill", no_argument,	    NULL, 'C' },
+		{ "max-dp",	 required_argument, NULL, 'M' },
+		{ "read-agents", no_argument,	    NULL, 'R' },
+		{ "sham",	 no_argument,	    NULL, 'H' },
+		{ "help",	 no_argument,	    NULL, 'h' },
+		{}
+	};
+	int opt;
+
+	while ((opt = getopt_long(argc, argv, "s:r:S:T:CM:RHh", long_opts,
+				  NULL)) != -1) {
+		switch (opt) {
+		case 's':
+			opts.write_mb = opt_int(optarg, "--size-mb");
+			break;
+		case 'r':
+			opts.reps = opt_int(optarg, "--reps");
+			break;
+		case 'S':
+			opts.secs = opt_double(optarg, "--secs");
+			break;
+		case 'C':
+			opts.custom_fill = true;
+			break;
+		case 'M':
+			opts.max_dp = opt_int(optarg, "--max-dp");
+			break;
+		case 'R':
+			opts.read_agents = true;
+			break;
+		case 'H':
+			opts.sham = true;
+			break;
+		case 'T': {
+			char *tok, *save = NULL, *list = strdup(optarg);
+
+			if (!list) {
+				fprintf(stderr, "out of memory\n");
+				exit(98);
+			}
+			opts.n_targets = 0;
+			for (tok = strtok_r(list, ",", &save);
+			     tok && opts.n_targets < MAX_TARGETS;
+			     tok = strtok_r(NULL, ",", &save)) {
+				int v = opt_int(tok, "--dp-targets");
+
+				/*
+				 * 0 is the all-dark baseline and is meaningful;
+				 * anything below a granule is not a load.
+				 */
+				if (v && v < BW_GRANULE) {
+					fprintf(stderr, "--dp-targets: %d Mb/s is below one %d Mb/s granule\n",
+						v, BW_GRANULE);
+					exit(1);
+				}
+				opts.targets[opts.n_targets++] = v;
+			}
+			free(list);
+			break;
+		}
+		case 'h':
+			usage(0);
+		default:
+			usage(1);
+		}
+	}
+
+	if (opts.reps < 1 || opts.reps > MAX_REPS) {
+		fprintf(stderr, "--reps must be 1..%d\n", MAX_REPS);
+		exit(1);
+	}
+	if (opts.secs <= 0) {
+		fprintf(stderr, "--secs must be positive\n");
+		exit(1);
+	}
+	/*
+	 * Reject negative sizes before conversion to an unsigned file cap.
+	 * Otherwise source creation can fill the filesystem.
+	 */
+	if (opts.write_mb < 1) {
+		fprintf(stderr, "--size-mb must be at least 1\n");
+		exit(1);
+	}
+	/* Keep an invalid safety ceiling from reaching clamp_dp(). */
+	if (opts.max_dp < BW_GRANULE) {
+		fprintf(stderr, "--max-dp must be at least %d\n", BW_GRANULE);
+		exit(1);
+	}
+	/* Odd repetitions leave one arm ordering over-represented. */
+	if (opts.reps & 1)
+		fprintf(stderr, "warning: --reps %d is odd, so one half runs first once more than the other; prefer an even count\n",
+			opts.reps);
+	/*
+	 * One sample has zero spread by construction, not proven steadiness.
+	 */
+	if (opts.reps < 2)
+		fprintf(stderr, "warning: --reps 1 leaves no spread to measure, so every steadiness verdict below comes from one sample and proves nothing\n");
+	/*
+	 * Reject positional loads instead of silently measuring the default.
+	 */
+	if (optind < argc) {
+		fprintf(stderr, "unexpected argument \"%s\" - loads are given with --dp-targets\n",
+			argv[optind]);
+		exit(1);
+	}
+}
+
+static int cmd_check(void)
+{
+	bool ok;
+
+	printf("%s check - can this machine measure the Panel Replay bandwidth release?\n\n",
+	       prog);
+
+	ok = gate_software();
+
+	/*
+	 * Only lack of root blocks MMIO inspection. Other software failures
+	 * must not prevent reporting the remaining setup problems.
+	 */
+	if (g_is_root) {
+		ok = gate_display(&ctx) && ok;
+
+		/* Report storage problems even if display inspection failed. */
+		ok = gate_storage(false) && ok;
+
+		/* Mode inspection needs a PR output from the display gate. */
+		if (pr_idx >= 0)
+			ok = gate_modes(&ctx, g_pcie_reserved) && ok;
+	}
+
+	finish();
+
+	printf("\n");
+	if (!ok) {
+		printf("VERDICT: cannot measure on this machine - %d blocking problem(s) above.\n",
+		       n_fail);
+		return IGT_EXIT_SKIP;
+	}
+
+	printf("VERDICT: this machine can do the measurement%s.\n",
+	       n_warn ? " (with warnings above)" : "");
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	enum command cmd;
+	unsigned int i;
+
+	if (argc > 0 && argv[0])
+		prog = argv[0];
+
+	if (argc < 2)
+		usage(1);
+
+	if (!strcmp(argv[1], "--help") || !strcmp(argv[1], "-h"))
+		usage(0);
+
+	for (i = 0; i < ARRAY_SIZE(commands); i++) {
+		if (!strcmp(argv[1], commands[i].name))
+			break;
+	}
+	if (i == ARRAY_SIZE(commands)) {
+		fprintf(stderr, "%s: unknown command \"%s\"\n", prog, argv[1]);
+		usage(1);
+	}
+	cmd = commands[i].cmd;
+
+	/* Hide the command from getopt_long(). */
+	argv[1] = argv[0];
+	parse_opts(argc - 1, argv + 1);
+
+	/*
+	 * Return the command status. igt_exit() would substitute the framework
+	 * status and add a test-style SUCCESS line. Registered atexit handlers
+	 * still run; library igt_skip() paths retain their exit code 77.
+	 */
+	switch (cmd) {
+	case CMD_CHECK:
+		return cmd_check();
+	case CMD_SWEEP:
+		return cmd_sweep();
+	case CMD_AB:
+		return cmd_ab();
+	case CMD_ACCOUNTING:
+		return cmd_accounting();
+	}
+
+	return 0;
+}
diff --git a/tools/meson.build b/tools/meson.build
index fbc6c0a00..89aaf5cde 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -22,6 +22,7 @@ tools_progs = [
 	'intel_opregion_decode',
 	'intel_perf_counters',
 	'intel_pm_rpm',
+	'intel_pr_bw',
 	'intel_reg_checker',
 	'intel_residency',
 	'intel_tiling_detect',
-- 
2.25.1

