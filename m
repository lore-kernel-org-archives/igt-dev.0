Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Fri, 30 Jun 2023 12:30:36 -0000
Message-ID: <168812823638.24870.4754189752712370674@emeril.freedesktop.org>
References: <20230630110426.23829-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230630110426.23829-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/xe/xe=5Fexec=5Fstore=3A_Add_xe=5Fexec=5Fstore_test_to_chec?=
 =?utf-8?q?k_store_dword_functionality?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/xe/xe_exec_store: Add xe_exec_store test to check store dword functionality
URL   : https://patchwork.freedesktop.org/series/120062/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/923324 for the overview.

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44735872):
      ],
      "Created": "2021-01-22T08:26:53.390348642Z",
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:04854e5e3796b945522a085073b5a49cadad51bd1c5414c91654fa3d63d8db4d"
      ]
  }
  Skipping, already built
  Getting image source signatures
  Copying blob sha256:04854e5e3796b945522a085073b5a49cadad51bd1c5414c91654fa3d63d8db4d
  time="2023-06-30T12:27:58Z" level=fatal msg="Error reading config blob sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448: Get https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-mips/blobs/sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448: dial tcp: lookup registry.freedesktop.org on 147.75.207.208:53: read udp 10.88.97.131:57074->147.75.207.208:53: i/o timeout" 
  section_end:1688128078:step_script
  section_start:1688128078:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688128079:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/923324
