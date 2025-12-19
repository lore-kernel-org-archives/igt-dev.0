Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB50D7879F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 17:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8D010F04D;
	Fri, 19 Dec 2025 17:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK9AHVld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D3010F04D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766164209; x=1797700209;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=boG8paEUWF9QxyzvkJ0/DJZvg8O7M7emGmU7WhEOgnU=;
 b=cK9AHVldOdzVThZOdYhD7gET7DpVCLR4NO5JjhbnDUxpjgkT9as40Y72
 kBhe0Cz1N7YyNsycpqrf+fpPA8P6rKlYZHbbtFYNr3WRqiNOEFlJccVUm
 ScV7zLwVv501p9uEgHmJa+3LuuXz8jYyGwMK40mqIQACqLRM5Q58vo5Am
 6tuNkYoK/CheWcyDBHYnFKVEQbjaOxogdGAhDjtXFxbrY+FV9w6NA5m4j
 txj6XhkGKBjF4cbNEmcq1UUl0ZVeHAuC5Gx/qRAhAqw48mQoRyciaoqvo
 msyGwjpjNqkrfwt/LYyV8u1RcE69aaH1dkLaNNXUGncHnUV/txayBaO78 w==;
X-CSE-ConnectionGUID: nEwq6H4eRaGgv0GLPaGkmA==
X-CSE-MsgGUID: Ghuy+2gqTfiUhiGQu0dYng==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79582836"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79582836"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 09:10:08 -0800
X-CSE-ConnectionGUID: 7ZpwmwhTR92pkTLKX0j53Q==
X-CSE-MsgGUID: UPrnYpQuSda/hsLHlIEJ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203429449"
Received: from vmcintyr-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.246.25.37])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 09:10:05 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t] tools/gen_xe_vf_migration_bpftrace.py: Add bpftrace
 generator for Xe VF migration tracing
Date: Fri, 19 Dec 2025 18:09:58 +0100
Message-ID: <20251219170958.881880-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a Python script that generates a bpftrace program for tracing
Xe SR-IOV VF migration (save/restore) activity.

The tool emits a complete bpftrace script to stdout and is intended
to be used by piping its output to bpftrace, e.g.:

    ./gen_xe_vf_migration_bpftrace.py | bpftrace -

It focuses on migration-related events and metrics useful for
analyzing VF save/restore flow, latency, and data transfer behavior.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tools/gen_xe_vf_migration_bpftrace.py | 1438 +++++++++++++++++++++++++
 1 file changed, 1438 insertions(+)
 create mode 100755 tools/gen_xe_vf_migration_bpftrace.py

