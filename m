Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7FBECD9B0
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 01:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5323310E1FF;
	Fri,  6 Feb 2026 01:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUz3eVpf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7665210E1FF
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 01:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770339968; x=1801875968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vh62VmiTrmIU9m/I94vmS9zQIZI6W0N7pQDUbw+4FpI=;
 b=hUz3eVpfi844uZ0SSW5MoUgEGM0buZEyqPGizqshHot+Hzc+WxKV2UG3
 IV+waEuim2lbdgfClrUVkYM5Dx5SJRi54db0xgv4F/IQO7T+AxYkUX1L2
 jI2z1xwHzA6ROM3COOmhFXK/jMVUB9KUvOh7aFUsmoRI7iSIiorkcaleC
 RfobaV7LZv/LkLy6EQykfXQwkcmpNQhnvigOI7gcMex1jMybNqNjsfejD
 ANIyzX7FFsWbQml7vKY6rmcowKLm+tArKHGs0UWk2ZCOEw0yte8IVMyUM
 UvpAnKGaoM+l4fU5T8nAOcJF8uy+9cDw5/CE98ZfX6ipLFP8Sg3mMPFGL Q==;
X-CSE-ConnectionGUID: On6BaNP7SYCwqToIeYhgew==
X-CSE-MsgGUID: 5GpgCBPnRvai4R/Xlqs7fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82919036"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82919036"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:06:08 -0800
X-CSE-ConnectionGUID: /TY19uaUSSasb96eh54W+A==
X-CSE-MsgGUID: DFljH3JLReCkveis9wZfjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="215223724"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:06:07 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 2/4] scripts: add scripts to support api reference
 docs
Date: Fri,  6 Feb 2026 02:05:49 +0100
Message-ID: <20260206010551.267237-3-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206010551.267237-1-pawel.sikora@intel.com>
References: <20260206010551.267237-1-pawel.sikora@intel.com>
MIME-Version: 1.0
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

Add list_of_tests_to_md.py to generate list of tests
and update it in specified markdown file.

Add update_igt_version_in_docs.py to update IGT version
in docs/api_reference.md placeholder: <IGT_GPU_TOOLS_VERSION>.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 scripts/list_of_tests_to_md.py        | 250 ++++++++++++++++++++++++++
 scripts/update_igt_version_in_docs.py |  75 ++++++++
 2 files changed, 325 insertions(+)
 create mode 100644 scripts/list_of_tests_to_md.py
 create mode 100644 scripts/update_igt_version_in_docs.py

