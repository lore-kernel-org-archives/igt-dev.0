Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3D0F433CD
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 22:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C208E10E1FA;
	Wed, 15 Apr 2026 22:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5PGDElw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDEC10E1FA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 22:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776290853; x=1807826853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qHXo3tPjf2Z+rGRf7J58ewiF/BBPRjELD9l8I9r3jAA=;
 b=g5PGDElw9Ais6NNfcai0O+KcapvRT+kKDJFo2bHXEHcFlcCZ6haUz3Ob
 I0kq9TAhmkhsPelj/G5cmFApxVKtiC9Xsfalro97EAhlr6m58vZ8GWjLH
 ya2S3Kxq9mpLrpVGtMAEsdpX19BuPBNSJvROd77FQieqxL62ZC8d2BI66
 XMC1pcR0EjRX/REIJK0tXk8/9Qz7Kb0Pam7JJzOTf1GBwd9bL67A4IW8Y
 NoObIIPDYqEKOLlLMJ0ZAvNI+aHcV8R7T9c9qxYbd5m843/lNXKM1lUE9
 y31AkEx8RgWQJbnCXaecDN1Yvz5EIvPuQ/UmFVkP8LwhHP9MG/nWEglP5 w==;
X-CSE-ConnectionGUID: VwW5nwgPReye6LzVOBPCXw==
X-CSE-MsgGUID: OUEeCK60SfCuLo14e+T8/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77397165"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77397165"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:33 -0700
X-CSE-ConnectionGUID: C/srZbFDQe+1EGdlxxNiAg==
X-CSE-MsgGUID: 1Dca09YmSTO3V0I3mgbRiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234926090"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:31 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 01/10] lib/intel/genxml: Add genxml generators, headers,
 and build integration
Date: Thu, 16 Apr 2026 00:07:11 +0200
Message-Id: <20260415220720.1594414-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415220720.1594414-1-jan.maslak@intel.com>
References: <20260415220720.1594414-1-jan.maslak@intel.com>
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

Currently IGT uses raw intel_bb_out() calls for setting up the render /
compute pipelines. Fields are set by shifting and OR-ing hand-computed
constants, with field names and bit positions hardcoded and sometimes
explained in comments. A lot of code has branching based on generations,
making pipeline setup more complex as the new generations come in.

Meanwhile Mesa uses a system called genxml in which XML files describe GPU
commands, state objects, enums, and registers - specifying the field layout
down to individual bits. A Python generator then produces C headers with
typed structs, pack functions, and named constants for each command/state.

By bringing genxml to IGT, we can achieve a more maintainable and less
error-prone codebase. Instead of manually calculating bit positions and
creating complex branching logic, we can fill out the structs generated
from XML descriptions, and the packing functions will handle the bit
manipulation automatically.

Import gen_pack_header.py and intel_genxml.py from Mesa (MIT-licensed, Mesa
commit 3a62dc0218d3). Add gen_decode_header.py written for IGT.
Add igt_genxml.h, igt_genxml_defs.h, and igt_genxml_decode.h written for IGT.
Wire everything into the Meson build in lib/meson.build.

gen_pack_header.py produces type-safe pack and emit functions for every
command, struct, and register defined in the XML.  Callers fill a typed
C struct and call the generated pack function; the generator handles all
bit-field packing and relocation recording.

gen_decode_header.py (new, IGT-only) produces decoders that identify a
command from its opcode and print each decoded field's name and value,
including structs and registers embedded within commands.

IGT-specific changes to gen_pack_header.py over the upstream Mesa version:

 - C90 compliance: block-scope each dword's local variable declarations in
   the generated pack functions.
 - Baseline deduplication: when a platform's layout exactly matches any older
   generation the item is omitted entirely - no #define aliases are emitted.
   A comment names the oldest generation that first defined that layout so
   the definition can be found in one grep.  Upstream Mesa has no
   deduplication; this keeps the generated headers free of noise as the
   number of platform variants grows.

The Meson rules build pack and decode headers for gen9 through xe3p covering
the render, blitter, and compute engines.  No generated files are committed
to the source tree.

See individual file headers for per-file copyright notices.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/intel/genxml/gen_decode_header.py | 487 ++++++++++++++++
 lib/intel/genxml/gen_pack_header.py   | 799 ++++++++++++++++++++++++++
 lib/intel/genxml/igt_genxml.h         | 112 ++++
 lib/intel/genxml/igt_genxml_decode.h  |  60 ++
 lib/intel/genxml/igt_genxml_defs.h    | 335 +++++++++++
 lib/intel/genxml/intel_genxml.py      | 553 ++++++++++++++++++
 lib/intel/genxml/util.py              |  39 ++
 lib/meson.build                       |  51 +-
 8 files changed, 2435 insertions(+), 1 deletion(-)
 create mode 100644 lib/intel/genxml/gen_decode_header.py
 create mode 100644 lib/intel/genxml/gen_pack_header.py
 create mode 100644 lib/intel/genxml/igt_genxml.h
 create mode 100644 lib/intel/genxml/igt_genxml_decode.h
 create mode 100644 lib/intel/genxml/igt_genxml_defs.h
 create mode 100644 lib/intel/genxml/intel_genxml.py
 create mode 100644 lib/intel/genxml/util.py

