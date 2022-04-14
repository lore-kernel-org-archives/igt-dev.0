Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 14 Apr 2022 07:28:26 -0000
Message-ID: <164992130625.1346.4129364292718299284@emeril.freedesktop.org>
References: <cover.1649753814.git.mchehab@kernel.org>
In-Reply-To: <cover.1649753814.git.mchehab@kernel.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBjb2Rl?=
 =?utf-8?q?_coverage=3A_some_improvements_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: code coverage: some improvements (rev3)
URL   : https://patchwork.freedesktop.org/series/102136/
State : failure

== Summary ==

Applying: scripts/code_cov*: remove the extensions from them
Applying: scripts/code_cov_parse_info: add a tool to parse code coverage info files
Applying: scripts/code_cov_gen_report: add support for filtering info files
Applying: runner: execute code coverage script also from PATH
Applying: scripts/meson.build: install code coverage scripts
Applying: scripts/code_cov_selftest.sh: test if IGT code coverage is working
Applying: docs/code_coverage.md: document the code coverage filter script
Applying: scripts/code_cov_parse_info: better handle test name
Applying: code_cov_parse_info: fix error handling when opening files
Applying: code_cov_parse_info: fix --show-lines logic
Applying: code_cov_parse_info: add support for exclude filters
Using index info to reconstruct a base tree...
M	scripts/code_cov_parse_info
Falling back to patching base and 3-way merge...
Auto-merging scripts/code_cov_parse_info
CONFLICT (content): Merge conflict in scripts/code_cov_parse_info
Patch failed at 0011 code_cov_parse_info: add support for exclude filters
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