diff --git a/scripts/list_of_tests_to_md.py b/scripts/list_of_tests_to_md.py
new file mode 100644
index 000000000..53cd76455
--- /dev/null
+++ b/scripts/list_of_tests_to_md.py
@@ -0,0 +1,250 @@
+#!/usr/bin/env python3
+"""
+list_of_tests_to_md.py - Parse C test files and generate markdown docs
+
+Extracts SUBTEST comments from C source files and builds markdown tables.
+"""
+
+import os
+import re
+import argparse
+from pathlib import Path
+
+SKIP_DIRS = ['.git', 'build', 'node_modules', '__pycache__']
+
+def parse_subtest_block(comment_text):
+    """Parse a single SUBTEST block and return (name, desc) or None"""
+    if 'SUBTEST:' not in comment_text:
+        return None
+
+    match = re.search(r'SUBTEST:\s*([^\n*]+)', comment_text)
+    if not match:
+        return None
+    test_name = match.group(1).strip()
+
+    desc_match = re.search(
+        r'Description:\s*([^\n]+(?:\n\s*\*\s*(?!SUBTEST:|arg\[|\*\s*@|Sub-category:|Feature:)[^\n]+)*)',
+        comment_text,
+        re.MULTILINE
+    )
+
+    if not desc_match:
+        return None
+
+    desc = desc_match.group(1)
+
+    desc = re.sub(r'\s*\n\s*\*\s*', ' ', desc)
+    desc = re.sub(r'^\*\s*', '', desc)  # Remove leading asterisk
+    desc = re.sub(r'\s+', ' ', desc).strip()
+
+    stop_markers = [
+        ' *', '\n *', ' arg[', '\narg[',
+        'Sub-category:', 'Feature:', 
+        '\nSub-category:', '\nFeature:'
+    ]
+
+    for marker in stop_markers:
+        if marker in desc:
+            desc = desc.split(marker)[0].strip()
+
+    desc = desc.rstrip('.,;: /')
+
+    return (test_name, desc)
+
+
+def extract_tests_from_file(filepath):
+    """Read a C file and extract all SUBTEST entries"""
+    tests = []
+
+    try:
+        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
+            content = f.read()
+    except:
+        return tests
+
+    comments = re.findall(r'/\*\*.*?\*/', content, re.DOTALL)
+
+    for comment in comments:
+        if 'SUBTEST:' not in comment:
+            continue
+
+        parts = re.split(r'(?=\s*\*\s*SUBTEST:)', comment)
+
+        for part in parts:
+            result = parse_subtest_block(part)
+            if result:
+                tests.append(result)
+
+    return tests
+
+
+def find_c_files(start_dir, skip_dirs=None):
+    """Walk directory tree and collect .c files"""
+    if skip_dirs is None:
+        skip_dirs = SKIP_DIRS
+
+    c_files = []
+    start_path = Path(start_dir)
+
+    for item in start_path.rglob('*.c'):
+        skip = False
+        for skip_dir in skip_dirs:
+            if skip_dir in item.parts:
+                skip = True
+                break
+
+        if not skip:
+            c_files.append(str(item))
+
+    return sorted(c_files)
+
+
+def make_relative_path(filepath, base_dir):
+    """Convert to relative path and strip extension"""
+    p = Path(filepath)
+    base = Path(base_dir)
+
+    try:
+        rel = p.relative_to(base)
+    except ValueError:
+        rel = p
+
+    return str(rel.with_suffix(''))
+
+
+def build_markdown_table(tests):
+    """Format test data as markdown table"""
+    if not tests:
+        return ""
+
+    lines = ["| TEST | DESCRIPTION |", "|------|-------------|"]
+
+    for name, desc in tests:
+        name = name.replace('|', '\\|')
+        desc = desc.replace('|', '\\|')
+        lines.append(f"| {name} | {desc} |")
+
+    return '\n'.join(lines)
+
+
+def write_to_markdown(md_file, text):
+    """Append text to markdown file"""
+    md_path = Path(md_file)
+    md_path.parent.mkdir(parents=True, exist_ok=True)
+
+    if md_path.exists() and md_path.stat().st_size > 0:
+        text = '\n\n' + text
+
+    with open(md_file, 'a', encoding='utf-8') as f:
+        f.write(text)
+
+
+def extract_vendor_testset(rel_path):
+    """Extract vendor and test set from relative path"""
+    vendor = None
+    test_set = None
+
+    if '/' in rel_path:
+        parts = rel_path.split('/', 1)
+        vendor = parts[0]
+        test_set = parts[1]
+    else:
+        if '_' in rel_path:
+            vendor = rel_path.split('_', 1)[0]
+            test_set = rel_path.split('_', 1)[1]
+        else:
+            vendor = rel_path
+            test_set = rel_path
+
+    return vendor, test_set
+
+
+def main():
+
+    parser = argparse.ArgumentParser(description='Extract test docs from C files')
+    parser.add_argument('-d', '--dir', default='.', help='source directory')
+    parser.add_argument('-o', '--output', default='tests_documentation.md', 
+                       help='output markdown file')
+    parser.add_argument('-e', '--exclude', action='append', 
+                       help='additional dirs to skip')
+    parser.add_argument('--clear', action='store_true', 
+                       help='clear output file first')
+
+    args = parser.parse_args()
+
+    if args.clear and Path(args.output).exists():
+        Path(args.output).unlink()
+
+    skip_list = SKIP_DIRS.copy()
+    if args.exclude:
+        skip_list.extend(args.exclude)
+
+    c_files = find_c_files(args.dir, skip_list)
+
+    print(f"Found {len(c_files)} C files")
+
+    vendor_testset_map = {}
+
+    for c_file in c_files:
+        tests = extract_tests_from_file(c_file)
+        if not tests:
+            continue
+
+        rel_path = make_relative_path(c_file, args.dir)
+
+        if '/' in rel_path:
+            vendor, test_set = rel_path.split('/', 1)
+        elif '_' in rel_path:
+            vendor, test_set = rel_path.split('_', 1)
+        else:
+            vendor = test_set = rel_path
+
+        key = (vendor, test_set)
+        if key not in vendor_testset_map:
+            vendor_testset_map[key] = []
+
+        vendor_testset_map[key].extend(t[0] for t in tests)
+
+    if vendor_testset_map:
+        lines = [
+            "## Test Modules by Category\n",
+            "| Vendor | Test Set | Count | Test List |",
+            "|--------|----------|-------|-----------|"
+        ]
+
+        for (vendor, test_set), test_names in sorted(vendor_testset_map.items()):
+            count = len(test_names)
+            test_list = ', '.join(test_names)
+            lines.append(f"| {vendor} | {test_set} | {count} | {test_list} |")
+
+        write_to_markdown(args.output, '\n'.join(lines) + '\n\n')
+
+    tests_list = "## Tests list per module\n\n"
+
+    write_to_markdown(args.output, tests_list)
+
+    file_count = 0
+    test_count = 0
+
+    for c_file in c_files:
+        tests = extract_tests_from_file(c_file)
+
+        if not tests:
+            continue
+
+        file_count += 1
+        test_count += len(tests)
+
+        rel_path = make_relative_path(c_file, args.dir)
+        section = f"### {rel_path}\n\n"
+        table = build_markdown_table(tests)
+
+        write_to_markdown(args.output, section + table)
+        print(f"  {rel_path}: {len(tests)} tests")
+
+    print(f"\nProcessed {file_count} files, {test_count} tests total")
+    print(f"Output: {args.output}")
+
+
+if __name__ == '__main__':
+    main()
diff --git a/scripts/update_igt_version_in_docs.py b/scripts/update_igt_version_in_docs.py
new file mode 100644
index 000000000..96ee66c9d
--- /dev/null
+++ b/scripts/update_igt_version_in_docs.py
@@ -0,0 +1,75 @@
+#!/usr/bin/env python3
+"""
+Update version in markdown file from version file.
+
+Reads version from a file (e.g., meson.build) and updates
+<IGT_GPU_TOOLS_VERSION> placeholder in test.md
+"""
+
+import re
+import sys
+
+
+def extract_version(version_file):
+    """Extract version number from file with format: version : 'X.Y'"""
+    try:
+        with open(version_file, 'r') as f:
+            content = f.read()
+
+        match = re.search(r"version\s*:\s*'([^']+)'", content)
+
+        if match:
+            return match.group(1)
+
+        print(f"Error: No version found in {version_file}")
+        return None
+
+    except FileNotFoundError:
+        print(f"Error: File {version_file} not found")
+        return None
+    except Exception as e:
+        print(f"Error reading {version_file}: {e}")
+        return None
+
+
+def update_markdown(md_file, version):
+    """Replace <IGT_GPU_TOOLS_VERSION> with actual version in markdown file"""
+    try:
+        with open(md_file, 'r') as f:
+            content = f.read()
+
+        updated_content = content.replace('<IGT_GPU_TOOLS_VERSION>', version)
+
+        # Write back
+        with open(md_file, 'w') as f:
+            f.write(updated_content)
+
+        print(f"Updated {md_file} with version {version}")
+        return True
+
+    except FileNotFoundError:
+        print(f"Error: File {md_file} not found")
+        return False
+    except Exception as e:
+        print(f"Error updating {md_file}: {e}")
+        return False
+
+
+def main():
+    version_file = 'meson.build'
+    md_file = 'docs/api_reference.md'
+
+    version = extract_version(version_file)
+    if not version:
+        sys.exit(1)
+
+    print(f"Found version: {version}")
+
+    if update_markdown(md_file, version):
+        print("Success!")
+    else:
+        sys.exit(1)
+
+
+if __name__ == '__main__':
+    main()
-- 
2.51.0

