Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9632C10E72B
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 07:20:23 +0000 (UTC)
Date: Fri, 1 Sep 2023 09:20:19 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230901092019.44f35b7e@maurocar-mobl2>
In-Reply-To: <20230901051808.1369104-1-bhanuprakash.modem@intel.com>
References: <20230901051808.1369104-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] scripts/test_list: Allow unrecognized
 field:values in testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  1 Sep 2023 10:48:08 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> As non-Intel vendors also contributing to KMS tests, allow
> them to re-use the existing testplan documentation along with
> their own definitions of field:values pair in test config json.
> 
> Instead of aborting, just throw a warning about this unrecognized
> field:values.
> 
> Example:
> tests/kms_color.c:994: Warning: unrecognized field in tests/kms_test_config.json  ==> Foo: bla

IMO, there's no need to to that. I mean, if someone wants to add
a new field, he can just patch tests/kms_test_config.json, adding the
new "Foo" field at kms_test_config.json:

diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
index 9219ae4ebd9d..1dfca84dd73c 100644
--- a/tests/kms_test_config.json
+++ b/tests/kms_test_config.json
@@ -35,6 +35,7 @@
                 "description": "Defines the test category. Usually used at subtest level."
             }
         },
+        "Foo" : { },
         "Description" : {
             "_properties_": {
                 "description": "Provides a description for the test/subtest."

NOTE: It would probably make sense to add a description to it, to make
clear what such "Foo" field means, in a similar way to the descriptions
added to the other fields.

As the fields are optional, this won't require any changes at the
existing tests, and will provide an extra benefit that the meaning of
the "Foo" field can be documented via _properties_/description field.

Regards,
Mauro

> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  scripts/test_list.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 0bcc96869..517c4d067 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1219,8 +1219,8 @@ class TestList:
>                      continue
>  
>                  file_line.rstrip(r"\n")
> -                sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
> -                         (self.config_fname, file_line))
> +                print(f"{'/'.join(fname.split('/')[-2:])}:{file_ln + 1}: Warning: unrecognized field in %s ==> %s" %
> +                        ('/'.join(self.config_fname.split('/')[-2:]), file_line))
>  
>      def show_subtests(self, sort_field):
>  