diff --git a/lib/intel/genxml/gen_decode_header.py b/lib/intel/genxml/gen_decode_header.py
new file mode 100644
index 000000000..170d2f60f
--- /dev/null
+++ b/lib/intel/genxml/gen_decode_header.py
@@ -0,0 +1,487 @@
+#encoding=utf-8
+#
+# Copyright (C) 2025 Intel Corporation
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice (including the next
+# paragraph) shall be included in all copies or substantial portions of the
+# Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+# IN THE SOFTWARE.
+#
+
+"""Generate batch-buffer decode/annotate headers from genxml.
+
+For each instruction, emits a _decode() function that prints annotated
+dwords with field names and values.  Enum fields show symbolic names
+alongside numeric values.
+
+Usage:
+    python gen_decode_header.py [--baseline BASELINE.xml] [--engines ...] INPUT.xml
+"""
+
+import argparse
+import intel_genxml
+import sys
+from util import safe_name
+
+license = """/*
+ * Copyright (C) 2025 Intel Corporation
+ * SPDX-License-Identifier: MIT
+ *
+ * Batch buffer decode functions for %s.
+ *
+ * This file has been generated, do not hand edit.
+ */
+"""
+
+
+def field_mask(bits):
+    """Return (start_bit, end_bit, mask) for a field."""
+    end_bit, start_bit = map(int, bits.split(':'))
+    width = end_bit - start_bit + 1
+    mask = (1 << width) - 1
+    return start_bit, end_bit, mask
+
+
+def compute_opcode_key(instruction):
+    """Compute opcode key and mask from default field values in DW0.
+
+    Returns (key, mask) where key has the default values shifted into
+    position and mask has 1s for every bit covered by a field with a
+    default.  Using the full mask for dispatch avoids collisions between
+    instructions that share the same top 16 bits but differ in lower
+    opcode fields (e.g. 3DPRIMITIVE vs 3DPRIMITIVE_EXTENDED).
+    """
+    key = 0
+    mask = 0
+    for field in instruction:
+        if field.tag != 'field':
+            continue
+        if int(field.attrib.get('dword', '-1')) != 0:
+            continue
+        default = field.attrib.get('default')
+        if default is None:
+            continue
+        start_bit, end_bit, field_mask_val = field_mask(field.attrib['bits'])
+        key |= (int(default, 0) & field_mask_val) << start_bit
+        mask |= field_mask_val << start_bit
+    return key, mask
+
+
+def get_length_bias(instruction):
+    return int(instruction.attrib.get('bias', '2'))
+
+
+def get_length(instruction):
+    return instruction.attrib.get('length')
+
+
+def collect_enum_values(field_elem, enum_defs):
+    """Collect value->name mapping from inline <value> children or
+    from a referenced standalone <enum>."""
+    values = {}
+
+    # Inline values (children of the <field>)
+    for v in field_elem:
+        if v.tag == 'value':
+            vname = safe_name(v.attrib['name'])
+            vval = int(v.attrib['value'], 0)
+            values[vval] = vname
+
+    # If the field type references a standalone enum and we didn't
+    # find inline values, look it up
+    if not values:
+        ftype = field_elem.attrib.get('type', '')
+        if ftype in enum_defs:
+            for v in enum_defs[ftype]:
+                if v.tag == 'value':
+                    vname = safe_name(v.attrib['name'])
+                    vval = int(v.attrib['value'], 0)
+                    values[vval] = vname
+
+    return values
+
+
+class DecodeGenerator:
+    def __init__(self, gen, platform, struct_defs, enum_defs):
+        self.gen = gen
+        self.platform = platform
+        self.struct_defs = struct_defs  # name -> XML element
+        self.enum_defs = enum_defs     # name -> XML element
+        self.instructions = []
+
+    def gen_prefix(self, name):
+        if name[0] == '_':
+            return 'GFX%s%s' % (self.gen, name)
+        return 'GFX%s_%s' % (self.gen, name)
+
+    def is_enum_type(self, ftype):
+        """Check if a field type is a standalone enum or has inline values."""
+        return ftype in self.enum_defs
+
+    def is_struct_type(self, ftype):
+        return ftype in self.struct_defs
+
+    def is_builtin_type(self, ftype):
+        builtins = ('address', 'bool', 'float', 'uint', 'int',
+                    'offset', 'mbo', 'mbz')
+        if ftype in builtins:
+            return True
+        # ufixed/sfixed patterns like u4.8, s3.13
+        if len(ftype) > 1 and ftype[0] in ('u', 's') and '.' in ftype:
+            return True
+        return False
+
+    def collect_fields(self, instruction):
+        """Collect fields grouped by dword index."""
+        by_dw = {}
+        self._collect_fields_recursive(instruction, by_dw, prefix="", dw_offset=0)
+        return by_dw
+
+    def _collect_fields_recursive(self, parent, by_dw, prefix, dw_offset):
+        for child in parent:
+            if child.tag == 'field':
+                dword = int(child.attrib['dword']) + dw_offset
+                name = safe_name(child.attrib['name'])
+                start_bit, end_bit, mask = field_mask(child.attrib['bits'])
+                ftype = child.attrib.get('type', 'uint')
+
+                if ftype in ('mbo', 'mbz'):
+                    continue
+
+                # Expand struct-type fields
+                if not self.is_builtin_type(ftype) and \
+                   not self.is_enum_type(ftype) and \
+                   self.is_struct_type(ftype):
+                    struct_xml = self.struct_defs[ftype]
+                    self._collect_fields_recursive(
+                        struct_xml, by_dw, prefix + name + ".",
+                        dw_offset + dword)
+                    continue
+
+                values = collect_enum_values(child, self.enum_defs)
+
+                if dword not in by_dw:
+                    by_dw[dword] = []
+                by_dw[dword].append((prefix + name, start_bit, end_bit, ftype, values))
+
+            elif child.tag == 'group':
+                group_dw = int(child.attrib.get('dword', '0'))
+                count = int(child.attrib.get('count', '1'))
+                size_bits = int(child.attrib.get('size', '32'))
+                size_dw = size_bits // 32
+
+                for i in range(count):
+                    idx_prefix = prefix
+                    if count > 1:
+                        idx_prefix = "%s[%d]." % (prefix.rstrip('.'), i)
+                    self._collect_fields_recursive(
+                        child, by_dw, idx_prefix,
+                        dw_offset + group_dw + i * size_dw)
+
+    def add_instruction(self, instruction):
+        name = safe_name(instruction.attrib['name'])
+        prefixed = self.gen_prefix(name)
+        opcode_key, opcode_mask = compute_opcode_key(instruction)
+        length = get_length(instruction)
+        bias = get_length_bias(instruction)
+        fields_by_dw = self.collect_fields(instruction)
+        self.instructions.append((prefixed, opcode_key, opcode_mask, length, bias, fields_by_dw))
+
+    def emit_header(self):
+        guard = 'GFX%s_%s_DECODE_H' % (self.gen, self.platform.upper())
+        print(license % self.platform)
+        print('#ifndef %s' % guard)
+        print('#define %s' % guard)
+        print('')
+        print('#include <stdio.h>')
+        print('#include <stdint.h>')
+        print('')
+
+    def emit_footer(self):
+        guard = 'GFX%s_%s_DECODE_H' % (self.gen, self.platform.upper())
+        print('#endif /* %s */' % guard)
+
+    def emit_decode_function(self, prefixed, opcode_key, opcode_mask, length, bias, fields_by_dw):
+        print('static inline unsigned')
+        print('%s_decode(FILE *fp, uint32_t base, const uint32_t *dw, unsigned remaining)' % prefixed)
+        print('{')
+
+        if length is not None:
+            print('   unsigned len = %s;' % length)
+        else:
+            print('   unsigned len = (dw[0] & 0xff) + %d;' % bias)
+
+        print('   if (len > remaining)')
+        print('      len = remaining;')
+        print('   fprintf(fp, "[0x%%04x] 0x%%08x  %s (len=%%u)\\n", base, dw[0], len);' % prefixed)
+
+        if not fields_by_dw:
+            print('   for (unsigned i = 1; i < len; i++)')
+            print('      fprintf(fp, "[0x%04x] 0x%08x\\n", base + i * 4, dw[i]);')
+            print('   return len;')
+            print('}')
+            print('')
+            return
+
+        max_dw = max(fields_by_dw.keys()) if fields_by_dw else 0
+
+        # Decode DW0 fields (subopcode, length, flags) if present
+        if 0 in fields_by_dw:
+            # Filter out identity fields already shown in the header line
+            dw0_fields = [(n, s, e, t, v) for n, s, e, t, v in fields_by_dw[0]
+                          if n not in ('DWordLength', 'CommandType',
+                                       'CommandSubType', '_3DCommandOpcode',
+                                       '_3DCommandSubOpcode', 'MICommandOpcode',
+                                       'CommandOpcode', 'InstructionType')]
+            if dw0_fields:
+                self._emit_dword_decode(0, dw0_fields)
+
+        for dw_idx in range(1, max_dw + 1):
+            print('   if (%d < len) {' % dw_idx)
+            if dw_idx not in fields_by_dw:
+                print('   fprintf(fp, "[0x%%04x] 0x%%08x\\n", base + %d, dw[%d]);' %
+                      (dw_idx * 4, dw_idx))
+            else:
+                fields = fields_by_dw[dw_idx]
+                self._emit_dword_decode(dw_idx, fields)
+            print('   }')
+
+        if length is not None:
+            total = int(length)
+        else:
+            total = None
+
+        if total is not None and total > max_dw + 1:
+            print('   for (unsigned i = %d; i < %d; i++)' % (max_dw + 1, total))
+            print('      fprintf(fp, "[0x%04x] 0x%08x\\n", base + i * 4, dw[i]);')
+        elif total is None:
+            print('   for (unsigned i = %d; i < len; i++)' % (max_dw + 1,))
+            print('      fprintf(fp, "[0x%04x] 0x%08x\\n", base + i * 4, dw[i]);')
+
+        print('   return len;')
+        print('}')
+        print('')
+
+    def _emit_enum_decode(self, var_expr, values, sep, name):
+        """Emit a switch that prints 'NAME (num)' for known values,
+        or just 'num' for unknown ones. Always shows the raw number."""
+        print('   { uint32_t _v = %s;' % var_expr)
+        print('     fprintf(fp, "%s.%s = ");' % (sep, name))
+        print('     switch (_v) {')
+        for val, vname in sorted(values.items()):
+            print('     case %d: fprintf(fp, "%s (%%u)", _v); break;' % (val, vname))
+        print('     default: fprintf(fp, "%u", _v); break;')
+        print('     }')
+        print('   }')
+
+    def _emit_dword_decode(self, dw_idx, fields):
+        """Emit decode for a single dword's fields."""
+        fields = sorted(fields, key=lambda f: f[1])
+
+        interesting = [(name, start, end, ftype, values)
+                       for name, start, end, ftype, values in fields
+                       if ftype not in ('mbo', 'mbz')]
+
+        if not interesting:
+            print('   fprintf(fp, "[0x%%04x] 0x%%08x\\n", base + %d, dw[%d]);' %
+                  (dw_idx * 4, dw_idx))
+            return
+
+        print('   fprintf(fp, "[0x%%04x] 0x%%08x   ", base + %d, dw[%d]);' %
+              (dw_idx * 4, dw_idx))
+
+        for i, (name, start, end, ftype, values) in enumerate(interesting):
+            width = end - start + 1
+            mask = (1 << width) - 1
+            sep = ', ' if i > 0 else ''
+            extract = '(dw[%d] >> %d) & 0x%x' % (dw_idx, start, mask)
+
+            if ftype == 'bool':
+                print('   fprintf(fp, "%s.%s = %%s", %s ? "true" : "false");' %
+                      (sep, name, extract))
+            elif ftype == 'address':
+                # Mask off the low reserved bits using the actual field
+                # start position from the XML, not a hardcoded 12.
+                if start > 0:
+                    addr_mask = (1 << start) - 1
+                    print('   fprintf(fp, "%s.%s = 0x%%lx", '
+                          '(unsigned long)(((uint64_t)dw[%d] | ((uint64_t)dw[%d] << 32)) & ~0x%xUL));' %
+                          (sep, name, dw_idx, dw_idx + 1, addr_mask))
+                else:
+                    print('   fprintf(fp, "%s.%s = 0x%%lx", '
+                          '(unsigned long)((uint64_t)dw[%d] | ((uint64_t)dw[%d] << 32)));' %
+                          (sep, name, dw_idx, dw_idx + 1))
+            elif ftype == 'float':
+                print('   { union { uint32_t u; float f; } _fv = { .u = dw[%d] };' % dw_idx)
+                print('     fprintf(fp, "%s.%s = %%f", _fv.f); }' % (sep, name))
+            elif values:
+                # Enum or field with named values - show symbolic name + raw number
+                self._emit_enum_decode(extract, values, sep, name)
+            elif width > 32:
+                print('   fprintf(fp, "%s.%s = 0x%%lx", '
+                      '(unsigned long)((uint64_t)(dw[%d] >> %d) | ((uint64_t)dw[%d] << %d)));' %
+                      (sep, name, dw_idx, start, dw_idx + 1, 32 - start))
+            else:
+                print('   fprintf(fp, "%s.%s = %%u", %s);' %
+                      (sep, name, extract))
+
+        print('   fprintf(fp, "\\n");')
+
+    def emit_dispatch(self):
+        """Emit command dispatch function.
+
+        Uses the full opcode key and mask rather than just the top 16 bits
+        so that instructions differing only in lower opcode fields
+        (e.g. 3DPRIMITIVE vs 3DPRIMITIVE_EXTENDED) are dispatched correctly.
+        Instructions with more specific masks (more default bits) are checked
+        first so that a more general match does not shadow a specific one.
+        """
+        prefix = 'gfx%s' % self.gen
+
+        print('static inline unsigned')
+        print('%s_decode_command(FILE *fp, uint32_t offset, const uint32_t *dw, unsigned remaining)' % prefix)
+        print('{')
+
+        # Collect unique (key, mask) -> prefixed mappings.
+        # Sort by popcount of mask descending so more specific matches
+        # are tried first (e.g. 3DPRIMITIVE_EXTENDED before 3DPRIMITIVE).
+        entries = []
+        seen = set()
+        for prefixed, opcode_key, opcode_mask, length, bias, fields_by_dw in self.instructions:
+            if opcode_key == 0 or (opcode_key, opcode_mask) in seen:
+                continue
+            seen.add((opcode_key, opcode_mask))
+            entries.append((opcode_key, opcode_mask, prefixed))
+
+        entries.sort(key=lambda e: -bin(e[1]).count('1'))
+
+        first = True
+        for key, mask, prefixed in entries:
+            keyword = 'if' if first else '} else if'
+            print('   %s ((dw[0] & 0x%08xu) == 0x%08xu) {' % (keyword, mask, key))
+            print('      return %s_decode(fp, offset, dw, remaining);' % prefixed)
+            first = False
+
+        if not first:
+            print('   } else {')
+        print('      fprintf(fp, "[0x%04x] 0x%08x  UNKNOWN\\n", offset, dw[0]);')
+        print('      return 1;')
+        if not first:
+            print('   }')
+        print('}')
+        print('')
+
+    def emit_batch_decode(self):
+        """Emit the batch buffer walker."""
+        prefix = 'gfx%s' % self.gen
+
+        print('static inline void')
+        print('%s_decode_batch(FILE *fp, const uint32_t *batch, unsigned batch_dwords)' % prefix)
+        print('{')
+        print('   unsigned offset = 0;')
+        print('')
+        print('   while (offset < batch_dwords * 4) {')
+        print('      const uint32_t *dw = &batch[offset / 4];')
+        print('      uint32_t cmd = dw[0];')
+        print('      unsigned len;')
+        print('')
+        print('      /* MI_BATCH_BUFFER_END */')
+        print('      if (cmd == 0x05000000) {')
+        print('         fprintf(fp, "[0x%04x] 0x%08x  MI_BATCH_BUFFER_END\\n", offset, cmd);')
+        print('         break;')
+        print('      }')
+        print('')
+        print('      /* MI_NOOP: opcode is all zeros, single dword */')
+        print('      if (cmd == 0) {')
+        print('         fprintf(fp, "[0x%04x] 0x%08x  MI_NOOP\\n", offset, cmd);')
+        print('         offset += 4;')
+        print('         continue;')
+        print('      }')
+        print('')
+        print('      len = %s_decode_command(fp, offset, dw, batch_dwords - offset / 4);' % prefix)
+        print('      offset += len * 4;')
+        print('   }')
+        print('}')
+
+    def generate(self):
+        self.emit_header()
+        for inst in self.instructions:
+            self.emit_decode_function(*inst)
+        self.emit_dispatch()
+        self.emit_batch_decode()
+        self.emit_footer()
+
+
+def parse_args():
+    p = argparse.ArgumentParser(description=__doc__)
+    p.add_argument('xml_source', metavar='XML_SOURCE')
+    p.add_argument('--engines', type=str, default='render',
+                   help="Comma-separated engine list")
+    p.add_argument('--baseline', type=str, action='append', default=[],
+                   help="Previous gen XML files (oldest first); skip identical instructions")
+    return p.parse_args()
+
+
+def main():
+    pargs = parse_args()
+    engines = set(pargs.engines.split(','))
+
+    genxml = intel_genxml.GenXml(pargs.xml_source)
+    genxml.merge_imported()
+    genxml.filter_engines(engines)
+
+    root = genxml.et.getroot()
+    platform = root.attrib['name']
+    gen = root.attrib['gen'].replace('.', '')
+
+    # Collect struct and enum definitions
+    struct_defs = {}
+    enum_defs = {}
+    for item in root:
+        if item.tag == 'struct':
+            struct_defs[item.attrib['name']] = item
+        elif item.tag == 'enum':
+            enum_defs[item.attrib['name']] = item
+
+    # Optional baseline filtering
+    baseline_fps = {}
+    if pargs.baseline:
+        from gen_pack_header import _build_baselines, _item_fingerprint
+        baseline_fps, _, _ = _build_baselines(pargs.baseline, engines)
+
+    decoder = DecodeGenerator(gen, platform, struct_defs, enum_defs)
+
+    for item in root:
+        if item.tag != 'instruction':
+            continue
+        item_name = item.attrib.get('name')
+        if not item_name:
+            continue
+
+        if baseline_fps:
+            from gen_pack_header import _item_fingerprint
+            fp = baseline_fps.get(item_name)
+            if fp is not None and _item_fingerprint(item) == fp:
+                continue
+
+        decoder.add_instruction(item)
+
+    decoder.generate()
+
+
+if __name__ == '__main__':
+    main()
diff --git a/lib/intel/genxml/gen_pack_header.py b/lib/intel/genxml/gen_pack_header.py
new file mode 100644
index 000000000..1d14dd8c5
--- /dev/null
+++ b/lib/intel/genxml/gen_pack_header.py
@@ -0,0 +1,799 @@
+#encoding=utf-8
+# SPDX-License-Identifier: MIT
+
+import argparse
+import ast
+import intel_genxml
+import re
+import sys
+import copy
+import textwrap
+from util import *
+
+license =  """/*
+ * Copyright (C) 2016 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+"""
+
+pack_header = """%(license)s
+
+/* Instructions, enums and structures for %(platform)s.
+ *
+ * This file has been generated, do not hand edit.
+ */
+
+#ifndef %(guard)s
+#define %(guard)s
+
+#include <stdio.h>
+#include "intel/genxml/igt_genxml_defs.h"
+
+"""
+
+def num_from_str(num_str):
+    if num_str.lower().startswith('0x'):
+        return int(num_str, base=16)
+
+    assert not num_str.startswith('0'), 'octals numbers not allowed'
+    return int(num_str)
+
+def bool_from_str(bool_str):
+    options = { "true": True, "false": False }
+    return options[bool_str];
+
+class Field(object):
+    ufixed_pattern = re.compile(r"u(\d+)\.(\d+)")
+    sfixed_pattern = re.compile(r"s(\d+)\.(\d+)")
+
+    def __init__(self, parser, attrs):
+        self.parser = parser
+        if "name" in attrs:
+            self.name = safe_name(attrs["name"])
+
+        dword = int(attrs["dword"])
+        end_bit, start_bit = map(int, attrs["bits"].split(":"))
+
+        self.start = dword * 32 + start_bit
+        self.end = dword * 32 + end_bit
+
+        self.type = attrs["type"]
+        self.nonzero = bool_from_str(attrs.get("nonzero", "false"))
+        self.prefix = attrs["prefix"] if "prefix" in attrs else None
+
+        assert self.start <= self.end, \
+               'field {} has end ({}) < start ({})'.format(self.name, self.end,
+                                                           self.start)
+        if self.type == 'bool':
+            assert self.end == self.start, \
+                   'bool field ({}) is too wide'.format(self.name)
+
+        if "default" in attrs:
+            # Base 0 recognizes 0x, 0o, 0b prefixes in addition to decimal ints.
+            self.default = int(attrs["default"], base=0)
+        else:
+            self.default = None
+
+        ufixed_match = Field.ufixed_pattern.match(self.type)
+        if ufixed_match:
+            self.type = 'ufixed'
+            self.fractional_size = int(ufixed_match.group(2))
+
+        sfixed_match = Field.sfixed_pattern.match(self.type)
+        if sfixed_match:
+            self.type = 'sfixed'
+            self.fractional_size = int(sfixed_match.group(2))
+
+    def is_builtin_type(self):
+        builtins =  [ 'address', 'bool', 'float', 'ufixed',
+                      'offset', 'sfixed', 'offset', 'int', 'uint',
+                      'mbo', 'mbz' ]
+        return self.type in builtins
+
+    def is_struct_type(self):
+        return self.type in self.parser.structs
+
+    def is_enum_type(self):
+        return self.type in self.parser.enums
+
+    def emit_template_struct(self, dim):
+        if self.type == 'address':
+            type = '__gen_address_type'
+        elif self.type == 'bool':
+            type = 'bool'
+        elif self.type == 'float':
+            type = 'float'
+        elif self.type == 'ufixed':
+            type = 'float'
+        elif self.type == 'sfixed':
+            type = 'float'
+        elif self.type == 'uint' and self.end - self.start > 32:
+            type = 'uint64_t'
+        elif self.type == 'offset':
+            type = 'uint64_t'
+        elif self.type == 'int':
+            type = 'int32_t'
+        elif self.type == 'uint':
+            type = 'uint32_t'
+        elif self.is_struct_type():
+            type = 'struct ' + self.parser.gen_prefix_for_type(self.type)
+        elif self.is_enum_type():
+            type = 'enum ' + self.parser.gen_prefix(safe_name(self.type))
+        elif self.type == 'mbo' or self.type == 'mbz':
+            return
+        else:
+            print("#error unhandled type: %s" % self.type)
+            return
+
+        print("   %-36s %s%s;" % (type, self.name, dim))
+
+    def emit_value_defines(self):
+        for value in self.values:
+            defname = self.parser.gen_value_name(
+                value.name,
+                prefix=self.prefix,
+                strip_prefixed_leading_underscore=True)
+            print("#ifndef %s" % defname)
+            print("#define %-40s %d" % (defname, value.value))
+            print("#endif")
+
+class Group(object):
+    def __init__(self, parser, parent, start, count, size):
+        self.parser = parser
+        self.parent = parent
+        self.start = start
+        self.count = count
+        self.size = size
+        self.fields = []
+
+    def emit_template_struct(self, dim):
+        if self.count == 0:
+            print("   /* variable length fields follow */")
+        else:
+            if self.count > 1:
+                dim = "%s[%d]" % (dim, self.count)
+
+            for field in self.fields:
+                field.emit_template_struct(dim)
+
+    def emit_value_defines(self):
+        for field in self.fields:
+            if isinstance(field, Group):
+                field.emit_value_defines()
+            else:
+                field.emit_value_defines()
+
+    class DWord:
+        def __init__(self):
+            self.size = 32
+            self.fields = []
+            self.address = None
+
+    def collect_dwords(self, dwords, start, dim):
+        for field in self.fields:
+            if isinstance(field, Group):
+                if field.count == 1:
+                    field.collect_dwords(dwords, start + field.start, dim)
+                else:
+                    for i in range(field.count):
+                        field.collect_dwords(dwords,
+                                             start + field.start + i * field.size,
+                                             "%s[%d]" % (dim, i))
+                continue
+
+            index = (start + field.start) // 32
+            if not index in dwords:
+                dwords[index] = self.DWord()
+
+            clone = copy.copy(field)
+            clone.start = clone.start + start
+            clone.end = clone.end + start
+            clone.dim = dim
+            dwords[index].fields.append(clone)
+
+            if field.type == "address":
+                # assert dwords[index].address == None
+                dwords[index].address = clone
+
+            # Coalesce all the dwords covered by this field. The two cases we
+            # handle are where multiple fields are in a 64 bit word (typically
+            # and address and a few bits) or where a single struct field
+            # completely covers multiple dwords.
+            while index < (start + field.end) // 32:
+                if index + 1 in dwords and not dwords[index] == dwords[index + 1]:
+                    dwords[index].fields.extend(dwords[index + 1].fields)
+                dwords[index].size = 64
+                dwords[index + 1] = dwords[index]
+                index = index + 1
+
+    def collect_dwords_and_length(self, repack=False):
+        dwords = {}
+        self.collect_dwords(dwords, 0, "")
+
+        # Determine number of dwords in this group. If we have a size, use
+        # that, since that'll account for MBZ dwords at the end of a group
+        # (like dword 8 on BDW+ 3DSTATE_HS). Otherwise, use the largest dword
+        # index we've seen plus one.
+        if self.size > 0:
+            length = self.size // 32
+        elif dwords:
+            length = max(dwords.keys()) + 1
+        else:
+            length = 0
+
+        return (dwords, length)
+
+    def emit_pack_function(self, dwords, length, repack=False):
+        for index in range(length):
+            # Handle MBZ dwords
+            if not index in dwords:
+                print("")
+                print("   dw[%d] = 0;" % index)
+                continue
+
+            # For 64 bit dwords, we aliased the two dword entries in the dword
+            # dict it occupies. Now that we're emitting the pack function,
+            # skip the duplicate entries.
+            dw = dwords[index]
+            if index > 0 and index - 1 in dwords and dw == dwords[index - 1]:
+                continue
+
+            # Special case: only one field and it's a struct at the beginning
+            # of the dword. In this case we pack directly into the
+            # destination. This is the only way we handle embedded structs
+            # larger than 32 bits.
+            if len(dw.fields) == 1:
+                field = dw.fields[0]
+                name = field.name + field.dim
+                if field.is_struct_type() and field.start % 32 == 0:
+                    print("")
+                    if repack:
+                        print("   %s_repack(data, &dw[%d], &origin[%d], &values->%s);" %
+                              (self.parser.gen_prefix_for_type(field.type), index, index, name))
+                    else:
+                        print("   %s_pack(data, &dw[%d], &values->%s);" %
+                              (self.parser.gen_prefix_for_type(field.type), index, name))
+                    continue
+
+            # Open a block scope for C90 compliance (declarations must
+            # precede code within each block).
+            print("")
+            print("   {")
+
+            # Pack any fields of struct type first so we have integer values
+            # to the dword for those fields.
+            # Emit all declarations first, then all pack calls (C90).
+            field_index = 0
+            struct_fields = []
+            for field in dw.fields:
+                if isinstance(field, Field) and field.is_struct_type():
+                    name = field.name + field.dim
+                    struct_fields.append((field, name, field_index))
+                    field_index = field_index + 1
+
+            if struct_fields:
+                for field, name, fi in struct_fields:
+                    print("   uint32_t v%d_%d;" % (index, fi))
+                for field, name, fi in struct_fields:
+                    if repack:
+                        print("   %s_repack(data, &v%d_%d, &origin[%d], &values->%s);" %
+                              (self.parser.gen_prefix_for_type(field.type), index, fi, index, name))
+                    else:
+                        print("   %s_pack(data, &v%d_%d, &values->%s);" %
+                              (self.parser.gen_prefix_for_type(field.type), index, fi, name))
+
+            dword_start = index * 32
+            if dw.address == None:
+                address_count = 0
+            else:
+                address_count = 1
+
+            # Assert in dont_use values
+            for field in dw.fields:
+                for value in field.values:
+                    if value.dont_use:
+                        print("   assert(values->%s != %s);" %
+                              (field.name,
+                               self.parser.gen_value_name(value.name,
+                                                          prefix=field.prefix)))
+
+            if dw.size == 32 and dw.address == None:
+                v = None
+                print("   dw[%d] =" % index)
+            elif len(dw.fields) > address_count or repack:
+                v = "v%d" % index
+                print("   const uint%d_t %s =" % (dw.size, v))
+            else:
+                v = "0"
+
+            field_index = 0
+            non_address_fields = []
+
+            if repack:
+                non_address_fields.append("origin[%d]" % index)
+                if dw.size > 32:
+                    non_address_fields.append("((uint64_t)origin[%d] << 32)" % (index + 1))
+
+            for field in dw.fields:
+                if field.type != "mbo" and field.type != "mbz" and field.type != "repack":
+                    name = field.name + field.dim
+
+                nz = "_nonzero" if field.nonzero else ""
+
+                if field.type == "repack":
+                    non_address_fields.append("origin[%d]" % index)
+                elif field.type == "mbo":
+                    non_address_fields.append("util_bitpack_ones(%d, %d)" % \
+                        (field.start - dword_start, field.end - dword_start))
+                elif field.type == "mbz":
+                    assert not field.nonzero
+                elif field.type == "address":
+                    pass
+                elif field.type == "uint":
+                    non_address_fields.append("util_bitpack_uint%s(values->%s, %d, %d)" % \
+                        (nz, name, field.start - dword_start, field.end - dword_start))
+                elif field.is_enum_type():
+                    non_address_fields.append("util_bitpack_uint%s(values->%s, %d, %d)" % \
+                        (nz, name, field.start - dword_start, field.end - dword_start))
+                elif field.type == "int":
+                    non_address_fields.append("util_bitpack_sint%s(values->%s, %d, %d)" % \
+                        (nz, name, field.start - dword_start, field.end - dword_start))
+                elif field.type == "bool":
+                    non_address_fields.append("util_bitpack_uint%s(values->%s, %d, %d)" % \
+                        (nz, name, field.start - dword_start, field.end - dword_start))
+                elif field.type == "float":
+                    non_address_fields.append("util_bitpack_float%s(values->%s)" % (nz, name))
+                elif field.type == "offset":
+                    non_address_fields.append("__gen_offset%s(values->%s, %d, %d)" % \
+                        (nz, name, field.start - dword_start, field.end - dword_start))
+                elif field.type == 'ufixed':
+                    non_address_fields.append("util_bitpack_ufixed%s(values->%s, %d, %d, %d)" % \
+                        (nz, name, field.start - dword_start, field.end - dword_start, field.fractional_size))
+                elif field.type == 'sfixed':
+                    non_address_fields.append("util_bitpack_sfixed%s(values->%s, %d, %d, %d)" % \
+                        (nz, name, field.start - dword_start, field.end - dword_start, field.fractional_size))
+                elif field.is_struct_type():
+                    non_address_fields.append("util_bitpack_uint(v%d_%d, %d, %d)" % \
+                        (index, field_index, field.start - dword_start, field.end - dword_start))
+                    field_index = field_index + 1
+                else:
+                    non_address_fields.append("/* unhandled field %s, type %s */\n" % \
+                                              (name, field.type))
+
+            if non_address_fields:
+                print(" |\n".join("      " + f for f in non_address_fields) + ";")
+
+            if dw.size == 32:
+                if dw.address:
+                    print("   dw[%d] = __gen_address(data, &dw[%d], values->%s, %s, %d, %d);" %
+                          (index, index, dw.address.name + field.dim, v,
+                           dw.address.start - dword_start, dw.address.end - dword_start))
+                print("   }")
+                continue
+
+            if dw.address:
+                v_address = "v%d_address" % index
+                print("   const uint64_t %s =\n      __gen_address(data, &dw[%d], values->%s, %s, %d, %d);" %
+                      (v_address, index, dw.address.name + field.dim, v,
+                       dw.address.start - dword_start, dw.address.end - dword_start))
+                if len(dw.fields) > address_count:
+                    print("   dw[%d] = %s;" % (index, v_address))
+                    print("   dw[%d] = (%s >> 32) | (%s >> 32);" % (index + 1, v_address, v))
+                    print("   }")
+                    continue
+                else:
+                    v = v_address
+            print("   dw[%d] = %s;" % (index, v))
+            print("   dw[%d] = %s >> 32;" % (index + 1, v))
+            print("   }")
+
+class Value(object):
+    def __init__(self, attrs):
+        self.name = safe_name(attrs["name"])
+        self.value = ast.literal_eval(attrs["value"])
+        self.dont_use = int(attrs["dont_use"]) != 0 if "dont_use" in attrs else False
+
+class Parser(object):
+    def __init__(self, repack):
+        self.instruction = None
+        self.structs = {}
+        # Set of enum names we've seen.
+        self.enums = set()
+        self.registers = {}
+        self.repack = repack
+        # Maps struct/register type names to the origin gen label for types
+        # that were omitted (no definition emitted for this gen).
+        self.skipped_type_origins = {}
+
+    def gen_prefix(self, name):
+        if name[0] == "_":
+            return 'GFX%s%s' % (self.gen, name)
+        return 'GFX%s_%s' % (self.gen, name)
+
+    def gen_prefix_for_type(self, type_name):
+        """Like gen_prefix but resolves skipped (omitted) types to their
+        origin gen so that struct/pack references still compile."""
+        origin = self.skipped_type_origins.get(type_name)
+        if origin:
+            safe = safe_name(type_name)
+            if safe[0] == '_':
+                return 'GFX%s%s' % (origin, safe)
+            return 'GFX%s_%s' % (origin, safe)
+        return self.gen_prefix(safe_name(type_name))
+
+    def gen_value_name(self, value_name, prefix=None,
+                       strip_prefixed_leading_underscore=False):
+        name = value_name
+        if prefix:
+            if strip_prefixed_leading_underscore and name[0] == '_':
+                name = name[1:]
+            name = prefix + "_" + name
+
+        return self.gen_prefix(name.upper())
+
+    def gen_guard(self):
+        return self.gen_prefix("{0}_PACK_H".format(self.platform))
+
+    def _should_skip_item(self, item):
+        """Check if this item is bit-identical to any previous gen
+        and should be skipped (applies to instructions, structs, and
+        registers)."""
+        if not self.baseline_fingerprints:
+            return False
+        item_name = item.attrib.get('name')
+        if not item_name:
+            return False
+        baseline_fp = self.baseline_fingerprints.get(item_name)
+        if baseline_fp is None:
+            return False  # New item, must emit
+        return _item_fingerprint(item) == baseline_fp
+
+    def process_item(self, item):
+        name = item.tag
+        assert name != "genxml"
+        attrs = item.attrib
+
+        # Skip items that are bit-identical to any previous gen.
+        # Emit a comment pointing to the oldest gen that defined this
+        # layout so that a developer can grep and find it in one hop.
+        if name in ("instruction", "struct", "register") and self._should_skip_item(item):
+            safe = safe_name(attrs["name"])
+            origin = self.origin_gens.get(attrs["name"], self.baseline_gen)
+            if safe[0] == "_":
+                origin_name = 'GFX%s%s' % (origin, safe)
+            else:
+                origin_name = 'GFX%s_%s' % (origin, safe)
+            print("/* %s omitted: identical to %s */" %
+                  (self.gen_prefix(safe), origin_name))
+            print('')
+            # Register skipped structs/registers so later items can
+            # still reference them as field types, resolved to origin gen.
+            if name == "struct":
+                self.structs[attrs["name"]] = 1
+                self.skipped_type_origins[attrs["name"]] = origin
+            elif name == "register":
+                self.registers[attrs["name"]] = 1
+                self.skipped_type_origins[attrs["name"]] = origin
+            return
+
+        if name in ("instruction", "struct", "register"):
+            if name == "instruction":
+                self.instruction = safe_name(attrs["name"])
+                self.length_bias = int(attrs["bias"])
+            elif name == "struct":
+                self.struct = safe_name(attrs["name"])
+                self.structs[attrs["name"]] = 1
+            elif name == "register":
+                self.register = safe_name(attrs["name"])
+                self.reg_num = num_from_str(attrs["num"])
+                self.registers[attrs["name"]] = 1
+            if "length" in attrs:
+                self.length = int(attrs["length"])
+                size = self.length * 32
+            else:
+                self.length = None
+                size = 0
+            self.group = Group(self, None, 0, 1, size)
+
+        elif name == "group":
+            dword = int(attrs["dword"])
+            offset_bits = int(attrs.get("offset_bits", 0))
+            start = dword * 32 + offset_bits
+
+
+            group = Group(self, self.group,
+                          start, int(attrs["count"]), int(attrs["size"]))
+            self.group.fields.append(group)
+            self.group = group
+        elif name == "field":
+            self.group.fields.append(Field(self, attrs))
+            self.values = []
+        elif name == "enum":
+            self.values = []
+            self.enum = safe_name(attrs["name"])
+            self.enums.add(attrs["name"])
+            if "prefix" in attrs:
+                self.prefix = safe_name(attrs["prefix"])
+            else:
+                self.prefix = None
+        elif name == "value":
+            self.values.append(Value(attrs))
+        elif name in ("import", "exclude"):
+            pass
+        else:
+            assert False
+
+        for child_item in item:
+            self.process_item(child_item)
+
+        if name  == "instruction":
+            self.emit_instruction()
+            self.instruction = None
+            self.group = None
+        elif name == "struct":
+            self.emit_struct()
+            self.struct = None
+            self.group = None
+        elif name == "register":
+            self.emit_register()
+            self.register = None
+            self.reg_num = None
+            self.group = None
+        elif name == "group":
+            self.group = self.group.parent
+        elif name  == "field":
+            self.group.fields[-1].values = self.values
+        elif name  == "enum":
+            self.emit_enum()
+            self.enum = None
+        elif name in ("import", "exclude", "value"):
+            pass
+        else:
+            assert False
+
+    def emit_template_struct(self, name, group):
+        print("struct %s {" % self.gen_prefix(name))
+        group.emit_template_struct("")
+        print("};\n")
+
+
+    def emit_pack_function(self, name, group, repack=False):
+        name = self.gen_prefix(name)
+        if repack:
+            print(textwrap.dedent("""\
+            static inline __attribute__((always_inline)) void
+            %s_repack(__attribute__((unused)) __gen_user_data *data,
+                    %s__attribute__((unused)) void * restrict dst,
+                    %s__attribute__((unused)) const uint32_t * origin,
+                    %s__attribute__((unused)) const struct %s * restrict values)
+            {""") % (name, ' ' * len(name), ' ' * len(name), ' ' * len(name), name))
+        else:
+            print(textwrap.dedent("""\
+            static inline __attribute__((always_inline)) void
+            %s_pack(__attribute__((unused)) __gen_user_data *data,
+                  %s__attribute__((unused)) void * restrict dst,
+                  %s__attribute__((unused)) const struct %s * restrict values)
+            {""") % (name, ' ' * len(name), ' ' * len(name), name))
+
+        (dwords, length) = group.collect_dwords_and_length(repack)
+        if length:
+            # Cast dst to make header C++ friendly
+            type_name = "uint32_t * restrict"
+            print("   %s dw = (%s) dst;" % (type_name, type_name))
+
+            group.emit_pack_function(dwords, length, repack)
+
+        print("}\n")
+
+    def emit_instruction(self):
+        name = self.instruction
+
+        if not self.length is None:
+            print('#define %-33s %6d' %
+                  (self.gen_prefix(name + "_length"), self.length))
+        print('#define %-33s %6d' %
+              (self.gen_prefix(name + "_length_bias"), self.length_bias))
+
+        default_fields = []
+        for field in self.group.fields:
+            if not isinstance(field, Field):
+                continue
+            if field.default is None:
+                continue
+
+            if field.is_builtin_type():
+                default_fields.append("   .%-35s = %6d" % (field.name, field.default))
+            else:
+                # Default values should not apply to structures
+                assert field.is_enum_type()
+                default_fields.append("   .%-35s = (enum %s) %6d" % (field.name, self.gen_prefix(safe_name(field.type)), field.default))
+
+        if default_fields:
+            print('#define %-40s\\' % (self.gen_prefix(name + '_header')))
+            print(",  \\\n".join(default_fields))
+            print('')
+
+        self.emit_template_struct(self.instruction, self.group)
+        self.emit_pack_function(self.instruction, self.group)
+        if self.repack:
+            self.emit_pack_function(self.instruction, self.group, repack=True)
+        self.group.emit_value_defines()
+
+    def emit_register(self):
+        name = self.register
+        if not self.reg_num is None:
+            print('#define %-33s 0x%04x' %
+                  (self.gen_prefix(name + "_num"), self.reg_num))
+
+        if not self.length is None:
+            print('#define %-33s %6d' %
+                  (self.gen_prefix(name + "_length"), self.length))
+
+        self.emit_template_struct(self.register, self.group)
+        self.emit_pack_function(self.register, self.group)
+        self.group.emit_value_defines()
+
+    def emit_struct(self):
+        name = self.struct
+        if not self.length is None:
+            print('#define %-33s %6d' %
+                  (self.gen_prefix(name + "_length"), self.length))
+
+        self.emit_template_struct(self.struct, self.group)
+        self.emit_pack_function(self.struct, self.group)
+        if self.repack:
+            self.emit_pack_function(self.struct, self.group, repack=True)
+        self.group.emit_value_defines()
+
+    def emit_enum(self):
+        enum_name = self.gen_prefix(self.enum)
+        print('enum %s {' % enum_name)
+        for value in self.values:
+            name = self.gen_value_name(value.name, prefix=self.prefix)
+            print('   %-36s = %6d,' % (name.upper(), value.value))
+        print('};')
+        print('')
+
+    def emit_genxml(self, genxml):
+        root = genxml.et.getroot()
+        self.platform = root.attrib["name"]
+        self.gen = root.attrib["gen"].replace('.', '')
+        print(pack_header % {'license': license, 'platform': self.platform, 'guard': self.gen_guard()})
+        for item in root:
+            self.process_item(item)
+        print('#endif /* %s */' % self.gen_guard())
+
+def _element_fingerprint(elem, skip_attrs=frozenset()):
+    """Canonical string representation of an XML element for structural
+    comparison.  Captures tag, attributes (sorted, minus skip_attrs),
+    and all children recursively."""
+    parts = [elem.tag]
+    for k, v in sorted(elem.attrib.items()):
+        if k not in skip_attrs:
+            parts.append('%s=%s' % (k, v))
+    for child in elem:
+        parts.append(_element_fingerprint(child))
+    return '(%s)' % '|'.join(parts)
+
+def _item_fingerprint(item):
+    """Structural fingerprint for an XML element (instruction, struct,
+    or register).  Skips identity attributes ('name', 'engine', 'num')
+    so that two items are considered identical when their bit-layout
+    matches, regardless of naming or register offset."""
+    return _element_fingerprint(item, skip_attrs={'name', 'engine', 'num'})
+
+def _build_baseline(xml_source, engines):
+    """Load a single baseline gen's XML file and build a dict of
+    item name -> fingerprint.  Kept for use by gen_decode_header."""
+    genxml = intel_genxml.GenXml(xml_source)
+    genxml.merge_imported()
+    genxml.filter_engines(engines)
+    root = genxml.et.getroot()
+    baseline = {}
+    baseline_gen = root.attrib["gen"].replace('.', '')
+    for item in root:
+        if item.tag in ('instruction', 'struct', 'register'):
+            item_name = item.attrib.get('name')
+            if item_name:
+                baseline[item_name] = _item_fingerprint(item)
+    return baseline, baseline_gen
+
+def _build_baselines(xml_sources, engines):
+    """Load a sequence of baseline gen XML files (oldest first) and build:
+     - fingerprints: item_name -> fingerprint (from most recent occurrence)
+     - baseline_gen: gen label of the most recent baseline
+     - origin_gens: item_name -> gen label of the oldest gen with the
+       current fingerprint for that item
+    An item's origin resets when its fingerprint changes."""
+    fingerprints = {}
+    origin_gens = {}
+    baseline_gen = None
+    for xml_source in xml_sources:
+        genxml = intel_genxml.GenXml(xml_source)
+        genxml.merge_imported()
+        genxml.filter_engines(engines)
+        root = genxml.et.getroot()
+        gen_label = root.attrib["gen"].replace('.', '')
+        baseline_gen = gen_label
+        for item in root:
+            if item.tag in ('instruction', 'struct', 'register'):
+                item_name = item.attrib.get('name')
+                if item_name:
+                    fp = _item_fingerprint(item)
+                    if item_name not in fingerprints or fingerprints[item_name] != fp:
+                        # New item or fingerprint changed: this gen is the origin
+                        fingerprints[item_name] = fp
+                        origin_gens[item_name] = gen_label
+                    # else: same fingerprint, keep existing (older) origin
+    return fingerprints, baseline_gen, origin_gens
+
+def parse_args():
+    p = argparse.ArgumentParser()
+    p.add_argument('xml_source', metavar='XML_SOURCE',
+                   help="Input xml file")
+    p.add_argument('--engines', nargs='?', type=str, default='render',
+                   help="Comma-separated list of engines whose instructions should be parsed (default: %(default)s)")
+    p.add_argument('--include-symbols', nargs='?', type=str, action='store',
+                   help="List of instruction/structures to generate")
+    p.add_argument('--repack', action='store_true', help="Emit repacking code")
+    p.add_argument('--baseline', type=str, action='append', default=[],
+                   help="Previous gen XML files (oldest first); skip items identical to any baseline")
+
+    pargs = p.parse_args()
+
+    if pargs.engines is None:
+        print("No engines specified")
+        sys.exit(1)
+
+    return pargs
+
+def main():
+    pargs = parse_args()
+
+    engines = set(pargs.engines.split(','))
+    valid_engines = [ 'render', 'blitter', 'video', 'compute' ]
+    if engines - set(valid_engines):
+        print("Invalid engine specified, valid engines are:\n")
+        for e in valid_engines:
+            print("\t%s" % e)
+        sys.exit(1)
+
+    baseline_fingerprints = {}
+    baseline_gen = None
+    origin_gens = {}
+    if pargs.baseline:
+        baseline_fingerprints, baseline_gen, origin_gens = _build_baselines(
+            pargs.baseline, engines)
+
+    genxml = intel_genxml.GenXml(pargs.xml_source)
+
+    genxml.merge_imported()
+    genxml.filter_engines(engines)
+    if pargs.include_symbols:
+        genxml.filter_symbols(pargs.include_symbols.split(','))
+    p = Parser(pargs.repack)
+    p.baseline_fingerprints = baseline_fingerprints
+    p.baseline_gen = baseline_gen
+    p.origin_gens = origin_gens
+    p.emit_genxml(genxml)
+
+if __name__ == '__main__':
+    main()
diff --git a/lib/intel/genxml/igt_genxml.h b/lib/intel/genxml/igt_genxml.h
new file mode 100644
index 000000000..7b8c59338
--- /dev/null
+++ b/lib/intel/genxml/igt_genxml.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Emit / pack macros for using genxml-generated pack headers with
+ * IGT's intel_bb batch-buffer infrastructure.
+ *
+ * Relocations are handled automatically: when an address field in a
+ * genxml struct is assigned a struct igt_address with a non-zero
+ * handle, __gen_combine_address (in igt_genxml_defs.h) registers the
+ * relocation during packing.
+ */
+
+#ifndef IGT_GENXML_H
+#define IGT_GENXML_H
+
+#include <stdint.h>
+#include "igt_core.h"
+#include "intel_batchbuffer.h"
+#include "intel_bufops.h"
+#include "igt_genxml_defs.h"
+
+/*
+ * igt_genxml_emit - emit a fixed-length GPU command into the batch.
+ *
+ * Usage:
+ *   igt_genxml_emit(ibb, GFX9_3DSTATE_CLIP, clip) {
+ *       clip.MaximumVPIndex = 0;
+ *       ...
+ *   }
+ *
+ * The struct is zero-initialised with the default header fields, packed
+ * into the batch at the current pointer, and the pointer is advanced by
+ * cmd##_length dwords.
+ */
+#define igt_genxml_emit(ibb, cmd, name)                                    \
+	for (struct cmd name = { cmd##_header },                           \
+	     *_dst = (struct cmd *)intel_bb_ptr(ibb);                      \
+	     __builtin_expect(_dst != NULL, 1);                            \
+	     ({                                                            \
+		     cmd##_pack((ibb), (void *)_dst, &name);               \
+		     intel_bb_ptr_add((ibb), cmd##_length * 4);            \
+		     _dst = NULL;                                          \
+	     }))
+
+/*
+ * igt_genxml_pack_state - pack a state object at an arbitrary location.
+ *
+ * Usage:
+ *   void *ptr = intel_bb_ptr_align(ibb, 64);
+ *   igt_genxml_pack_state(ibb, GFX9_RENDER_SURFACE_STATE, ptr, rss) {
+ *       rss.SurfaceType = GFX9_SURFTYPE_2D;
+ *       rss.SurfaceBaseAddress = igt_address_of(buf, 0, rd, wd);
+ *       ...
+ *   }
+ *   intel_bb_ptr_add(ibb, GFX9_RENDER_SURFACE_STATE_length * 4);
+ *
+ * Address fields with a non-zero handle get their relocations
+ * registered automatically during packing.
+ */
+#define igt_genxml_pack_state(ibb, cmd, dst_ptr, name)                     \
+	for (struct cmd name = { 0 },                                      \
+	     *_done = (struct cmd *)1;                                     \
+	     __builtin_expect(_done != NULL, 1);                           \
+	     ({                                                            \
+		     cmd##_pack((ibb), (void *)(dst_ptr), &name);          \
+		     _done = NULL;                                         \
+	     }))
+
+/*
+ * igt_address_of - construct an igt_address for a buffer object.
+ *
+ * @buf:          intel_buf owning the BO
+ * @bo_offset:    offset within the BO (e.g. surface[0].offset, cc.offset)
+ * @read_domains: GEM read domains
+ * @write_domain: GEM write domain
+ */
+static inline struct igt_address
+igt_address_of(const struct intel_buf *buf, uint64_t bo_offset,
+	       uint32_t read_domains, uint32_t write_domain)
+{
+	return (struct igt_address){
+		.offset = buf->addr.offset + bo_offset,
+		.handle = buf->handle,
+		.read_domains = read_domains,
+		.write_domain = write_domain,
+		.presumed_offset = buf->addr.offset,
+	};
+}
+
+/*
+ * igt_address_of_batch - construct an igt_address pointing into the
+ * batch buffer itself (e.g. for STATE_BASE_ADDRESS).
+ *
+ * @ibb:          batch buffer
+ * @read_domains: GEM read domains
+ * @write_domain: GEM write domain
+ */
+static inline struct igt_address
+igt_address_of_batch(struct intel_bb *ibb,
+		     uint32_t read_domains, uint32_t write_domain)
+{
+	return (struct igt_address){
+		.offset = ibb->batch_offset,
+		.handle = ibb->handle,
+		.read_domains = read_domains,
+		.write_domain = write_domain,
+		.presumed_offset = ibb->batch_offset,
+	};
+}
+
+#endif /* IGT_GENXML_H */
diff --git a/lib/intel/genxml/igt_genxml_decode.h b/lib/intel/genxml/igt_genxml_decode.h
new file mode 100644
index 000000000..316c4b250
--- /dev/null
+++ b/lib/intel/genxml/igt_genxml_decode.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Batch buffer annotated decode using genxml-generated decode headers.
+ *
+ * Usage:
+ *   igt_genxml_decode_batch(fp, gen, batch_ptr, batch_dwords);
+ *
+ * This dispatches to the appropriate per-gen decode function based on
+ * the gen number.  Each gen's decode header provides command identification
+ * and field-level annotation.
+ */
+
+#ifndef IGT_GENXML_DECODE_H
+#define IGT_GENXML_DECODE_H
+
+#include <stdio.h>
+#include <stdint.h>
+#include "intel_chipset.h"
+
+#include "gen90_decode.h"
+#include "gen110_decode.h"
+#include "gen120_decode.h"
+#include "gen125_decode.h"
+#include "xe2_decode.h"
+#include "xe3_decode.h"
+#include "xe3p_decode.h"
+
+/*
+ * igt_genxml_decode_batch - walk and annotate a batch buffer.
+ *
+ * @fp:            output file
+ * @devid:         PCI device ID (used to select the right gen decoder)
+ * @batch:         pointer to batch buffer dwords
+ * @batch_dwords:  number of dwords in the batch
+ */
+static inline void
+igt_genxml_decode_batch(FILE *fp, uint32_t devid,
+			const uint32_t *batch, unsigned batch_dwords)
+{
+	unsigned gen = intel_gen(devid);
+
+	if (gen >= 35)
+		gfx35_decode_batch(fp, batch, batch_dwords);
+	else if (gen >= 30)
+		gfx30_decode_batch(fp, batch, batch_dwords);
+	else if (gen >= 20)
+		gfx20_decode_batch(fp, batch, batch_dwords);
+	else if (HAS_4TILE(devid) || gen > 12)
+		gfx125_decode_batch(fp, batch, batch_dwords);
+	else if (gen >= 12)
+		gfx12_decode_batch(fp, batch, batch_dwords);
+	else if (gen >= 11)
+		gfx11_decode_batch(fp, batch, batch_dwords);
+	else
+		gfx9_decode_batch(fp, batch, batch_dwords);
+}
+
+#endif /* IGT_GENXML_DECODE_H */
diff --git a/lib/intel/genxml/igt_genxml_defs.h b/lib/intel/genxml/igt_genxml_defs.h
new file mode 100644
index 000000000..3acedf0b1
--- /dev/null
+++ b/lib/intel/genxml/igt_genxml_defs.h
@@ -0,0 +1,335 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2016 Intel Corporation
+ * Copyright © 2025 Intel Corporation
+ *
+ * Self-contained header providing all definitions that genxml-generated
+ * pack headers need.  Replaces Mesa's util/bitpack_helpers.h and
+ * genX_helpers.h so that IGT can use genxml without pulling in Mesa's
+ * build system.
+ */
+
+#ifndef IGT_GENXML_DEFS_H
+#define IGT_GENXML_DEFS_H
+
+#include <assert.h>
+#include <math.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <string.h>
+
+/* -- compiler helpers ----------------------------------------------- */
+
+#ifndef ALWAYS_INLINE
+#define ALWAYS_INLINE inline __attribute__((always_inline))
+#endif
+
+#ifndef ASSERTED
+#ifdef NDEBUG
+#define ASSERTED __attribute__((unused))
+#else
+#define ASSERTED
+#endif
+#endif
+
+#ifndef UNUSED
+#define UNUSED __attribute__((unused))
+#endif
+
+#ifndef CLAMP
+#define CLAMP(x, lo, hi) ((x) < (lo) ? (lo) : ((x) > (hi) ? (hi) : (x)))
+#endif
+
+/* -- bit-field helpers ---------------------------------------------- */
+
+#ifndef BITFIELD64_BIT
+#define BITFIELD64_BIT(b)  (1ull << (b))
+#endif
+
+#ifndef BITFIELD64_MASK
+#define BITFIELD64_MASK(b) \
+	((b) == 64 ? (~0ull) : BITFIELD64_BIT(b) - 1)
+#endif
+
+/* -- int-range helpers (Mesa u_math.h equivalents) ------------------ */
+
+static inline ALWAYS_INLINE int64_t
+u_intN_min(unsigned bits)
+{
+	return -(INT64_C(1) << (bits - 1));
+}
+
+static inline ALWAYS_INLINE int64_t
+u_intN_max(unsigned bits)
+{
+	return (INT64_C(1) << (bits - 1)) - 1;
+}
+
+static inline ALWAYS_INLINE uint64_t
+u_uintN_max(unsigned bits)
+{
+	return (bits == 64) ? UINT64_MAX : (UINT64_C(1) << bits) - 1;
+}
+
+/* -- validation hook (no-op outside Valgrind) ----------------------- */
+
+#ifndef util_bitpack_validate_value
+#define util_bitpack_validate_value(x)
+#endif
+
+/* -- bitpack functions ---------------------------------------------- */
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_ones(uint32_t start, uint32_t end)
+{
+	return (UINT64_MAX >> (64 - (end - start + 1))) << start;
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_uint(uint64_t v, uint32_t start, UNUSED uint32_t end)
+{
+#ifndef NDEBUG
+	const int bits = end - start + 1;
+	if (bits < 64) {
+		const uint64_t max = u_uintN_max(bits);
+		assert(v <= max);
+	}
+#endif
+	util_bitpack_validate_value(v);
+	return v << start;
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_uint_nonzero(uint64_t v, uint32_t start, uint32_t end)
+{
+	assert(v != 0ull);
+	return util_bitpack_uint(v, start, end);
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_sint(int64_t v, uint32_t start, uint32_t end)
+{
+	const int bits = end - start + 1;
+	const uint64_t mask = BITFIELD64_MASK(bits);
+	util_bitpack_validate_value(v);
+#ifndef NDEBUG
+	if (bits < 64) {
+		const int64_t min = u_intN_min(bits);
+		const int64_t max = u_intN_max(bits);
+		assert(min <= v && v <= max);
+	}
+#endif
+	return (v & mask) << start;
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_sint_nonzero(int64_t v, uint32_t start, uint32_t end)
+{
+	assert(v != 0ll);
+	return util_bitpack_sint(v, start, end);
+}
+
+ALWAYS_INLINE static uint32_t
+util_bitpack_float(float v)
+{
+	union { float f; uint32_t dw; } x;
+	util_bitpack_validate_value(v);
+	x.f = v;
+	return x.dw;
+}
+
+ALWAYS_INLINE static uint32_t
+util_bitpack_float_nonzero(float v)
+{
+	assert(v != 0.0f);
+	return util_bitpack_float(v);
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_sfixed(float v, uint32_t start, uint32_t end,
+		    uint32_t fract_bits)
+{
+	const float factor = (1 << fract_bits);
+	const int64_t int_val = llroundf(v * factor);
+	const uint64_t mask = UINT64_MAX >> (64 - (end - start + 1));
+	util_bitpack_validate_value(v);
+#ifndef NDEBUG
+	{
+		const int total_bits = end - start + 1;
+		const float min = u_intN_min(total_bits) / factor;
+		const float max = u_intN_max(total_bits) / factor;
+		assert(min <= v && v <= max);
+	}
+#endif
+	return (int_val & mask) << start;
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_sfixed_clamp(float v, uint32_t start, uint32_t end,
+			  uint32_t fract_bits)
+{
+	const float factor = (1 << fract_bits);
+	const int total_bits = end - start + 1;
+	const float min = u_intN_min(total_bits) / factor;
+	const float max = u_intN_max(total_bits) / factor;
+	const int64_t int_val = llroundf(CLAMP(v, min, max) * factor);
+	const uint64_t mask = UINT64_MAX >> (64 - (end - start + 1));
+	util_bitpack_validate_value(v);
+	return (int_val & mask) << start;
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_sfixed_nonzero(float v, uint32_t start, uint32_t end,
+			    uint32_t fract_bits)
+{
+	assert(v != 0.0f);
+	return util_bitpack_sfixed(v, start, end, fract_bits);
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_ufixed(float v, uint32_t start, ASSERTED uint32_t end,
+		    uint32_t fract_bits)
+{
+	const float factor = (1 << fract_bits);
+	const uint64_t uint_val = llroundf(v * factor);
+	util_bitpack_validate_value(v);
+#ifndef NDEBUG
+	{
+		const int total_bits = end - start + 1;
+		const float min = 0.0f;
+		const float max = u_uintN_max(total_bits) / factor;
+		assert(min <= v && v <= max);
+	}
+#endif
+	return uint_val << start;
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_ufixed_clamp(float v, uint32_t start, ASSERTED uint32_t end,
+			  uint32_t fract_bits)
+{
+	const float factor = (1 << fract_bits);
+	const int total_bits = end - start + 1;
+	const float min = 0.0f;
+	const float max = u_uintN_max(total_bits) / factor;
+	const uint64_t uint_val = llroundf(CLAMP(v, min, max) * factor);
+	util_bitpack_validate_value(v);
+	return uint_val << start;
+}
+
+ALWAYS_INLINE static uint64_t
+util_bitpack_ufixed_nonzero(float v, uint32_t start, uint32_t end,
+			    uint32_t fract_bits)
+{
+	assert(v != 0.0f);
+	return util_bitpack_ufixed(v, start, end, fract_bits);
+}
+
+/* -- address type and combine function ------------------------------ */
+
+struct igt_address {
+	uint64_t offset;          /* full GPU address to pack into dwords */
+	uint32_t handle;          /* GEM handle; 0 = no reloc needed */
+	uint32_t read_domains;
+	uint32_t write_domain;
+	uint64_t presumed_offset; /* BO base address (for computing bo_delta) */
+};
+
+struct intel_bb;
+
+/*
+ * Declared here so __gen_combine_address can call it.
+ * Also declared in intel_batchbuffer.h; suppress the warning
+ * when both headers are included.
+ */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wredundant-decls"
+uint64_t intel_bb_offset_reloc_with_delta(struct intel_bb *ibb,
+					  uint32_t handle,
+					  uint32_t read_domains,
+					  uint32_t write_domain,
+					  uint32_t delta,
+					  uint32_t offset,
+					  uint64_t presumed_offset);
+#pragma GCC diagnostic pop
+
+#define __gen_address_type  struct igt_address
+#define __gen_user_data     struct intel_bb
+
+/*
+ * __gen_combine_address - called by genxml pack functions for every
+ * address field.  If the address carries a GEM handle, automatically
+ * register a relocation with intel_bb.
+ *
+ * @ibb:      batch buffer (passed as __gen_user_data*)
+ * @location: pointer to the dword(s) being written in the batch
+ * @addr:     address descriptor (offset + optional reloc metadata)
+ * @delta:    flag bits that genxml packed below the address field
+ */
+static inline ALWAYS_INLINE uint64_t
+__gen_combine_address(struct intel_bb *ibb,
+		      void *location,
+		      struct igt_address addr, uint32_t delta)
+{
+	if (addr.handle) {
+		uint32_t batch_offset =
+			(uint8_t *)location - (uint8_t *)ibb->batch;
+		uint32_t bo_delta =
+			(uint32_t)(addr.offset - addr.presumed_offset);
+
+		intel_bb_offset_reloc_with_delta(ibb, addr.handle,
+						 addr.read_domains,
+						 addr.write_domain,
+						 bo_delta + delta,
+						 batch_offset,
+						 addr.presumed_offset);
+	}
+
+	return addr.offset + delta;
+}
+
+/* -- validation hook (no-op) ---------------------------------------- */
+
+#ifndef __gen_validate_value
+#define __gen_validate_value(x)
+#endif
+
+/* -- offset helper -------------------------------------------------- */
+
+static inline ALWAYS_INLINE uint64_t
+__gen_offset(uint64_t v, ASSERTED uint32_t start, ASSERTED uint32_t end)
+{
+#ifndef NDEBUG
+	uint64_t mask = (~0ull >> (64 - (end - start + 1))) << start;
+	assert((v & ~mask) == 0);
+#endif
+	__gen_validate_value(v);
+	return v;
+}
+
+static inline ALWAYS_INLINE uint64_t
+__gen_offset_nonzero(uint64_t v, uint32_t start, uint32_t end)
+{
+	assert(v != 0ull);
+	return __gen_offset(v, start, end);
+}
+
+/* -- address helper ------------------------------------------------- */
+
+static inline ALWAYS_INLINE uint64_t
+__gen_address(__gen_user_data *data, void *location,
+	      __gen_address_type address, uint32_t delta,
+	      __attribute__((unused)) uint32_t start, uint32_t end)
+{
+	uint64_t addr_u64 = __gen_combine_address(data, location, address, delta);
+	if (end == 31) {
+		return addr_u64;
+	} else if (end < 63) {
+		const unsigned shift = 63 - end;
+		return (addr_u64 << shift) >> shift;
+	} else {
+		return addr_u64;
+	}
+}
+
+#endif /* IGT_GENXML_DEFS_H */
diff --git a/lib/intel/genxml/intel_genxml.py b/lib/intel/genxml/intel_genxml.py
new file mode 100644
index 000000000..a20e8e0ae
--- /dev/null
+++ b/lib/intel/genxml/intel_genxml.py
@@ -0,0 +1,553 @@
+#!/usr/bin/env python3
+# Copyright © 2019, 2022 Intel Corporation
+# SPDX-License-Identifier: MIT
+
+from __future__ import annotations
+from collections import OrderedDict
+import copy
+import io
+import pathlib
+import os.path
+import re
+import xml.etree.ElementTree as et
+import typing
+
+if typing.TYPE_CHECKING:
+    class Args(typing.Protocol):
+
+        files: typing.List[pathlib.Path]
+        validate: bool
+        quiet: bool
+
+
+def get_filename(element: et.Element) -> str:
+    return element.attrib['filename']
+
+def get_name(element: et.Element) -> str:
+    return element.attrib['name']
+
+def get_value(element: et.Element) -> int:
+    return int(element.attrib['value'], 0)
+
+def get_start(element: et.Element) -> int:
+    attrs = element.attrib
+
+    if 'start' in attrs:
+        return int(attrs['start'], 0)
+
+    dword = int(attrs['dword'])
+    offset = 0
+
+    if 'bits' in attrs:
+        offset = int(attrs['bits'].split(':')[1])
+    elif 'offset_bits' in attrs:
+        offset = int(attrs['offset_bits'])
+
+    return dword * 32 + offset
+
+
+BASE_TYPES = {
+    'address',
+    'offset',
+    'int',
+    'uint',
+    'bool',
+    'float',
+    'mbz',
+    'mbo',
+}
+
+FIXED_PATTERN = re.compile(r"(s|u)(\d+)\.(\d+)")
+
+def is_base_type(name: str) -> bool:
+    return name in BASE_TYPES or FIXED_PATTERN.match(name) is not None
+
+def add_struct_refs(items: typing.OrderedDict[str, bool], node: et.Element) -> None:
+    if node.tag == 'field':
+        if 'type' in node.attrib and not is_base_type(node.attrib['type']):
+            t = node.attrib['type']
+            items[t] = True
+        return
+    if node.tag not in {'struct', 'group'}:
+        return
+    for c in node:
+        add_struct_refs(items, c)
+
+
+class Struct(object):
+    def __init__(self, xml: et.Element):
+        self.xml = xml
+        self.name = xml.attrib['name']
+        self.deps: typing.OrderedDict[str, Struct] = OrderedDict()
+
+    def find_deps(self, struct_dict, enum_dict) -> None:
+        deps: typing.OrderedDict[str, bool] = OrderedDict()
+        add_struct_refs(deps, self.xml)
+        for d in deps.keys():
+            if d in struct_dict:
+                self.deps[d] = struct_dict[d]
+
+    def add_xml(self, items: typing.OrderedDict[str, et.Element]) -> None:
+        for d in self.deps.values():
+            d.add_xml(items)
+        items[self.name] = self.xml
+
+
+# ordering of the various tag attributes
+GENXML_DESC = {
+    'genxml'      : [ 'name', 'gen', ],
+    'import'      : [ 'name', ],
+    'exclude'     : [ 'name', ],
+    'enum'        : [ 'name', 'value', 'prefix', ],
+    'struct'      : [ 'name', 'length', ],
+    'field'       : [ 'name', 'dword', 'bits', 'start', 'end', 'type', 'default', 'prefix', 'nonzero' ],
+    'instruction' : [ 'name', 'bias', 'length', 'engine', ],
+    'value'       : [ 'name', 'value', 'dont_use', ],
+    'group'       : [ 'count', 'dword', 'offset_bits', 'start', 'size', ],
+    'register'    : [ 'name', 'length', 'num', ],
+}
+
+
+def node_validator(old: et.Element, new: et.Element) -> bool:
+    """Compare to ElementTree Element nodes.
+
+    There is no builtin equality method, so calling `et.Element == et.Element` is
+    equivalent to calling `et.Element is et.Element`. We instead want to compare
+    that the contents are the same, including the order of children and attributes
+    """
+    return (
+        # Check that the attributes are the same
+        old.tag == new.tag and
+        old.text == new.text and
+        (old.tail or "").strip() == (new.tail or "").strip() and
+        list(old.attrib.items()) == list(new.attrib.items()) and
+        len(old) == len(new) and
+
+        # check that there are no unexpected attributes
+        set(new.attrib).issubset(GENXML_DESC[new.tag]) and
+
+        # check that the attributes are sorted
+        list(new.attrib) == list(old.attrib) and
+        all(node_validator(f, s) for f, s in zip(old, new))
+    )
+
+
+def process_attribs(elem: et.Element) -> None:
+    valid = GENXML_DESC[elem.tag]
+    # sort and prune attributes
+    elem.attrib = OrderedDict(sorted(((k, v) for k, v in elem.attrib.items() if k in valid),
+                                     key=lambda x: valid.index(x[0])))
+    for e in elem:
+        process_attribs(e)
+
+
+def sort_xml(xml: et.ElementTree) -> None:
+    genxml = xml.getroot()
+
+    imports = xml.findall('import')
+
+    enums = sorted(xml.findall('enum'), key=get_name)
+    enum_dict: typing.Dict[str, et.Element] = {}
+    for e in enums:
+        e[:] = sorted(e, key=get_value)
+        enum_dict[e.attrib['name']] = e
+
+    # Structs are a bit annoying because they can refer to each other. We sort
+    # them alphabetically and then build a graph of dependencies. Finally we go
+    # through the alphabetically sorted list and print out dependencies first.
+    structs = sorted(xml.findall('./struct'), key=get_name)
+    wrapped_struct_dict: typing.Dict[str, Struct] = {}
+    for s in structs:
+        s[:] = sorted(s, key=get_start)
+        ws = Struct(s)
+        wrapped_struct_dict[ws.name] = ws
+
+    for ws in wrapped_struct_dict.values():
+        ws.find_deps(wrapped_struct_dict, enum_dict)
+
+    sorted_structs: typing.OrderedDict[str, et.Element] = OrderedDict()
+    for s in structs:
+        _s = wrapped_struct_dict[s.attrib['name']]
+        _s.add_xml(sorted_structs)
+
+    instructions = sorted(xml.findall('./instruction'), key=get_name)
+    for i in instructions:
+        i[:] = sorted(i, key=get_start)
+
+    registers = sorted(xml.findall('./register'), key=get_name)
+    for r in registers:
+        r[:] = sorted(r, key=get_start)
+
+    new_elems = (imports + enums + list(sorted_structs.values()) +
+                 instructions + registers)
+    for n in new_elems:
+        process_attribs(n)
+    genxml[:] = new_elems
+
+
+# `default_imports` documents which files should be imported for our
+# genxml files. This is only useful if a genxml file does not already
+# include imports.
+#
+# Basically, this allows the genxml_import.py tool used with the
+# --import switch to know which files should be added as an import.
+# (genxml_import.py uses GenXml.add_xml_imports, which relies on
+# `default_imports`.)
+default_imports = OrderedDict([
+    ('gen40.xml', ()),
+    ('gen45.xml', ('gen40.xml',)),
+    ('gen50.xml', ('gen45.xml',)),
+    ('gen60.xml', ('gen50.xml',)),
+    ('gen70.xml', ('gen60.xml',)),
+    ('gen75.xml', ('gen70.xml',)),
+    ('gen80.xml', ('gen75.xml',)),
+    ('gen90.xml', ('gen80.xml',)),
+    ('gen110.xml', ('gen90.xml',)),
+    ('gen120.xml', ('gen110.xml',)),
+    ('gen125.xml', ('gen120.xml',)),
+    ('gen125_rt.xml', ()),
+    ('xe2.xml', ('gen125.xml',)),
+    ('xe2_rt.xml', ('gen125_rt.xml',)),
+    ('xe3.xml', ('xe2.xml',)),
+    ('xe3_rt.xml', ('xe2_rt.xml',)),
+    ('xe3p.xml', ('xe3.xml',)),
+    ('xe3p_rt.xml', ('xe3_rt.xml',)),
+    ])
+known_genxml_files = list(default_imports.keys())
+
+
+def genxml_path_to_key(path):
+    try:
+        return known_genxml_files.index(path.name)
+    except ValueError:
+        return len(known_genxml_files)
+
+
+def sort_genxml_files(files):
+    files.sort(key=genxml_path_to_key)
+
+
+class GenXml(object):
+    def __init__(self, filename, import_xml=False, files=None):
+        if files is not None:
+            self.files = files
+        else:
+            self.files = set()
+        self.filename = pathlib.Path(filename)
+
+        # Assert that the file hasn't already been loaded which would
+        # indicate a loop in genxml imports, and lead to infinite
+        # recursion.
+        assert self.filename not in self.files
+
+        self.files.add(self.filename)
+        self.et = et.parse(self.filename)
+        if import_xml:
+            self.merge_imported()
+
+    def process_imported(self, merge=False, drop_dupes=False):
+        """Processes imported genxml files.
+
+        This helper function scans imported genxml files and has two
+        mutually exclusive operating modes.
+
+        If `merge` is True, then items will be merged into the
+        `self.et` data structure.
+
+        If `drop_dupes` is True, then any item that is a duplicate to
+        an item imported will be droped from the `self.et` data
+        structure. This is used by `self.optimize_xml_import` to
+        shrink the size of the genxml file by reducing duplications.
+
+        """
+        assert merge != drop_dupes
+        orig_elements = set(self.et.getroot())
+        name_and_obj = lambda i: (get_name(i), i)
+        filter_ty = lambda s: filter(lambda i: i.tag == s, orig_elements)
+        filter_ty_item = lambda s: dict(map(name_and_obj, filter_ty(s)))
+
+        # orig_by_tag stores items defined directly in the genxml
+        # file. If a genxml item is defined in the genxml directly,
+        # then any imported items of the same name are ignored.
+        orig_by_tag = {
+            'enum': filter_ty_item('enum'),
+            'struct': filter_ty_item('struct'),
+            'instruction': filter_ty_item('instruction'),
+            'register': filter_ty_item('register'),
+        }
+
+        for item in orig_elements:
+            if item.tag == 'import':
+                assert 'name' in item.attrib
+                filename = os.path.split(item.attrib['name'])
+                exceptions = set()
+                for e in item:
+                    assert e.tag == 'exclude'
+                    exceptions.add(e.attrib['name'])
+                # We should be careful to restrict loaded files to
+                # those under the source or build trees. For now, only
+                # allow siblings of the current xml file.
+                assert filename[0] == '', 'Directories not allowed with import'
+                filename = os.path.join(os.path.dirname(self.filename),
+                                        filename[1])
+                assert os.path.exists(filename), f'{self.filename} {filename}'
+
+                # Here we load the imported genxml file. We set
+                # `import_xml` to true so that any imports in the
+                # imported genxml will be merged during the loading
+                # process.
+                #
+                # The `files` parameter is a set of files that have
+                # been loaded, and it is used to prevent any cycles
+                # (infinite recursion) while loading imported genxml
+                # files.
+                genxml = GenXml(filename, import_xml=True, files=self.files)
+                imported_elements = set(genxml.et.getroot())
+
+                # `to_add` is a set of items that were imported an
+                # should be merged into the `self.et` data structure.
+                # This is only used when the `merge` parameter is
+                # True.
+                to_add = set()
+                # `to_remove` is a set of items that can safely be
+                # imported since the item is equivalent. This is only
+                # used when the `drop_duped` parameter is True.
+                to_remove = set()
+                for i in imported_elements:
+                    if i.tag not in orig_by_tag:
+                        continue
+                    if i.attrib['name'] in exceptions:
+                        continue
+                    if i.attrib['name'] in orig_by_tag[i.tag]:
+                        if merge:
+                            # An item with this same name was defined
+                            # in the genxml directly. There we should
+                            # ignore (not merge) the imported item.
+                            continue
+                    else:
+                        if drop_dupes:
+                            # Since this item is not the imported
+                            # genxml, we can't consider dropping it.
+                            continue
+                    if merge:
+                        to_add.add(i)
+                    else:
+                        assert drop_dupes
+                        orig_element = orig_by_tag[i.tag][i.attrib['name']]
+                        if not node_validator(i, orig_element):
+                            continue
+                        to_remove.add(orig_element)
+
+                if len(to_add) > 0:
+                    # Now that we have scanned through all the items
+                    # in the imported genxml file, if any items were
+                    # found which should be merged, we add them into
+                    # our `self.et` data structure. After this it will
+                    # be as if the items had been directly present in
+                    # the genxml file.
+                    assert len(to_remove) == 0
+                    self.et.getroot().extend(list(to_add))
+                    sort_xml(self.et)
+                elif len(to_remove) > 0:
+                    self.et.getroot()[:] = list(orig_elements - to_remove)
+                    sort_xml(self.et)
+
+    def merge_imported(self):
+        """Merge imported items from genxml imports.
+
+        Genxml <import> tags specify that elements should be brought
+        in from another genxml source file. After this function is
+        called, these elements will become part of the `self.et` data
+        structure as if the elements had been directly included in the
+        genxml directly.
+
+        Items from imported genxml files will be completely ignore if
+        an item with the same name is already defined in the genxml
+        file.
+
+        """
+        self.process_imported(merge=True)
+
+    def flatten_imported(self):
+        """Flattens the genxml to not include any imports
+
+        Essentially this helper will put the `self.et` into a state
+        that includes all imported items directly, and does not
+        contain any <import> tags. This is used by the
+        genxml_import.py with the --flatten switch to "undo" any
+        genxml imports.
+
+        """
+        self.merge_imported()
+        root = self.et.getroot()
+        imports = root.findall('import')
+        for i in imports:
+            root.remove(i)
+
+    def add_xml_imports(self):
+        """Adds imports to the genxml file.
+
+        Using the `default_imports` structure, we add imports to the
+        genxml file.
+
+        """
+        # `imports` is a set of filenames currently imported by the
+        # genxml.
+        imports = self.et.findall('import')
+        imports = set(map(lambda el: el.attrib['name'], imports))
+        new_elements = []
+        self_flattened = copy.deepcopy(self)
+        self_flattened.flatten_imported()
+        old_names = { el.attrib['name'] for el in self_flattened.et.getroot() }
+        for import_xml in default_imports.get(self.filename.name, tuple()):
+            if import_xml in imports:
+                # This genxml is already imported, so we don't need to
+                # add it as an import.
+                continue
+            el = et.Element('import', {'name': import_xml})
+            import_path = self.filename.with_name(import_xml)
+            imported_genxml = GenXml(import_path, import_xml=True)
+            imported_names = { el.attrib['name']
+                               for el in imported_genxml.et.getroot()
+                               if el.tag != 'import' }
+            # Importing this genxml could add some new items. When
+            # adding a genxml import, we don't want to add new items,
+            # unless they were already in the current genxml. So, we
+            # put them into a list of items to exclude when importing
+            # the genxml.
+            exclude_names = imported_names - old_names
+            for n in sorted(exclude_names):
+                el.append(et.Element('exclude', {'name': n}))
+            new_elements.append(el)
+        if len(new_elements) > 0:
+            self.et.getroot().extend(new_elements)
+            sort_xml(self.et)
+
+    def optimize_xml_import(self):
+        """Optimizes the genxml by dropping items that can be imported
+
+        Scans genxml <import> tags, and loads the imported file. If
+        any item in the imported file is a duplicate to an item in the
+        genxml file, then it will be droped from the `self.et` data
+        structure.
+
+        """
+        self.process_imported(drop_dupes=True)
+
+    def filter_engines(self, engines):
+        changed = False
+        items = []
+        for item in self.et.getroot():
+            # When an instruction doesn't have the engine specified,
+            # it is considered to be for all engines. Otherwise, we
+            # check to see if it's tagged for the engines requested.
+            if item.tag == 'instruction' and 'engine' in item.attrib:
+                i_engines = set(item.attrib["engine"].split('|'))
+                if not (i_engines & engines):
+                    # Drop this instruction because it doesn't support
+                    # the requested engine types.
+                    changed = True
+                    continue
+            items.append(item)
+        if changed:
+            self.et.getroot()[:] = items
+
+    def filter_symbols(self, symbol_list):
+        symbols_allowed = {}
+        for sym in symbol_list:
+            symbols_allowed[sym] = sym
+
+        changed = False
+        items = []
+        for item in self.et.getroot():
+            if item.tag in ('instruction', 'struct', 'register') and \
+               item.attrib['name'] not in symbols_allowed:
+                # Drop the item from the tree
+                changed = True
+                continue
+            items.append(item)
+        if changed:
+            self.et.getroot()[:] = items
+
+    def sort(self):
+        sort_xml(self.et)
+
+    def sorted_copy(self):
+        clone = copy.deepcopy(self)
+        clone.sort()
+        return clone
+
+    def is_equivalent_xml(self, other):
+        if len(self.et.getroot()) != len(other.et.getroot()):
+            return False
+        return all(node_validator(old, new)
+                   for old, new in zip(self.et.getroot(), other.et.getroot()))
+
+    def normalize_to_old_bits_format(self):
+        def convert_elem(elem):
+            attrs = elem.attrib
+            if elem.tag == 'field' and 'dword' in attrs and 'bits' in attrs:
+                dword = int(attrs['dword'])
+                end_bit, start_bit = map(int, attrs['bits'].split(':'))
+
+                attrs['start'] = str(dword * 32 + start_bit)
+                attrs['end'] = str(dword * 32 + end_bit)
+
+                attrs.pop('dword', None)
+                attrs.pop('bits', None)
+
+            elif elem.tag == 'group' and 'dword' in attrs:
+                dword = int(attrs['dword'])
+                offset_bits = int(attrs.get('offset_bits', 0))
+
+                attrs['start'] = str(dword * 32 + offset_bits)
+
+                attrs.pop('dword', None)
+                attrs.pop('offset_bits', None)
+
+            for child in elem:
+                convert_elem(child)
+        convert_elem(self.et.getroot())
+
+    def normalize_to_new_bits_format(self):
+        def convert_elem(elem):
+            attrs = elem.attrib
+            if elem.tag == 'field' and 'start' in attrs and 'end' in attrs:
+                dword, start = divmod(int(attrs['start']), 32)
+                end = int(attrs['end']) - (dword * 32)
+
+                attrs['dword'] = str(dword)
+                attrs['bits'] = f"{end}:{start}"
+
+                attrs.pop('start', None)
+                attrs.pop('end', None)
+
+            elif elem.tag == 'group' and 'start' in attrs:
+                dword, offset_bits = divmod(int(attrs['start']), 32)
+
+                attrs['dword'] = str(dword)
+                if offset_bits:
+                    attrs['offset_bits'] = str(offset_bits)
+
+                attrs.pop('start', None)
+
+            for child in elem:
+                convert_elem(child)
+        convert_elem(self.et.getroot())
+
+    def write_file(self):
+        try:
+            old_genxml = GenXml(self.filename)
+            if self.is_equivalent_xml(old_genxml):
+                return
+        except Exception:
+            pass
+
+        b_io = io.BytesIO()
+        et.indent(self.et, space='  ')
+        self.et.write(b_io, encoding="utf-8", xml_declaration=True)
+        b_io.write(b'\n')
+
+        tmp = self.filename.with_suffix(f'{self.filename.suffix}.tmp')
+        tmp.write_bytes(b_io.getvalue())
+        tmp.replace(self.filename)
diff --git a/lib/intel/genxml/util.py b/lib/intel/genxml/util.py
new file mode 100644
index 000000000..81906b724
--- /dev/null
+++ b/lib/intel/genxml/util.py
@@ -0,0 +1,39 @@
+#encoding=utf-8
+# SPDX-License-Identifier: MIT
+#
+# Copyright © 2020 Intel Corporation
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice (including the next
+# paragraph) shall be included in all copies or substantial portions of the
+# Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+# IN THE SOFTWARE.
+#
+
+# A few utility functions reused across genxml scripts
+
+import re
+
+alphanum_nono = re.compile(r'[ /\[\]()\-:.,=>#&*\'"+\\]+')
+def to_alphanum(name):
+    global alphanum_nono
+    return alphanum_nono.sub('', name)
+
+def safe_name(name):
+    name = to_alphanum(name)
+    if not name[0].isalpha():
+        name = '_' + name
+    return name
diff --git a/lib/meson.build b/lib/meson.build
index 0e7efadf3..ac8d94b3e 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -290,13 +290,62 @@ foreach f: iga64_assembly_sources
 	)
 endforeach
 
+# genxml pack-header generation
+genxml_gen_deps = files(
+    'intel/genxml/gen_pack_header.py',
+    'intel/genxml/gen_decode_header.py',
+    'intel/genxml/intel_genxml.py',
+    'intel/genxml/util.py',
+)
+
+# Ordered list of all gens, oldest first.  Each gen's baselines are all
+# the gens that precede it.  Items unchanged since their introduction are
+# omitted from the generated header; the comment points directly to the
+# oldest gen that defined that layout so that a developer can find the
+# real struct in one grep.
+genxml_gens = []
+
+genxml_pack_headers = []
+genxml_decode_headers = []
+genxml_prev_gens = []
+foreach gen : genxml_gens
+    cmd = [python3, '@INPUT@', '--engines=render,blitter,compute']
+    decode_cmd = [python3, '@INPUT@', '--engines=render,blitter,compute']
+    foreach baseline : genxml_prev_gens
+        cmd += ['--baseline',
+                meson.current_source_dir() / 'intel' / 'genxml' / baseline + '.xml']
+        decode_cmd += ['--baseline',
+                       meson.current_source_dir() / 'intel' / 'genxml' / baseline + '.xml']
+    endforeach
+    genxml_prev_gens += gen
+    genxml_pack_headers += custom_target(gen + '_pack.h',
+        input : ['intel/genxml/gen_pack_header.py', 'intel/genxml/' + gen + '.xml'],
+        output : gen + '_pack.h',
+        command : cmd,
+        capture : true,
+        depend_files : genxml_gen_deps,
+    )
+    genxml_decode_headers += custom_target(gen + '_decode.h',
+        input : ['intel/genxml/gen_decode_header.py', 'intel/genxml/' + gen + '.xml'],
+        output : gen + '_decode.h',
+        command : decode_cmd,
+        capture : true,
+        depend_files : genxml_gen_deps,
+    )
+endforeach
+
+genxml_dep = declare_dependency(
+    sources : genxml_pack_headers + genxml_decode_headers,
+    include_directories : include_directories('.'),
+)
+
 lib_intermediates = []
 foreach f: lib_sources
     name = f.underscorify()
     lib = static_library('igt-' + name,
 	[ f, lib_version ],
 	include_directories: inc,
-	dependencies : lib_deps,
+	dependencies : lib_deps + [genxml_dep],
 	c_args : [
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
-- 
2.34.1