diff --git a/tools/gen_xe_vf_migration_bpftrace.py b/tools/gen_xe_vf_migration_bpftrace.py
new file mode 100755
index 000000000..8397dc3f4
--- /dev/null
+++ b/tools/gen_xe_vf_migration_bpftrace.py
@@ -0,0 +1,1438 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: MIT
+#
+# Copyright(c) 2025 Intel Corporation. All rights reserved.
+#
+"""
+Generator for Xe VF migration bpftrace scripts.
+
+Generates a bpftrace script for observing Intel Xe SR-IOV VF activity,
+focused on migration (save/restore).
+
+Events (--events / --omit-events) filter bpftrace probe specs (kprobe/kretprobe)
+using glob patterns.
+Defaults: --events='*' --omit-events='*:xe_sriov_vfio_data_*'.
+
+Metrics (--metrics / --omit-metrics) filter map names using glob patterns.
+Default: all metrics enabled.
+
+Tracing is organized into blocks, each combining related probes and
+metric producers (e.g. VFIO save/restore, Xe restore paths).
+A block is generated if it provides any enabled metric
+or any of its probes are enabled.
+
+If no output file is given, the script is written to stdout (pipe directly into bpftrace).
+"""
+
+from __future__ import annotations
+
+import argparse
+import sys
+from dataclasses import dataclass
+from fnmatch import fnmatch
+from textwrap import dedent
+from typing import Callable, List, Set, Dict
+
+NameFilter = Callable[[str], bool]
+BlockGen = Callable[[NameFilter, NameFilter], str]
+
+def parse_patterns(csv: str | None) -> List[str] | None:
+    """
+    Parse a comma-separated list of glob patterns.
+
+    Returns a list of non-empty, stripped patterns, or None if the input
+    is None.
+    """
+    if csv is None:
+        return None
+    pats = [p.strip() for p in csv.split(",")]
+    pats = [p for p in pats if p]
+    return pats
+
+
+def make_name_filter(patterns: List[str] | None,
+                     default_patterns: List[str] | None) -> NameFilter:
+    """
+    Return predicate(name)->bool based on glob patterns.
+    If patterns is None, use default_patterns.
+    If final list empty -> always False.
+    """
+    pats = patterns if patterns is not None else default_patterns
+    if not pats:
+        return lambda _name: False
+    return lambda name: any(fnmatch(name, pat) for pat in pats)
+
+
+def make_name_filter_with_omit(include_pats: List[str] | None,
+                               default_include: List[str] | None,
+                               omit_pats: List[str] | None) -> NameFilter:
+    """
+    Create a name filter with optional exclusion patterns.
+
+    The returned predicate accepts names that match the include patterns
+    (or default include patterns) and do not match any of the omit patterns.
+    """
+    inc = make_name_filter(include_pats, default_include)
+    if not omit_pats:
+        return inc
+    return lambda name: inc(name) and not any(fnmatch(name, pat) for pat in omit_pats)
+
+
+@dataclass(frozen=True)
+class Block:
+    """
+    Logical tracing block used to generate a portion of a bpftrace script.
+
+    A block groups related probes and metric producers and may depend on
+    other blocks. The generator function emits bpftrace code based on
+    probe and metric enablement predicates.
+    """
+
+    name: str
+    probes: List[str]                 # Probe specs (kprobe/kretprobe)
+    provides: Set[str]                # Metric/map names produced by this block
+    requires: Set[str]                # Names of other blocks required by this block
+    gen: BlockGen                     # gen(probe_enabled, metric_enabled) -> bpftrace text
+    needs_packet_structs: bool = False
+
+
+
+@dataclass(frozen=True)
+class MetricDef:
+    """
+    Definition of a generated metric.
+
+    Describes the metric name and a short human-readable description
+    used for discovery and listing.
+    """
+
+    name: str
+    desc: str
+
+
+METRIC_DEFS: List[MetricDef] = [
+    # ------------------------------------------------------------------
+    # VFIO
+    # ------------------------------------------------------------------
+    MetricDef(
+        name="vfio_stop_copy_dur_us",
+        desc="Stop-copy phase duration per VF and save_id (microseconds).",
+    ),
+    MetricDef(
+        name="vfio_stop_copy_dur_hist",
+        desc="Histogram of stop-copy phase duration per VF (microseconds).",
+    ),
+    MetricDef(
+        name="vfio_stop_copy_size",
+        desc="Histogram of data size returned by stop-copy operation per VF (bytes).",
+    ),
+    MetricDef(
+        name="vfio_resume_data_dur_us",
+        desc="Resume-data phase duration per VF and restore_id (microseconds).",
+    ),
+    MetricDef(
+        name="vfio_resume_data_dur_hist",
+        desc="Histogram of resume-data phase duration per VF (microseconds).",
+    ),
+    MetricDef(
+        name="vfio_suspend_dur_hist",
+        desc="Histogram of VF suspend operation duration per VF (microseconds).",
+    ),
+    MetricDef(
+        name="vfio_resume_dur_hist",
+        desc="Histogram of VF resume operation duration per VF (microseconds).",
+    ),
+    MetricDef(
+        name="vfio_flr_wait_dur_hist",
+        desc="Histogram of time spent waiting for FLR completion per VF (microseconds).",
+    ),
+    MetricDef(
+        name="vfio_read_bytes",
+        desc="Total bytes read from VFIO migration stream per VF and save_id.",
+    ),
+    MetricDef(
+        name="vfio_read_chunk_size",
+        desc="Histogram of VFIO read chunk sizes per VF and save_id (bytes).",
+    ),
+    MetricDef(
+        name="vfio_read_chunk_dur_us",
+        desc="Histogram of VFIO read chunk durations per VF and save_id (microseconds).",
+    ),
+    MetricDef(
+        name="vfio_write_bytes",
+        desc="Total bytes written to VFIO migration stream per VF and restore_id.",
+    ),
+    MetricDef(
+        name="vfio_write_chunk_size",
+        desc="Histogram of VFIO write chunk sizes per VF and restore_id (bytes).",
+    ),
+    MetricDef(
+        name="vfio_write_chunk_dur_us",
+        desc="Histogram of VFIO write chunk durations per VF and restore_id (microseconds).",
+    ),
+
+    MetricDef(
+        name="vfio_error_count",
+        desc="Count of VFIO migration-related errors per VF.",
+    ),
+    # ------------------------------------------------------------------
+    # Xe
+    # ------------------------------------------------------------------
+    MetricDef(
+        name="xe_save_start_ts",
+        desc="Timestamp of Xe VF save start per VF and save_id (nanoseconds).",
+    ),
+    MetricDef(
+        name="xe_save_end_ts",
+        desc="Timestamp of Xe VF save end per VF and save_id (nanoseconds).",
+    ),
+    MetricDef(
+        name="xe_save_dur_us",
+        desc="Total Xe VF save duration per VF and save_id (microseconds).",
+    ),
+    MetricDef(
+        name="xe_save_produce_bytes",
+        desc="Total bytes produced during Xe VF save per VF, save_id, tile, GT, and packet type.",
+    ),
+    MetricDef(
+        name="xe_save_produce_first_ts",
+        desc=("Timestamp of first produced save packet per VF, save_id, "
+              "tile, GT, and packet type (nanoseconds)."),
+    ),
+    MetricDef(
+        name="xe_save_produce_last_ts",
+        desc=("Timestamp of last produced save packet per VF, save_id, "
+              "tile, GT, and packet type (nanoseconds)."),
+    ),
+    MetricDef(
+        name="xe_save_produce_pkt_dur_us",
+        desc=("Histogram of Xe save packet production duration per VF, "
+              "save_id, and packet type (microseconds)."),
+    ),
+    MetricDef(
+        name="xe_save_produce_pkt_size",
+        desc="Histogram of Xe save packet sizes per VF, save_id, and packet type (bytes).",
+    ),
+    MetricDef(
+        name="xe_restore_start_ts",
+        desc="Timestamp of Xe VF restore start per VF and restore_id (nanoseconds).",
+    ),
+    MetricDef(
+        name="xe_restore_end_ts",
+        desc="Timestamp of Xe VF restore end per VF and restore_id (nanoseconds).",
+    ),
+    MetricDef(
+        name="xe_restore_dur_us",
+        desc="Total Xe VF restore duration per VF and restore_id (microseconds).",
+    ),
+    MetricDef(
+        name="xe_restore_bytes",
+        desc=("Total bytes restored during Xe VF restore per VF, restore_id, "
+              "tile, GT, and packet type."),
+    ),
+    MetricDef(
+        name="xe_restore_first_ts",
+        desc=("Timestamp of first restored packet per VF, restore_id, tile, "
+              "GT, and packet type (nanoseconds)."),
+    ),
+    MetricDef(
+        name="xe_restore_last_ts",
+        desc=("Timestamp of last restored packet per VF, restore_id, tile, "
+              "GT, and packet type (nanoseconds)."),
+    ),
+    MetricDef(
+        name="xe_restore_pkt_dur_us",
+        desc=("Histogram of Xe restore packet processing duration per VF, "
+              "restore_id, and packet type (microseconds)."),
+    ),
+    MetricDef(
+        name="xe_restore_pkt_size",
+        desc="Histogram of Xe restore packet sizes per VF, restore_id, and packet type (bytes).",
+    ),
+]
+
+ALL_METRICS = [m.name for m in METRIC_DEFS]
+
+def gen_preamble() -> str:
+    return dedent("""\
+        #!/usr/bin/env bpftrace
+        /* Auto-generated by gen_xe_vf_migration_bpftrace.py */
+    """)
+
+
+def gen_packet_structs_header() -> str:
+    return dedent("""\
+        /* Minimal subset of structs we need for packet decode */
+        enum xe_sriov_packet_type {
+            XE_SRIOV_PACKET_TYPE_DESCRIPTOR = 1,
+            XE_SRIOV_PACKET_TYPE_TRAILER,
+            XE_SRIOV_PACKET_TYPE_GGTT,
+            XE_SRIOV_PACKET_TYPE_MMIO,
+            XE_SRIOV_PACKET_TYPE_GUC,
+            XE_SRIOV_PACKET_TYPE_VRAM,
+        };
+
+        struct xe_sriov_packet_hdr {
+            unsigned char       version;
+            unsigned char       type;
+            unsigned char       tile_id;
+            unsigned char       gt_id;
+            unsigned int        flags;
+            unsigned long long  offset;
+            unsigned long long  size;
+        };
+
+        struct xe_sriov_packet {
+            void                *xe;
+            void                *vaddr;
+            unsigned long       remaining;
+            unsigned long       hdr_remaining;
+            void                *bo;
+            struct xe_sriov_packet_hdr hdr;
+        };
+
+    """)
+
+
+def gen_begin() -> str:
+    """Generate the BEGIN block."""
+    return dedent(r"""
+        BEGIN
+        {
+            printf("Tracing VF events ... Hit Ctrl-C to end.\n");
+        }
+
+    """)
+
+
+# -----------------------------------------------------------------------------
+# Block generators
+# -----------------------------------------------------------------------------
+
+def gen_vfio_stop_copy_phase(probe_enabled, metric_enabled) -> str:
+    p_enter = "kprobe:xe_sriov_vfio_stop_copy_enter"
+    p_exit  = "kretprobe:xe_sriov_vfio_stop_copy_exit"
+
+    ev_enter = (
+        f'            printf("ts=%llu ev={p_enter} vf=%u save_id=%d\\n", nsecs, $vfid, $vfio_sid);'
+        if probe_enabled(p_enter) else ""
+    )
+
+    if probe_enabled(p_exit):
+        if metric_enabled("vfio_read_bytes"):
+            ev_exit = (
+                "            $rb = @vfio_read_bytes[$vfid,$vfio_sid];\n"
+                f'            printf("ts=%llu ev={p_exit} vf=%u save_id=%d ret=%d vfio_read_bytes=%llu dur_us=%llu\\n", '
+                "nsecs, $vfid, $vfio_sid, $ret, $rb, $dur_us);"
+            )
+        else:
+            ev_exit = (
+                f'            printf("ts=%llu ev={p_exit} vf=%u save_id=%d ret=%d dur_us=%llu\\n", '
+                "nsecs, $vfid, $vfio_sid, $ret, $dur_us);"
+            )
+    else:
+        ev_exit = ""
+
+    return dedent(f"""\
+        kprobe:xe_sriov_vfio_stop_copy_enter
+        {{
+            $vfid = (uint32)arg1;
+            @vfio_stop_copy_start[$vfid] = nsecs;
+            @vfio_stop_copy_vfid[tid]    = $vfid;
+
+            /* VFIO save epoch delimiter */
+            @vfio_save_id[$vfid] += 1;
+            $vfio_sid = @vfio_save_id[$vfid];
+{ev_enter}
+        }}
+
+        kretprobe:xe_sriov_vfio_stop_copy_exit
+        /@vfio_stop_copy_vfid[tid]/
+        {{
+            $vfid = @vfio_stop_copy_vfid[tid];
+            delete(@vfio_stop_copy_vfid[tid]);
+
+            $ret = (int32)retval;
+
+            $start = @vfio_stop_copy_start[$vfid];
+            $vfio_sid = @vfio_save_id[$vfid];
+            if ($start) {{
+                $dur_us = (nsecs - $start) / 1000;
+                @vfio_stop_copy_dur_us[$vfid,$vfio_sid] = $dur_us;
+                @vfio_stop_copy_dur_hist[$vfid] = hist($dur_us);
+                delete(@vfio_stop_copy_start[$vfid]);
+            }}
+{ev_exit}
+        }}
+
+    """)
+
+
+def gen_vfio_resume_data_phase(probe_enabled, metric_enabled) -> str:
+    p_enter = "kprobe:xe_sriov_vfio_resume_data_enter"
+    p_exit  = "kretprobe:xe_sriov_vfio_resume_data_exit"
+
+    ev_enter = (
+        f'            printf("ts=%llu ev={p_enter} vf=%u restore_id=%d\\n", nsecs, $vfid, $vfio_rid);'
+        if probe_enabled(p_enter) else ""
+    )
+
+    if probe_enabled(p_exit):
+        if metric_enabled("vfio_write_bytes"):
+            ev_exit = (
+                "            $wb = @vfio_write_bytes[$vfid,$vfio_rid];\n"
+                f'            printf("ts=%llu ev={p_exit} vf=%u restore_id=%d ret=%d vfio_write_bytes=%llu dur_us=%llu\\n", '
+                "nsecs, $vfid, $vfio_rid, $ret, $wb, $dur_us);"
+            )
+        else:
+            ev_exit = (
+                f'            printf("ts=%llu ev={p_exit} vf=%u restore_id=%d ret=%d dur_us=%llu\\n", '
+                "nsecs, $vfid, $vfio_rid, $ret, $dur_us);"
+            )
+    else:
+        ev_exit = ""
+
+    return dedent(f"""\
+        kprobe:xe_sriov_vfio_resume_data_enter
+        {{
+            $vfid = (uint32)arg1;
+            @vfio_resume_data_start[$vfid] = nsecs;
+            @vfio_resume_data_vfid[tid]    = $vfid;
+
+            /* VFIO restore epoch delimiter */
+            @vfio_restore_id[$vfid] += 1;
+            $vfio_rid = @vfio_restore_id[$vfid];
+{ev_enter}
+        }}
+
+        kretprobe:xe_sriov_vfio_resume_data_exit
+        /@vfio_resume_data_vfid[tid]/
+        {{
+            $vfid = @vfio_resume_data_vfid[tid];
+            delete(@vfio_resume_data_vfid[tid]);
+
+            $ret  = (int32)retval;
+            $start = @vfio_resume_data_start[$vfid];
+            $vfio_rid = @vfio_restore_id[$vfid];
+            if ($start) {{
+                $dur_us = (nsecs - $start) / 1000;
+                @vfio_resume_data_dur_us[$vfid,$vfio_rid] = $dur_us;
+                @vfio_resume_data_dur_hist[$vfid] = hist($dur_us);
+                delete(@vfio_resume_data_start[$vfid]);
+            }}
+{ev_exit}
+        }}
+
+    """)
+
+
+def gen_vfio_suspend_phase(probe_enabled, metric_enabled) -> str:
+    p_enter = "kprobe:xe_sriov_vfio_suspend_device"
+    p_exit  = "kretprobe:xe_sriov_vfio_suspend_device"
+
+    want_hist = metric_enabled("vfio_suspend_dur_hist")
+
+    ev_enter = (
+        f'            printf("ts=%llu ev={p_enter} vf=%u\\n", nsecs, $vfid);'
+        if probe_enabled(p_enter) else ""
+    )
+    ev_exit = (
+        f'            printf("ts=%llu ev={p_exit} vf=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $ret, $dur_us);'
+        if probe_enabled(p_exit) else ""
+    )
+
+    store = "            @vfio_suspend_dur_hist[$vfid] = hist($dur_us);" if want_hist else ""
+
+    return dedent(f"""\
+        kprobe:xe_sriov_vfio_suspend_device
+        {{
+            $vfid = (uint32)arg1;
+            @vfio_suspend_start[$vfid] = nsecs;
+            @vfio_suspend_vfid[tid]    = $vfid;
+{ev_enter}
+        }}
+
+        kretprobe:xe_sriov_vfio_suspend_device
+        /@vfio_suspend_vfid[tid]/
+        {{
+            $vfid = @vfio_suspend_vfid[tid];
+            delete(@vfio_suspend_vfid[tid]);
+
+            $ret  = (int32)retval;
+            $start = @vfio_suspend_start[$vfid];
+
+            $dur_us = 0;
+            if ($start) {{
+                $dur_us = (nsecs - $start) / 1000;
+{store if store else ""}
+                delete(@vfio_suspend_start[$vfid]);
+            }}
+{ev_exit}
+        }}
+
+    """)
+
+
+def gen_vfio_resume_phase(probe_enabled, metric_enabled) -> str:
+    p_enter = "kprobe:xe_sriov_vfio_resume_device"
+    p_exit  = "kretprobe:xe_sriov_vfio_resume_device"
+
+    want_hist = metric_enabled("vfio_resume_dur_hist")
+
+    ev_enter = (
+        f'            printf("ts=%llu ev={p_enter} vf=%u\\n", nsecs, $vfid);'
+        if probe_enabled(p_enter) else ""
+    )
+    ev_exit = (
+        f'            printf("ts=%llu ev={p_exit} vf=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $ret, $dur_us);'
+        if probe_enabled(p_exit) else ""
+    )
+
+    store = "            @vfio_resume_dur_hist[$vfid] = hist($dur_us);" if want_hist else ""
+
+    return dedent(f"""\
+        kprobe:xe_sriov_vfio_resume_device
+        {{
+            $vfid = (uint32)arg1;
+            @vfio_resume_start[$vfid] = nsecs;
+            @vfio_resume_vfid[tid]    = $vfid;
+{ev_enter}
+        }}
+
+        kretprobe:xe_sriov_vfio_resume_device
+        /@vfio_resume_vfid[tid]/
+        {{
+            $vfid = @vfio_resume_vfid[tid];
+            delete(@vfio_resume_vfid[tid]);
+
+            $ret  = (int32)retval;
+            $start = @vfio_resume_start[$vfid];
+
+            $dur_us = 0;
+            if ($start) {{
+                $dur_us = (nsecs - $start) / 1000;
+{store if store else ""}
+                delete(@vfio_resume_start[$vfid]);
+            }}
+{ev_exit}
+        }}
+
+    """)
+
+
+def gen_vfio_flr_wait_phase(probe_enabled, metric_enabled) -> str:
+    p_enter = "kprobe:xe_sriov_vfio_wait_flr_done"
+    p_exit  = "kretprobe:xe_sriov_vfio_wait_flr_done"
+
+    want_hist = metric_enabled("vfio_flr_wait_dur_hist")
+
+    ev_enter = (
+        f'            printf("ts=%llu ev={p_enter} vf=%u\\n", nsecs, $vfid);'
+        if probe_enabled(p_enter) else ""
+    )
+    ev_exit = (
+        f'            printf("ts=%llu ev={p_exit} vf=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $ret, $dur_us);'
+        if probe_enabled(p_exit) else ""
+    )
+
+    store = "            @vfio_flr_wait_dur_hist[$vfid] = hist($dur_us);" if want_hist else ""
+
+    return dedent(f"""\
+        kprobe:xe_sriov_vfio_wait_flr_done
+        {{
+            $vfid = (uint32)arg1;
+            @vfio_flr_wait_start[$vfid] = nsecs;
+            @vfio_flr_wait_vfid[tid]    = $vfid;
+{ev_enter}
+        }}
+
+        kretprobe:xe_sriov_vfio_wait_flr_done
+        /@vfio_flr_wait_vfid[tid]/
+        {{
+            $vfid = @vfio_flr_wait_vfid[tid];
+            delete(@vfio_flr_wait_vfid[tid]);
+
+            $ret  = (int32)retval;
+            $start = @vfio_flr_wait_start[$vfid];
+
+            $dur_us = 0;
+            if ($start) {{
+                $dur_us = (nsecs - $start) / 1000;
+{store if store else ""}
+                delete(@vfio_flr_wait_start[$vfid]);
+            }}
+{ev_exit}
+        }}
+
+    """)
+
+
+def gen_vfio_stop_copy_size(probe_enabled, metric_enabled) -> str:
+    p_exit = "kretprobe:xe_sriov_vfio_stop_copy_size"
+    want_hist = metric_enabled("vfio_stop_copy_size")
+
+    ev = (
+        f'            printf("ts=%llu ev={p_exit} vf=%u size=%lld dur_us=%llu\\n", nsecs, $vfid, $size, $dur_us);'
+        if probe_enabled(p_exit) else ""
+    )
+
+    store = "            @vfio_stop_copy_size[$vfid] = hist($size);" if want_hist else ""
+
+    return dedent(f"""\
+        kprobe:xe_sriov_vfio_stop_copy_size
+        {{
+            $vfid = (uint32)arg1;
+            @vfio_stop_copy_size_start[$vfid] = nsecs;
+            @vfio_stop_copy_size_vfid[tid]    = $vfid;
+        }}
+
+        kretprobe:xe_sriov_vfio_stop_copy_size
+        /@vfio_stop_copy_size_vfid[tid]/
+        {{
+            $vfid = @vfio_stop_copy_size_vfid[tid];
+            delete(@vfio_stop_copy_size_vfid[tid]);
+            $start = @vfio_stop_copy_size_start[$vfid];
+            delete(@vfio_stop_copy_size_start[$vfid]);
+
+            $dur_us = (nsecs - $start) / 1000;
+            $size   = (int64)retval;
+{store if store else ""}
+{ev}
+        }}
+
+    """)
+
+
+def gen_vfio_read_write(probe_enabled, metric_enabled) -> str:
+    p_r_exit = "kretprobe:xe_sriov_vfio_data_read"
+    p_w_exit = "kretprobe:xe_sriov_vfio_data_write"
+
+    want_read_bytes      = metric_enabled("vfio_read_bytes")
+    want_read_chunk_size = metric_enabled("vfio_read_chunk_size")
+    want_read_chunk_dur  = metric_enabled("vfio_read_chunk_dur_us")
+
+    want_write_bytes      = metric_enabled("vfio_write_bytes")
+    want_write_chunk_size = metric_enabled("vfio_write_chunk_size")
+    want_write_chunk_dur  = metric_enabled("vfio_write_chunk_dur_us")
+
+    ev_read = (
+        f'            printf("ts=%llu ev={p_r_exit} vf=%u save_id=%u bytes=%llu dur_us=%llu\\n", '
+        "nsecs, $vfid, $sid, $len, $dur_us);"
+        if probe_enabled(p_r_exit) else ""
+    )
+    ev_write = (
+        f'            printf("ts=%llu ev={p_w_exit} vf=%u restore_id=%u bytes=%llu dur_us=%llu\\n", '
+        "nsecs, $vfid, $rid, $len, $dur_us);"
+        if probe_enabled(p_w_exit) else ""
+    )
+
+    read_updates = []
+    if want_read_bytes:
+        read_updates.append("            @vfio_read_bytes[$vfid,$sid] += $len;")
+    if want_read_chunk_size:
+        read_updates.append("            @vfio_read_chunk_size[$vfid,$sid] = hist($len);")
+    if want_read_chunk_dur:
+        read_updates.append("            @vfio_read_chunk_dur_us[$vfid,$sid] = hist($dur_us);")
+    read_upd = "\n".join(read_updates)
+
+    write_updates = []
+    if want_write_bytes:
+        write_updates.append("            @vfio_write_bytes[$vfid,$rid] += $len;")
+    if want_write_chunk_size:
+        write_updates.append("            @vfio_write_chunk_size[$vfid,$rid] = hist($len);")
+    if want_write_chunk_dur:
+        write_updates.append("            @vfio_write_chunk_dur_us[$vfid,$rid] = hist($dur_us);")
+    write_upd = "\n".join(write_updates)
+
+    return dedent(f"""\
+        kprobe:xe_sriov_vfio_data_read
+        {{
+            @xe_sriov_vfio_data_read_vfid[tid]   = (uint32)arg1;
+            @xe_sriov_vfio_data_read_len[tid]    = (uint64)arg3;  /* xe, vfid, buf, len */
+            @xe_sriov_vfio_data_read_start[tid]  = nsecs;
+        }}
+
+        kretprobe:xe_sriov_vfio_data_read
+        /@xe_sriov_vfio_data_read_start[tid]/
+        {{
+            $vfid = @xe_sriov_vfio_data_read_vfid[tid];
+            delete(@xe_sriov_vfio_data_read_vfid[tid]);
+            $len = @xe_sriov_vfio_data_read_len[tid];
+            delete(@xe_sriov_vfio_data_read_len[tid]);
+
+            $sid = @vfio_save_id[$vfid];
+
+            $start = @xe_sriov_vfio_data_read_start[tid];
+            $dur_us = (nsecs - $start) / 1000;
+            delete(@xe_sriov_vfio_data_read_start[tid]);
+
+{read_upd if read_upd else ""}
+{ev_read}
+        }}
+
+        kprobe:xe_sriov_vfio_data_write
+        {{
+            @xe_sriov_vfio_data_write_vfid[tid]  = (uint32)arg1;
+            @xe_sriov_vfio_data_write_len[tid]   = (uint64)arg3;  /* xe, vfid, buf, len */
+            @xe_sriov_vfio_data_write_start[tid] = nsecs;
+        }}
+
+        kretprobe:xe_sriov_vfio_data_write
+        /@xe_sriov_vfio_data_write_start[tid]/
+        {{
+            $vfid = @xe_sriov_vfio_data_write_vfid[tid];
+            delete(@xe_sriov_vfio_data_write_vfid[tid]);
+            $len = @xe_sriov_vfio_data_write_len[tid];
+            delete(@xe_sriov_vfio_data_write_len[tid]);
+
+            $rid = @vfio_restore_id[$vfid];
+
+            $start = @xe_sriov_vfio_data_write_start[tid];
+            $dur_us = (nsecs - $start) / 1000;
+            delete(@xe_sriov_vfio_data_write_start[tid]);
+
+{write_upd if write_upd else ""}
+{ev_write}
+        }}
+
+    """)
+
+
+def gen_vfio_error(probe_enabled, metric_enabled) -> str:
+    p = "kprobe:xe_sriov_vfio_error"
+    want_count = metric_enabled("vfio_error_count")
+
+    ev = (
+        f'            printf("ts=%llu ev={p} vf=%u\\n", nsecs, $vfid);'
+        if probe_enabled(p) else ""
+    )
+
+    store = "            @vfio_error_count[$vfid] = count();" if want_count else ""
+
+    return dedent(f"""\
+        kprobe:xe_sriov_vfio_error
+        {{
+            $vfid = (uint32)arg1;
+{store if store else ""}
+{ev}
+        }}
+
+    """)
+
+
+def gen_xe_control_save_restore(probe_enabled, metric_enabled) -> str:
+    p_save_start = "kprobe:xe_sriov_pf_control_trigger_save_vf"
+    p_save_end   = "kretprobe:xe_sriov_pf_control_finish_save_vf"
+    p_rest_start = "kprobe:xe_sriov_pf_control_trigger_restore_vf"
+    p_rest_end   = "kretprobe:xe_sriov_pf_control_finish_restore_vf"
+
+    want_save_start = metric_enabled("xe_save_start_ts")
+    want_save_end   = metric_enabled("xe_save_end_ts")
+    want_save_dur   = metric_enabled("xe_save_dur_us")
+
+    want_rest_start = metric_enabled("xe_restore_start_ts")
+    want_rest_end   = metric_enabled("xe_restore_end_ts")
+    want_rest_dur   = metric_enabled("xe_restore_dur_us")
+
+    # We must record start_ts if either:
+    # - user wants it as a metric, OR
+    # - user wants duration metric, OR
+    # - user wants an end event that prints dur_us (needs start_ts).
+    need_save_start_ts_for_window = want_save_start or want_save_dur or probe_enabled(p_save_end)
+    need_rest_start_ts_for_window = want_rest_start or want_rest_dur or probe_enabled(p_rest_end)
+
+    ev_save_start = (
+        f'            printf("ts=%llu ev={p_save_start} vf=%u save_id=%u\\n", nsecs, $vfid, $sid);'
+        if probe_enabled(p_save_start) else ""
+    )
+    ev_save_end = (
+        f'            printf("ts=%llu ev={p_save_end} vf=%u save_id=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $sid, $ret, $dur_us);'
+        if probe_enabled(p_save_end) else ""
+    )
+    ev_rest_start = (
+        f'            printf("ts=%llu ev={p_rest_start} vf=%u restore_id=%u\\n", nsecs, $vfid, $rid);'
+        if probe_enabled(p_rest_start) else ""
+    )
+    ev_rest_end = (
+        f'            printf("ts=%llu ev={p_rest_end} vf=%u restore_id=%u ret=%d dur_us=%llu\\n", nsecs, $vfid, $rid, $ret, $dur_us);'
+        if probe_enabled(p_rest_end) else ""
+    )
+
+    save_start_store = "            @xe_save_start_ts[$vfid,$sid] = nsecs;" if (need_save_start_ts_for_window and want_save_start) else ""
+
+    if need_save_start_ts_for_window and not want_save_start:
+        save_start_store = "            @xe_save_start_ts[$vfid,$sid] = nsecs;"
+
+    rest_start_store = "            @xe_restore_start_ts[$vfid,$rid] = nsecs;" if (need_rest_start_ts_for_window and want_rest_start) else ""
+    if need_rest_start_ts_for_window and not want_rest_start:
+        rest_start_store = "            @xe_restore_start_ts[$vfid,$rid] = nsecs;"
+
+    save_end_store_lines = []
+    if want_save_end:
+        save_end_store_lines.append("            @xe_save_end_ts[$vfid,$sid] = nsecs;")
+    if want_save_dur:
+        save_end_store_lines.append("            @xe_save_dur_us[$vfid,$sid] = $dur_us;")
+    save_end_store = "\n".join(save_end_store_lines)
+
+    rest_end_store_lines = []
+    if want_rest_end:
+        rest_end_store_lines.append("            @xe_restore_end_ts[$vfid,$rid] = nsecs;")
+    if want_rest_dur:
+        rest_end_store_lines.append("            @xe_restore_dur_us[$vfid,$rid] = $dur_us;")
+    rest_end_store = "\n".join(rest_end_store_lines)
+
+    return dedent(f"""\
+        kprobe:xe_sriov_pf_control_trigger_save_vf
+        {{
+            $vfid = (uint32)arg1;
+            @xe_save_id[$vfid] += 1;
+            $sid  = @xe_save_id[$vfid];
+{save_start_store if save_start_store else ""}
+{ev_save_start}
+        }}
+
+        kprobe:xe_sriov_pf_control_finish_save_vf
+        {{
+            @xe_finish_save_vfid[tid] = (uint32)arg1;
+        }}
+
+        kretprobe:xe_sriov_pf_control_finish_save_vf
+        /@xe_finish_save_vfid[tid]/
+        {{
+            $vfid = @xe_finish_save_vfid[tid];
+            delete(@xe_finish_save_vfid[tid]);
+
+            $ret = (int32)retval;
+
+            $sid = @xe_save_id[$vfid];
+
+            $dur_us = 0;
+            $start = @xe_save_start_ts[$vfid,$sid];
+            if ($start) {{
+                $dur_us = (nsecs - $start) / 1000;
+            }}
+
+{save_end_store if save_end_store else ""}
+{ev_save_end}
+        }}
+
+        kprobe:xe_sriov_pf_control_trigger_restore_vf
+        {{
+            $vfid = (uint32)arg1;
+            @xe_restore_id[$vfid] += 1;
+            $rid  = @xe_restore_id[$vfid];
+{rest_start_store if rest_start_store else ""}
+{ev_rest_start}
+        }}
+
+        kprobe:xe_sriov_pf_control_finish_restore_vf
+        {{
+            @xe_finish_restore_vfid[tid] = (uint32)arg1;
+        }}
+
+        kretprobe:xe_sriov_pf_control_finish_restore_vf
+        /@xe_finish_restore_vfid[tid]/
+        {{
+            $vfid = @xe_finish_restore_vfid[tid];
+            delete(@xe_finish_restore_vfid[tid]);
+
+            $ret = (int32)retval;
+
+            $rid = @xe_restore_id[$vfid];
+
+            $dur_us = 0;
+            $start = @xe_restore_start_ts[$vfid,$rid];
+            if ($start) {{
+                $dur_us = (nsecs - $start) / 1000;
+            }}
+
+{rest_end_store if rest_end_store else ""}
+{ev_rest_end}
+        }}
+
+        """)
+
+
+def gen_xe_restore_packets(probe_enabled, metric_enabled) -> str:
+    want_bytes    = metric_enabled("xe_restore_bytes")
+    want_first_ts = metric_enabled("xe_restore_first_ts")
+    want_last_ts  = metric_enabled("xe_restore_last_ts")
+    want_pkt_dur  = metric_enabled("xe_restore_pkt_dur_us")
+    want_pkt_size = metric_enabled("xe_restore_pkt_size")
+
+    def one(pfx: str, probe: str) -> str:
+        p_exit = f"kretprobe:{probe}"
+
+        ev_print = (
+            f'                    printf("ts=%llu ev={p_exit} vf=%u restore_id=%u pkt_type=%u tile=%u gt=%u offset=%llu size=%llu dur_us=%llu\\n", '
+            "nsecs, $vfid, $rid, $type, $tile, $gtid, $off, $size, $dur_us);"
+            if probe_enabled(p_exit) else ""
+        )
+
+        store_lines: List[str] = []
+
+        if want_bytes:
+            store_lines.append("                        @xe_restore_bytes[$vfid, $rid, $tile, $gtid, $type] += $size;")
+
+        if want_first_ts:
+            store_lines.append(
+                "                        if (@xe_restore_first_ts[$vfid, $rid, $tile, $gtid, $type] == 0) {"
+                " @xe_restore_first_ts[$vfid, $rid, $tile, $gtid, $type] = nsecs; }"
+            )
+
+        if want_last_ts:
+            store_lines.append("                        @xe_restore_last_ts[$vfid, $rid, $tile, $gtid, $type] = nsecs;")
+
+        if want_pkt_dur:
+            store_lines.append("                        if ($dur_us > 0) { @xe_restore_pkt_dur_us[$vfid, $rid, $type] = hist($dur_us); }")
+
+        if want_pkt_size:
+            store_lines.append("                        @xe_restore_pkt_size[$vfid, $rid, $type] = hist($size);")
+
+        store = "\n".join(store_lines)
+
+        return dedent(f"""\
+            kprobe:{probe}
+            {{
+                @{pfx}_restore_vfid[tid]       = (uint32)arg1;
+                @{pfx}_restore_pkt[tid]        = (uint64)arg2;
+                @{pfx}_restore_call_start[tid] = nsecs;
+            }}
+
+            kretprobe:{probe}
+            /@{pfx}_restore_call_start[tid]/
+            {{
+                $vfid     = @{pfx}_restore_vfid[tid];
+                $pkt_addr = @{pfx}_restore_pkt[tid];
+                $ret32    = (int32)retval;
+
+                delete(@{pfx}_restore_vfid[tid]);
+                delete(@{pfx}_restore_pkt[tid]);
+
+                $start  = @{pfx}_restore_call_start[tid];
+                $dur_us = (nsecs - $start) / 1000;
+                delete(@{pfx}_restore_call_start[tid]);
+
+                if ($pkt_addr != 0 && $ret32 == 0) {{
+                    $pkt   = (struct xe_sriov_packet *)$pkt_addr;
+                    $type  = $pkt->hdr.type;
+                    $tile  = $pkt->hdr.tile_id;
+                    $gtid  = $pkt->hdr.gt_id;
+                    $off   = $pkt->hdr.offset;
+                    $size  = $pkt->hdr.size;
+
+                    $rid = @xe_restore_id[$vfid];
+
+{ev_print}
+                    if ($rid > 0) {{
+{store if store else ""}
+                    }}
+                }}
+            }}
+
+        """)
+
+    return (
+        one("vram", "xe_gt_sriov_pf_migration_vram_restore")
+        + one("ggtt", "xe_gt_sriov_pf_migration_ggtt_restore")
+        + one("guc",  "xe_gt_sriov_pf_migration_guc_restore")
+        + one("mmio", "xe_gt_sriov_pf_migration_mmio_restore")
+    )
+
+
+def gen_xe_save_packets(probe_enabled, metric_enabled) -> str:
+    p_exit = "kretprobe:xe_gt_sriov_pf_migration_save_produce"
+
+    want_bytes    = metric_enabled("xe_save_produce_bytes")
+    want_first_ts = metric_enabled("xe_save_produce_first_ts")
+    want_last_ts  = metric_enabled("xe_save_produce_last_ts")
+    want_pkt_dur  = metric_enabled("xe_save_produce_pkt_dur_us")
+    want_pkt_size = metric_enabled("xe_save_produce_pkt_size")
+
+    ev_pkt_save = (
+        '                $probe = "kretprobe:xe_gt_sriov_pf_migration_save_produce";\n'
+        '                printf("ts=%llu ev=%s vf=%u save_id=%u pkt_type=%u tile=%u gt=%u offset=%llu size=%llu dur_us=%llu\\n",\n'
+        '                       nsecs, $probe, $vfid, $sid, $type, $tile, $gtid, $offset, $size, $dur_us);'
+        if probe_enabled(p_exit) else ""
+    )
+
+    store_lines = []
+    if want_bytes:
+        store_lines.append("                    @xe_save_produce_bytes[$vfid, $sid, $tile, $gtid, $type] += $size;")
+    if want_first_ts:
+        store_lines.append(
+            "                    if (@xe_save_produce_first_ts[$vfid, $sid, $tile, $gtid, $type] == 0) {"
+            " @xe_save_produce_first_ts[$vfid, $sid, $tile, $gtid, $type] = $start; }"
+        )
+    if want_last_ts:
+        store_lines.append("                    @xe_save_produce_last_ts[$vfid, $sid, $tile, $gtid, $type] = nsecs;")
+    if want_pkt_dur:
+        store_lines.append("                    if ($dur_us > 0) { @xe_save_produce_pkt_dur_us[$vfid, $sid, $type] = hist($dur_us); }")
+    if want_pkt_size:
+        store_lines.append("                    @xe_save_produce_pkt_size[$vfid, $sid, $type] = hist($size);")
+    store = "\n".join(store_lines)
+
+    return dedent(f"""\
+        kprobe:xe_gt_sriov_pf_migration_ggtt_save
+        {{
+            $vfid = (uint32)arg1;
+            @save_start[tid, XE_SRIOV_PACKET_TYPE_GGTT] = nsecs;
+        }}
+
+        kprobe:xe_gt_sriov_pf_migration_mmio_save
+        {{
+            $vfid = (uint32)arg1;
+            @save_start[tid, XE_SRIOV_PACKET_TYPE_MMIO] = nsecs;
+        }}
+
+        kprobe:xe_gt_sriov_pf_migration_guc_save
+        {{
+            $vfid = (uint32)arg1;
+            @save_start[tid, XE_SRIOV_PACKET_TYPE_GUC] = nsecs;
+        }}
+
+        kprobe:xe_gt_sriov_pf_migration_vram_save
+        {{
+            $vfid = (uint32)arg1;
+            @save_start[tid, XE_SRIOV_PACKET_TYPE_VRAM] = nsecs;
+        }}
+
+        kprobe:xe_gt_sriov_pf_migration_save_produce
+        {{
+            @cur_vfid[tid]    = (uint64)arg1;
+            @cur_pkt_ptr[tid] = (uint64)arg2;
+        }}
+
+        kretprobe:xe_gt_sriov_pf_migration_save_produce
+        /@cur_pkt_ptr[tid]/
+        {{
+            $ret32    = (int32)retval;
+            $pkt_addr = @cur_pkt_ptr[tid];
+            $vfid64   = @cur_vfid[tid];
+
+            delete(@cur_pkt_ptr[tid]);
+            delete(@cur_vfid[tid]);
+
+            if ($pkt_addr != 0 && $ret32 == 0) {{
+                $pkt  = (struct xe_sriov_packet *)$pkt_addr;
+                $vfid = (uint32)$vfid64;
+
+                $type   = $pkt->hdr.type;
+                $tile   = $pkt->hdr.tile_id;
+                $gtid   = $pkt->hdr.gt_id;
+                $offset = $pkt->hdr.offset;
+                $size   = $pkt->hdr.size;
+
+                $start = @save_start[tid, $type];
+                if ($start) {{
+                    $dur_us = (nsecs - $start) / 1000;
+                    delete(@save_start[tid, $type]);
+                }} else {{
+                    $dur_us = 0;
+                }}
+
+                $sid = @xe_save_id[$vfid];
+
+{ev_pkt_save}
+                if ($sid > 0) {{
+{store if store else ""}
+                }}
+            }}
+        }}
+
+        """)
+
+
+def gen_end_block(metric_enabled: Callable[[str], bool]) -> str:
+    def emit_metric_lines(metric: str) -> str:
+        return f"    print(@{metric});\n    clear(@{metric});\n"
+
+    sections = [
+        ("VFIO stop-copy duration per vf,save_id", [
+            "vfio_stop_copy_dur_us",
+            "vfio_stop_copy_dur_hist",
+            "vfio_stop_copy_size",
+        ]),
+        ("VFIO resume-data duration per vf,restore_id", [
+            "vfio_resume_data_dur_us",
+            "vfio_resume_data_dur_hist",
+        ]),
+        ("VFIO suspend/resume per vf (us)", [
+            "vfio_suspend_dur_hist",
+            "vfio_resume_dur_hist",
+        ]),
+        ("VFIO wait FLR durations per vf (us)", [
+            "vfio_flr_wait_dur_hist",
+        ]),
+        ("VFIO migration data per vf,save_id/restore_id", [
+            "vfio_read_bytes",
+            "vfio_read_chunk_size",
+            "vfio_read_chunk_dur_us",
+            "vfio_write_bytes",
+            "vfio_write_chunk_size",
+            "vfio_write_chunk_dur_us",
+        ]),
+        ("VFIO error count per vf", [
+            "vfio_error_count",
+        ]),
+        ("Xe save duration per vf,save_id", [
+            "xe_save_dur_us",
+            "xe_save_start_ts",
+            "xe_save_end_ts",
+        ]),
+        ("Xe save bytes per vf,save_id,tile,gt,type", [
+            "xe_save_produce_bytes",
+        ]),
+        ("Xe save first_ts per vf,save_id,tile,gt,type (ns)", [
+            "xe_save_produce_first_ts",
+        ]),
+        ("Xe save last_ts per vf,save_id,tile,gt,type (ns)", [
+            "xe_save_produce_last_ts",
+        ]),
+        ("Xe save produce packet durations per vf,save_id,type", [
+            "xe_save_produce_pkt_dur_us",
+        ]),
+        ("Xe save packet size per vf,save_id,type", [
+            "xe_save_produce_pkt_size",
+        ]),
+        ("Xe restore duration per vf,restore_id", [
+            "xe_restore_dur_us",
+            "xe_restore_start_ts",
+            "xe_restore_end_ts",
+        ]),
+        ("Xe restore packet per vf,restore_id,tile,gt,type", [
+            "xe_restore_bytes",
+        ]),
+        ("Xe restore packet first_ts per vf,restore_id,tile,gt,type (ns)", [
+            "xe_restore_first_ts",
+        ]),
+        ("Xe restore packet last_ts per vf,restore_id,tile,gt,type (ns)", [
+            "xe_restore_last_ts",
+        ]),
+        ("Xe restore packet duration per vf,restore_id,type", [
+            "xe_restore_pkt_dur_us",
+        ]),
+        ("Xe restore packet size per vf,restore_id,type", [
+            "xe_restore_pkt_size",
+        ]),
+    ]
+
+    out = "END\n{\n"
+    for title, metrics in sections:
+        enabled = [m for m in metrics if metric_enabled(m)]
+        if not enabled:
+            continue
+        out += f'    printf("\\n=== {title} ===\\n");\n'
+        for m in enabled:
+            out += emit_metric_lines(m)
+        out += "\n"
+    out += "}\n"
+
+    return out
+
+
+# -----------------------------------------------------------------------------
+# Block registry
+# -----------------------------------------------------------------------------
+def build_blocks() -> List[Block]:
+    """
+    Build and return the registry of available tracing blocks.
+
+    Each block defines its probe set, provided metrics, dependencies, and
+    a generator function that emits the corresponding bpftrace code.
+    """
+    return [
+        Block(
+            name="vfio_stop_copy_phase",
+            probes=["kprobe:xe_sriov_vfio_stop_copy_enter",
+                    "kretprobe:xe_sriov_vfio_stop_copy_exit"],
+            provides={"vfio_stop_copy_dur_us", "vfio_stop_copy_dur_hist"},
+            requires=set(),
+            gen=gen_vfio_stop_copy_phase,
+        ),
+        Block(
+            name="vfio_resume_data_phase",
+            probes=["kprobe:xe_sriov_vfio_resume_data_enter",
+                    "kretprobe:xe_sriov_vfio_resume_data_exit"],
+            provides={"vfio_resume_data_dur_us", "vfio_resume_data_dur_hist"},
+            requires=set(),
+            gen=gen_vfio_resume_data_phase,
+        ),
+        Block(
+            name="vfio_suspend_phase",
+            probes=["kprobe:xe_sriov_vfio_suspend_device",
+                    "kretprobe:xe_sriov_vfio_suspend_device"],
+            provides={"vfio_suspend_dur_hist"},
+            requires=set(),
+            gen=gen_vfio_suspend_phase,
+        ),
+        Block(
+            name="vfio_resume_phase",
+            probes=["kprobe:xe_sriov_vfio_resume_device",
+                    "kretprobe:xe_sriov_vfio_resume_device"],
+            provides={"vfio_resume_dur_hist"},
+            requires=set(),
+            gen=gen_vfio_resume_phase,
+        ),
+        Block(
+            name="vfio_flr_wait_phase",
+            probes=["kprobe:xe_sriov_vfio_wait_flr_done",
+                    "kretprobe:xe_sriov_vfio_wait_flr_done"],
+            provides={"vfio_flr_wait_dur_hist"},
+            requires=set(),
+            gen=gen_vfio_flr_wait_phase,
+        ),
+        Block(
+            name="vfio_stop_copy_size",
+            probes=["kprobe:xe_sriov_vfio_stop_copy_size",
+                    "kretprobe:xe_sriov_vfio_stop_copy_size"],
+            provides={"vfio_stop_copy_size"},
+            requires=set(),
+            gen=gen_vfio_stop_copy_size,
+        ),
+        Block(
+            name="vfio_read_write",
+            probes=[
+                "kprobe:xe_sriov_vfio_data_read",
+                "kretprobe:xe_sriov_vfio_data_read",
+                "kprobe:xe_sriov_vfio_data_write",
+                "kretprobe:xe_sriov_vfio_data_write",
+            ],
+            provides={
+                "vfio_read_bytes", "vfio_read_chunk_size", "vfio_read_chunk_dur_us",
+                "vfio_write_bytes", "vfio_write_chunk_size", "vfio_write_chunk_dur_us",
+            },
+            requires={"vfio_stop_copy_phase", "vfio_resume_data_phase"},
+            gen=gen_vfio_read_write,
+        ),
+        Block(
+            name="vfio_error",
+            probes=["kprobe:xe_sriov_vfio_error"],
+            provides={"vfio_error_count"},
+            requires=set(),
+            gen=gen_vfio_error,
+        ),
+        Block(
+            name="xe_control_save_restore",
+            probes=[
+                "kprobe:xe_sriov_pf_control_trigger_save_vf",
+                "kprobe:xe_sriov_pf_control_finish_save_vf",
+                "kprobe:xe_sriov_pf_control_trigger_restore_vf",
+                "kprobe:xe_sriov_pf_control_finish_restore_vf",
+            ],
+            provides={"xe_save_start_ts", "xe_save_end_ts", "xe_save_dur_us",
+                      "xe_restore_start_ts", "xe_restore_end_ts", "xe_restore_dur_us"},
+            requires=set(),
+            gen=gen_xe_control_save_restore,
+        ),
+        Block(
+            name="xe_restore_packets",
+            probes=[
+                "kprobe:xe_gt_sriov_pf_migration_vram_restore",
+                "kretprobe:xe_gt_sriov_pf_migration_vram_restore",
+                "kprobe:xe_gt_sriov_pf_migration_ggtt_restore",
+                "kretprobe:xe_gt_sriov_pf_migration_ggtt_restore",
+                "kprobe:xe_gt_sriov_pf_migration_guc_restore",
+                "kretprobe:xe_gt_sriov_pf_migration_guc_restore",
+                "kprobe:xe_gt_sriov_pf_migration_mmio_restore",
+                "kretprobe:xe_gt_sriov_pf_migration_mmio_restore",
+            ],
+            provides={"xe_restore_bytes", "xe_restore_first_ts", "xe_restore_last_ts",
+                      "xe_restore_pkt_dur_us", "xe_restore_pkt_size"},
+            requires=set(),
+            gen=gen_xe_restore_packets,
+            needs_packet_structs=True,
+        ),
+        Block(
+            name="xe_save_packets",
+            probes=[
+                "kprobe:xe_gt_sriov_pf_migration_ggtt_save",
+                "kprobe:xe_gt_sriov_pf_migration_mmio_save",
+                "kprobe:xe_gt_sriov_pf_migration_guc_save",
+                "kprobe:xe_gt_sriov_pf_migration_vram_save",
+                "kprobe:xe_gt_sriov_pf_migration_save_produce",
+                "kretprobe:xe_gt_sriov_pf_migration_save_produce",
+            ],
+            provides={"xe_save_produce_bytes", "xe_save_produce_first_ts",
+                      "xe_save_produce_last_ts", "xe_save_produce_pkt_dur_us",
+                      "xe_save_produce_pkt_size"},
+            requires=set(),
+            gen=gen_xe_save_packets,
+            needs_packet_structs=True,
+        ),
+    ]
+
+
+def invert_metric_sources(blocks: List[Block]) -> Dict[str, List[str]]:
+    """Build metric->providers mapping from block registry."""
+    metric_src: Dict[str, List[str]] = {m: [] for m in ALL_METRICS}
+    for b in blocks:
+        for m in b.provides:
+            if m in metric_src:
+                metric_src[m].append(b.name)
+    return metric_src
+
+
+def select_blocks(blocks: List[Block],
+                  metric_enabled: NameFilter,
+                  probe_enabled: NameFilter) -> List[Block]:
+    """Select blocks based on enabled metrics/probes and dependency closure."""
+    enabled_metrics = {m for m in ALL_METRICS if metric_enabled(m)}
+    by_name: Dict[str, Block] = {b.name: b for b in blocks}
+
+    selected: Set[str] = set()
+
+    for b in blocks:
+        if b.provides & enabled_metrics:
+            selected.add(b.name)
+        elif any(probe_enabled(p) for p in b.probes):
+            selected.add(b.name)
+
+    # dependency closure
+    changed = True
+    while changed:
+        changed = False
+        for name in list(selected):
+            b = by_name.get(name)
+            if not b:
+                continue
+            for dep in b.requires:
+                if dep not in selected:
+                    selected.add(dep)
+                    changed = True
+
+    return [b for b in blocks if b.name in selected]
+
+
+def build_arg_parser() -> argparse.ArgumentParser:
+    """Create the command-line argument parser."""
+    ap = argparse.ArgumentParser(description="Generate Xe VF events bpftrace script")
+    ap.add_argument("output", nargs="?", help="output .bt file; if omitted, write to stdout")
+
+    ap.add_argument("--events",
+                    default="*",
+                    help="Comma-separated event globs. Default: '*'")
+    ap.add_argument("--omit-events",
+                    default="*:xe_sriov_vfio_data_*",
+                    help="Comma-separated event globs to exclude (applied after --events). "
+                         "Default: '*:xe_sriov_vfio_data_*'")
+
+    ap.add_argument("--metrics",
+                    help="Comma-separated metric globs, e.g. 'vfio_*,xe_*' or '*'. Default: '*'.")
+    ap.add_argument("--omit-metrics",
+                    help="Comma-separated metric globs to exclude (applied after --metrics). "
+                         "Example: --metrics='*' --omit-metrics='*_pkt_size'")
+
+    ap.add_argument("--list-events", action="store_true",
+                    help="List available probe specs and exit.")
+    ap.add_argument("--list-metrics", action="store_true",
+                    help="List available metric names and exit.")
+    ap.add_argument("--list-blocks", action="store_true", help="List available blocks and exit.")
+    ap.add_argument("--list-probes", action="store_true", help="List probes per block and exit.")
+    ap.add_argument("--list-metric-sources", action="store_true",
+                    help="List which block(s) provide each metric.")
+
+    return ap
+
+
+def handle_list_modes(
+    args: argparse.Namespace,
+    blocks: List[Block],
+    metric_src: Dict[str, List[str]],
+) -> int | None:
+    """Handle --list-* modes. Returns exit code, or None if not in list-mode."""
+    if args.list_events:
+        all_probes = sorted({p for blk in blocks for p in blk.probes})
+        print("\n".join(all_probes))
+        return 0
+
+    if args.list_metrics:
+        for metric in METRIC_DEFS:
+            print(f"{metric.name}\n  {metric.desc}")
+        return 0
+
+    if args.list_blocks:
+        for blk in blocks:
+            print(blk.name)
+        return 0
+
+    if args.list_probes:
+        for blk in blocks:
+            print(f"{blk.name}:")
+            for probe in blk.probes:
+                print(f"  {probe}")
+        return 0
+
+    if args.list_metric_sources:
+        for metric in ALL_METRICS:
+            src = metric_src.get(metric, [])
+            src_s = ", ".join(src) if src else "(none)"
+            print(f"{metric}: {src_s}")
+        return 0
+
+    return None
+
+
+def build_filters(args: argparse.Namespace) -> tuple[NameFilter, NameFilter]:
+    """Create probe_enabled and metric_enabled filters from CLI args."""
+    probe_patterns = parse_patterns(args.events)
+    omit_probe_patterns = parse_patterns(args.omit_events)
+    probe_enabled = make_name_filter_with_omit(
+        probe_patterns,
+        default_include=['*'],
+        omit_pats=omit_probe_patterns,
+    )
+
+    metric_patterns = parse_patterns(args.metrics)
+    omit_metric_patterns = parse_patterns(args.omit_metrics)
+    metric_enabled = make_name_filter_with_omit(
+        metric_patterns,
+        default_include=['*'],
+        omit_pats=omit_metric_patterns,
+    )
+
+    return probe_enabled, metric_enabled
+
+
+def write_output(text: str, output_path: str | None) -> None:
+    """Write generated output to a file or stdout."""
+    if output_path:
+        with open(output_path, "w", encoding="utf-8") as out:
+            out.write(text)
+        return
+    sys.stdout.write(text)
+
+
+def main(argv=None) -> int:
+    """Program entry point."""
+    parser = build_arg_parser()
+    args = parser.parse_args(argv)
+
+    blocks = build_blocks()
+    metric_src = invert_metric_sources(blocks)
+
+    list_rc = handle_list_modes(args, blocks, metric_src)
+    if list_rc is not None:
+        return list_rc
+
+    probe_enabled, metric_enabled = build_filters(args)
+
+    selected_blocks = select_blocks(blocks, metric_enabled, probe_enabled)
+    need_pkt_structs = any(b.needs_packet_structs for b in selected_blocks)
+
+    parts: List[str] = [gen_preamble()]
+    if need_pkt_structs:
+        parts.append(gen_packet_structs_header())
+    parts.append(gen_begin())
+
+    for b in selected_blocks:
+        parts.append(b.gen(probe_enabled, metric_enabled))
+
+    parts.append(gen_end_block(metric_enabled))
+
+    write_output("".join(parts), args.output)
+    return 0
+
+
+if __name__ == "__main__":
+    raise SystemExit(main())
-- 
2.43.0

