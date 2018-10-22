Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4072F8970B
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Oct 2018 16:33:01 +0000 (UTC)
References: <1540218229-10693-1-git-send-email-ramalingam.c@intel.com>
 <154022033346.18004.2527162657381368877@skylake-alporthouse-com>
From: "C, Ramalingam" <ramalingam.c@intel.com>
Message-ID: <7c51dfc8-835b-c5f3-8ad1-f7e930c8c967@intel.com>
Date: Mon, 22 Oct 2018 22:02:56 +0530
MIME-Version: 1.0
In-Reply-To: <154022033346.18004.2527162657381368877@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/2] lib/debugfs: connector debugfs
 director
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0115626566=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, daniel.vetter@ffwll.ch, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0115626566==
Content-Type: multipart/alternative;
 boundary="------------B9B443D8E0E1205075A0C33D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B9B443D8E0E1205075A0C33D
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit


On 10/22/2018 8:28 PM, Chris Wilson wrote:
> Quoting Ramalingam C (2018-10-22 15:23:48)
>> Function to open a debugfs director of a connector associated to
>> a device.
>>
>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>> ---
>>   lib/igt_debugfs.c | 24 ++++++++++++++++++++++++
>>   lib/igt_debugfs.h |  1 +
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
>> index baedc2255ac9..f545e8a3eec9 100644
>> --- a/lib/igt_debugfs.c
>> +++ b/lib/igt_debugfs.c
>> @@ -237,6 +237,30 @@ int igt_debugfs_dir(int device)
>>   }
>>   
>>   /**
>> + * igt_debugfs_connector_dir:
>> + * @device: fd of the device
>> + * @conn_name: conenctor name
>> + *
>> + * This opens the debugfs directory corresponding to connector on the device
>> + * for use with igt_sysfs_get() and related functions.
>> + *
>> + * Returns:
>> + * The directory fd, or -1 on failure.
>> + */
>> +int igt_debugfs_connector_dir(int device, char *conn_name)
>> +{
>> +       char path[200], base_path[200];
>> +
>> +       if (!igt_debugfs_path(device, base_path, sizeof(base_path)))
>> +               return -1;
> Why not use the debugfs_dir and openat? String ops not required.

Chris,

Do you mean this way?

int igt_debugfs_connector_dir(int device, char *conn_name)
{
         int dir, ret;
                                                                                 
         dir = igt_debugfs_dir(device);
         if (dir < 0)
                 return dir;
                                                                                 
         ret = openat(dir, conn_name, O_RDONLY);
                                                                                 
         close(dir);
                                                                                 
         return ret;
}

--Ram

> -Chris

--------------B9B443D8E0E1205075A0C33D
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/22/2018 8:28 PM, Chris Wilson
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:154022033346.18004.2527162657381368877@skylake-alporthouse-com">
      <pre class="moz-quote-pre" wrap="">Quoting Ramalingam C (2018-10-22 15:23:48)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Function to open a debugfs director of a connector associated to
a device.

Signed-off-by: Ramalingam C <a class="moz-txt-link-rfc2396E" href="mailto:ramalingam.c@intel.com">&lt;ramalingam.c@intel.com&gt;</a>
---
 lib/igt_debugfs.c | 24 ++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index baedc2255ac9..f545e8a3eec9 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -237,6 +237,30 @@ int igt_debugfs_dir(int device)
 }
 
 /**
+ * igt_debugfs_connector_dir:
+ * @device: fd of the device
+ * @conn_name: conenctor name
+ *
+ * This opens the debugfs directory corresponding to connector on the device
+ * for use with igt_sysfs_get() and related functions.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_debugfs_connector_dir(int device, char *conn_name)
+{
+       char path[200], base_path[200];
+
+       if (!igt_debugfs_path(device, base_path, sizeof(base_path)))
+               return -1;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why not use the debugfs_dir and openat? String ops not required.</pre>
    </blockquote>
    <pre>Chris,
</pre>
    <pre>Do you mean this way?
</pre>
    <pre>int igt_debugfs_connector_dir(int device, char *conn_name)                      
{                                                                               
        int dir, ret;                                                           
                                                                                
        dir = igt_debugfs_dir(device);                                          
        if (dir &lt; 0)                                                            
                return dir;                                                     
                                                                                
        ret = openat(dir, conn_name, O_RDONLY);                                 
                                                                                
        close(dir);                                                             
                                                                                
        return ret;                                                             
} 
</pre>
    <pre>--Ram
</pre>
    <blockquote type="cite"
cite="mid:154022033346.18004.2527162657381368877@skylake-alporthouse-com">
      <pre class="moz-quote-pre" wrap="">
-Chris
</pre>
    </blockquote>
  </body>
</html>

--------------B9B443D8E0E1205075A0C33D--

--===============0115626566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0115626566==--
